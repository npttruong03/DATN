const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const cors = require('cors');

const app = express();
app.use(cors({
  origin: process.env.FRONTEND_URL || "http://localhost:5173",
  credentials: true
}));

const server = http.createServer(app);
const io = new Server(server, {
  cors: {
    origin: process.env.FRONTEND_URL || "http://localhost:5173",
    methods: ["GET", "POST"],
    credentials: true
  }
});

// Store user socket connections: userId -> socketId
const userSockets = new Map();

io.on('connection', (socket) => {
  // User joins with their user ID
  socket.on('join', (userId) => {
    if (userId) {
      const userIdStr = userId.toString();
      
      // Disconnect old socket if user already has a connection
      const oldSocketId = userSockets.get(userIdStr);
      if (oldSocketId && oldSocketId !== socket.id) {
        const oldSocket = io.sockets.sockets.get(oldSocketId);
        if (oldSocket) {
          oldSocket.disconnect(true);
        }
      }
      
      userSockets.set(userIdStr, socket.id);
      socket.userId = userIdStr;
      // Emit joined event to confirm
      socket.emit('joined');
    }
  });

  // Handle private message
  socket.on('private-message', (data) => {
    const { receiverId, message } = data;
    
    // Ensure sender ID is set - use message.sender_id if socket.userId is not set
    const senderId = socket.userId || message.sender_id;
    if (!senderId) {
      return;
    }
    
    const receiverSocketId = userSockets.get(receiverId.toString());
    
    if (receiverSocketId) {
      // Normalize message: ensure both senderId and sender_id exist
      const normalizedMessage = {
        ...message,
        senderId: senderId.toString(),
        sender_id: message.sender_id || senderId.toString()
      };
      io.to(receiverSocketId).emit('new-message', normalizedMessage);
    }
  });

  // Handle message read
  socket.on('message-read', (data) => {
    const { senderId, messageId } = data;
    const senderSocketId = userSockets.get(senderId.toString());
    
    if (senderSocketId) {
      io.to(senderSocketId).emit('message-read', {
        messageId,
        readBy: socket.userId
      });
    }
  });

  // Handle disconnect
  socket.on('disconnect', () => {
    if (socket.userId) {
      // Only delete if this is still the active socket for this user
      const currentSocketId = userSockets.get(socket.userId);
      if (currentSocketId === socket.id) {
        userSockets.delete(socket.userId);
      }
    }
  });
});

// HTTP endpoint for Laravel to emit events
app.use(express.json());

app.post('/emit', (req, res) => {
  const { event, data, userId } = req.body;
  
  if (userId) {
    const socketId = userSockets.get(userId.toString());
    if (socketId) {
      // Normalize message data: ensure both sender_id and senderId exist for compatibility
      let normalizedData = data;
      if (event === 'new-message' && data) {
        normalizedData = {
          ...data,
          senderId: data.senderId || data.sender_id,
          sender_id: data.sender_id || data.senderId
        };
      }
      io.to(socketId).emit(event, normalizedData);
      res.json({ success: true, message: 'Event emitted' });
    } else {
      res.json({ success: false, message: 'User not connected' });
    }
  } else {
    res.json({ success: false, message: 'User ID required' });
  }
});

// HTTP endpoint for Laravel to emit notification events
app.post('/emit-notification', (req, res) => {
  const { userId, notification } = req.body;
  
  if (userId) {
    const socketId = userSockets.get(userId.toString());
    if (socketId) {
      io.to(socketId).emit('new-notification', notification);
      res.json({ success: true, message: 'Notification emitted' });
    } else {
      res.json({ success: false, message: 'User not connected' });
    }
  } else {
    res.json({ success: false, message: 'User ID required' });
  }
});

const PORT = process.env.PORT || 6001;
server.listen(PORT, () => {
  console.log(`WebSocket server running on port ${PORT}`);
});
