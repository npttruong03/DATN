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
  console.log('User connected:', socket.id);

  // User joins with their user ID
  socket.on('join', (userId) => {
    if (userId) {
      userSockets.set(userId.toString(), socket.id);
      socket.userId = userId.toString();
      console.log(`User ${userId} joined with socket ${socket.id}`);
    }
  });

  // Handle private message
  socket.on('private-message', (data) => {
    const { receiverId, message } = data;
    const receiverSocketId = userSockets.get(receiverId.toString());
    
    if (receiverSocketId) {
      io.to(receiverSocketId).emit('new-message', {
        ...message,
        senderId: socket.userId
      });
      console.log(`Message sent from ${socket.userId} to ${receiverId}`);
    } else {
      console.log(`User ${receiverId} is not connected`);
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
      userSockets.delete(socket.userId);
      console.log(`User ${socket.userId} disconnected`);
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
      io.to(socketId).emit(event, data);
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
