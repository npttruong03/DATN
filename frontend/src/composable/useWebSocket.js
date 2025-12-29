import { ref, onUnmounted } from 'vue'
import { io } from 'socket.io-client'
import { useAuth } from './useAuth'

const websocketUrl = import.meta.env.VITE_WEBSOCKET_URL || 'http://localhost:6001'

export function useWebSocket() {
  const { user } = useAuth()
  const socket = ref(null)
  const isConnected = ref(false)

  const connect = () => {
    if (socket.value?.connected) {
      return
    }

    socket.value = io(websocketUrl, {
      transports: ['websocket', 'polling'],
      reconnection: true,
      reconnectionDelay: 1000,
      reconnectionAttempts: 5
    })

    socket.value.on('connect', () => {
      console.log('WebSocket connected:', socket.value.id)
      isConnected.value = true

      // Join with user ID
      if (user.value?.id) {
        socket.value.emit('join', user.value.id)
      }
    })

    socket.value.on('disconnect', () => {
      console.log('WebSocket disconnected')
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
    } else {
      console.warn('WebSocket not connected, cannot emit:', event)
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

