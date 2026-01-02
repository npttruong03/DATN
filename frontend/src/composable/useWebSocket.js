import { ref, onUnmounted } from 'vue'
import { io } from 'socket.io-client'
import { useAuth } from './useAuth'

const websocketUrl = import.meta.env.VITE_WEBSOCKET_URL || 'http://localhost:6001'

export function useWebSocket() {
  const { user } = useAuth()
  const socket = ref(null)
  const isConnected = ref(false)

  const connect = () => {
    // Disconnect existing socket before creating new one
    if (socket.value) {
      socket.value.disconnect();
      socket.value = null;
      isConnected.value = false;
    }

    socket.value = io(websocketUrl, {
      transports: ['websocket', 'polling'],
      reconnection: true,
      reconnectionDelay: 1000,
      reconnectionAttempts: 5
    })

    socket.value.on('connect', () => {
      isConnected.value = true

      // Join with user ID
      if (user.value?.id) {
        socket.value.emit('join', user.value.id)
        socket.value.once('joined', () => {
          // Socket joined successfully
        })
      }
    })

    socket.value.on('disconnect', () => {
      isConnected.value = false
    })

    socket.value.on('connect_error', (error) => {
      console.error('WebSocket connection error:', error)
      isConnected.value = false
    })
  }

  const disconnect = () => {
    if (socket.value) {
      socket.value.disconnect()
      socket.value = null
      isConnected.value = false
    }
  }

  const on = (event, callback) => {
    if (socket.value) {
      socket.value.on(event, callback)
    }
  }

  const off = (event, callback) => {
    if (socket.value) {
      socket.value.off(event, callback)
    }
  }

  const emit = (event, data) => {
    if (socket.value?.connected) {
      socket.value.emit(event, data)
    }
  }

  // Auto cleanup on unmount
  onUnmounted(() => {
    disconnect()
  })

  return {
    socket,
    isConnected,
    connect,
    disconnect,
    on,
    off,
    emit
  }
}

