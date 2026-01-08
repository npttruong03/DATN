import { ref, reactive } from 'vue'
import { useAuth } from './useAuth'

export function useAIChat() {
  const { user } = useAuth()

  const apiBaseUrl = import.meta.env.VITE_API_BASE_URL
  const chatbotApiUrl = 'https://chatbot.dinon.uk/api/v1/chat/message/stream'
  const isOpen = ref(false)
  const isTyping = ref(false)
  const messages = ref([])
  const currentMessage = ref('')
  const hasUnreadMessages = ref(false)
  const unreadCount = ref(0)
  
  // Quản lý session_id cho chatbot
  let sessionId = localStorage.getItem('chatbot_session_id')
  if (!sessionId) {
    sessionId = `session_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`
    localStorage.setItem('chatbot_session_id', sessionId)
  }

  // Hàm reset session thủ công
  const resetSession = () => {
    // Tạo session_id mới
    sessionId = `session_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`
    localStorage.setItem('chatbot_session_id', sessionId)
    
    // Xóa messages
    messages.value.length = 0
    
    console.log('🔄 Session reset:', sessionId)
  }

  // Hàm set session_id tùy chỉnh
  const setSessionId = (newSessionId) => {
    if (!newSessionId || typeof newSessionId !== 'string') {
      console.error('❌ Invalid session_id provided')
      return false
    }
    
    sessionId = newSessionId
    localStorage.setItem('chatbot_session_id', sessionId)
    
    // Xóa messages để bắt đầu session mới
    messages.value.length = 0
    
    console.log('🔧 Session ID set to:', sessionId)
    return true
  }

  // Hàm get session_id hiện tại
  const getCurrentSessionId = () => {
    return sessionId
  }

  // Expose functions to window for easy access from browser console
  if (typeof window !== 'undefined') {
    window.chatbotSession = {
      get: getCurrentSessionId,
      set: setSessionId,
      reset: resetSession
    }
  }

  const normalizeText = (text) => text
    .toLowerCase()
    .normalize('NFD')
    .replace(/\p{Diacritic}/gu, '')
    .replace(/[^a-z0-9\s]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()

  const isGreeting = (text) => {
    const t = normalizeText(text)
    if (t.length === 0) return false

    const tokens = t.split(' ').filter(Boolean)
    const tokenSet = new Set(tokens)
    const maxGreetingWords = 4
    if (tokens.length > maxGreetingWords) return false

    const keywordTokens = ['hi', 'hello', 'alo', 'chao', 'xin', 'hey']
    const hasSimpleToken = keywordTokens.some(k => tokenSet.has(k))

    const exactPhrases = [
      'xin chao', 'chao', 'chao ban', 'chao shop', 'chao ad',
      'good morning', 'good afternoon', 'good evening'
    ]

    const hasChaoSubstring = t.includes('chao') || t.includes('xinchao')

    return (
      exactPhrases.includes(t) ||
      (hasSimpleToken && tokens.length <= maxGreetingWords) ||
      hasChaoSubstring
    )
  }

  const isSpecificProductQuestion = (message) => {
    const messageLower = message.toLowerCase()

    const hasQuestionWord = messageLower.includes('gì') ||
      messageLower.includes('nào') ||
      messageLower.includes('có') ||
      messageLower.includes('không') ||
      messageLower.includes('màu') ||
      messageLower.includes('size') ||
      messageLower.includes('giá') ||
      messageLower.includes('còn') ||
      messageLower.includes('hàng')

    return messageLower.split(' ').length >= 3 || hasQuestionWord
  }

  const filterProductsByQuery = (products, query) => {
    if (!products || products.length === 0) return []

    const queryLower = query.toLowerCase()
    const stopWords = ['tôi', 'muốn', 'mua', 'cần', 'tìm', 'có', 'ạ', 'à', 'và', 'hoặc', 'này', 'đó', 'kia', 'ôi', 'cho', 'với', 'trong', 'ngoài', 'trên', 'dưới', 'bên', 'của', 'là', 'thì', 'mà', 'nhưng', 'hoặc', 'vì', 'nên', 'để', 'từ', 'đến', 'tại', 'về', 'theo', 'cùng', 'cả', 'mỗi', 'mọi', 'mấy', 'bao', 'nhiêu', 'mấy', 'bao', 'nhiêu', 'mấy', 'bao', 'nhiêu']

    let keywords = queryLower.split(' ')
    keywords = keywords.filter(word => !stopWords.includes(word) && word.length >= 2)


    if (keywords.length === 0) return []

    const result = products.filter(product => {
      const productName = (product.name || '').toLowerCase()
      const categoryName = (product.categories?.name || '').toLowerCase()
      const productDescription = (product.description || '').toLowerCase()

      const matchingKeywords = keywords.filter(keyword =>
        productName.includes(keyword) ||
        categoryName.includes(keyword) ||
        productDescription.includes(keyword)
      )

      return matchingKeywords.length >= 1
    })

    return result.slice(0, 6)
  }

  // Fetch inventory từ Laravel backend cho products
  const fetchInventoryForProducts = async (products) => {
    if (!products || products.length === 0) return products

    try {
      console.log('📦 Fetching inventory for', products.length, 'products...')
      
      // Fetch inventory cho tất cả products song song
      const productsWithInventory = await Promise.all(
        products.map(async (product) => {
          try {
            const response = await fetch(
              `${apiBaseUrl}/api/inventory?product_id=${product.id}`,
              {
                headers: { 'Accept': 'application/json' }
              }
            )
            
            if (response.ok) {
              const inventoryData = await response.json()
              console.log(`✅ Inventory for product ${product.id} (${product.name}):`, inventoryData.length, 'items')
              
              // 🔥 FIX: Build variants từ inventory data
              if (inventoryData && Array.isArray(inventoryData) && inventoryData.length > 0) {
                product.variants = inventoryData.map(inv => ({
                  id: inv.variant_id,
                  color: inv.variant.color,
                  size: inv.variant.size,
                  price: inv.variant.price,
                  sku: inv.variant.sku,
                  product_id: inv.variant.product_id,
                  inventory: {
                    id: inv.id,
                    quantity: inv.quantity || 0
                  }
                }))
                
                // 🔥 FIX: Extract available_sizes và available_colors
                const uniqueSizes = [...new Set(product.variants.map(v => v.size).filter(Boolean))]
                const uniqueColors = [...new Set(product.variants.map(v => v.color).filter(Boolean))]
                
                product.available_sizes = uniqueSizes
                product.available_colors = uniqueColors
                product.default_size = uniqueSizes[0] || null
                product.default_color = uniqueColors[0] || null
                
                const totalStock = product.variants.reduce((sum, v) => sum + (v.inventory?.quantity || 0), 0)
                console.log(`   ✅ Processed:`, {
                  variants: product.variants.length,
                  sizes: uniqueSizes,
                  colors: uniqueColors,
                  total_stock: totalStock
                })
              } else {
                console.warn(`⚠️ No inventory data for product ${product.id}`)
                product.variants = []
                product.available_sizes = []
                product.available_colors = []
              }
            } else {
              console.warn(`⚠️ Failed to fetch inventory for product ${product.id}`)
              product.variants = []
              product.available_sizes = []
              product.available_colors = []
            }
          } catch (error) {
            console.error(`❌ Error fetching inventory for product ${product.id}:`, error)
            product.variants = []
            product.available_sizes = []
            product.available_colors = []
          }
          
          return product
        })
      )
      
      console.log('✅ All products fetched with inventory and variants')
      return productsWithInventory
    } catch (error) {
      console.error('❌ Error in fetchInventoryForProducts:', error)
      return products
    }
  }

  const sendMessage = async (message) => {
    if (!message.trim() || isTyping.value) return

    if (message.trim().length < 2) {
      messages.value.push({
        text: 'Vui lòng nhập tin nhắn rõ ràng hơn để tôi có thể hỗ trợ bạn tốt nhất.',
        isUser: false,
        timestamp: new Date()
      })
      return
    }

    // Thêm tin nhắn của người dùng
    messages.value.push({
      text: message,
      isUser: true,
      timestamp: new Date()
    })

    isTyping.value = true

    try {
      console.log('🚀 Sending message to chatbot API:', chatbotApiUrl)
      console.log('📤 Request body:', { message, session_id: sessionId })

      // Gọi API chatbot qua SSE
      const response = await fetch(chatbotApiUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'text/event-stream'
        },
        body: JSON.stringify({
          message: message,
          session_id: sessionId
        })
      })

      console.log('📥 Response status:', response.status)
      console.log('📥 Response headers:', Object.fromEntries(response.headers.entries()))

      if (!response.ok) {
        throw new Error(`HTTP ${response.status}: ${response.statusText}`)
      }

      // Kiểm tra content-type để xác định format
      const contentType = response.headers.get('content-type')
      console.log('📋 Content-Type:', contentType)

      // Nếu response là JSON thông thường (không phải SSE)
      if (contentType && contentType.includes('application/json')) {
        console.log('⚠️ Received JSON instead of SSE, parsing as JSON')
        const data = await response.json()
        console.log('📦 JSON data:', data)

        // Tạo tin nhắn AI
        messages.value.push({
          text: data.message || data.response || data.content || 'Không có phản hồi',
          isUser: false,
          timestamp: new Date()
        })

        isTyping.value = false
        return
      }

      const reader = response.body.getReader()
      const decoder = new TextDecoder('utf-8')
      let fullAiMessage = ''
      let buffer = ''

      // Tạo tin nhắn AI trống TRƯỚC KHI bắt đầu stream
      messages.value.push({
        text: '',
        isUser: false,
        timestamp: new Date()
      })
      const aiMessageIndex = messages.value.length - 1

      // Đọc stream SSE với buffer handling đúng cách
      while (true) {
        const { done, value } = await reader.read()
        if (done) {
          console.log('✅ Stream ended')
          break
        }

        // Decode chunk và thêm vào buffer
        const chunk = decoder.decode(value, { stream: true })
        buffer += chunk
        
        // Split theo newline, giữ phần cuối chưa đủ trong buffer
        const lines = buffer.split('\n')
        buffer = lines.pop() // Phần cuối chưa đủ line, giữ lại cho chunk sau

        // Xử lý từng line đầy đủ
        for (const line of lines) {
          if (!line.startsWith('data: ')) continue
          
          const raw = line.slice(6).trim()
          if (!raw) continue

          console.log('📦 Processing:', raw)

          try {
            // Convert Python dict format sang JSON
            const jsonData = raw
              .replace(/'/g, '"')
              .replace(/None/g, 'null')
              .replace(/True/g, 'true')
              .replace(/False/g, 'false')

            const parsed = JSON.parse(jsonData)
            
            // Xử lý messagechunk - streaming content
            if (parsed.type === 'messagechunk' && parsed.content) {
              fullAiMessage += parsed.content
              
              // UPDATE NGAY LẬP TỨC để có hiệu ứng streaming
              messages.value[aiMessageIndex].text = fullAiMessage
              console.log('💬 Streaming:', parsed.content)
            }
            
            // Xử lý done event - có thể có thêm data
            if (parsed.type === 'done') {
              console.log('✅ Done event:', parsed)
              
              // Nếu có full_message và chưa có text nào, dùng nó
              if (parsed.full_message && !fullAiMessage) {
                fullAiMessage = parsed.full_message
                messages.value[aiMessageIndex].text = fullAiMessage
              }
              
              // Xử lý products - fetch inventory từ backend
              if (parsed.products && Array.isArray(parsed.products) && parsed.products.length > 0) {
                console.log('🛍️ Chatbot returned', parsed.products.length, 'products')
                
                // Fetch inventory cho tất cả products
                const productsWithInventory = await fetchInventoryForProducts(parsed.products)
                
                // 🔍 DEBUG: Kiểm tra data sau khi fetch
                productsWithInventory.forEach((p, index) => {
                  console.log(`📦 Product ${index + 1} ready for display:`, {
                    id: p.id,
                    name: p.name,
                    variants_count: p.variants?.length || 0,
                    available_sizes: p.available_sizes,
                    available_colors: p.available_colors,
                    default_size: p.default_size,
                    default_color: p.default_color,
                    first_variant: p.variants?.[0] ? {
                      id: p.variants[0].id,
                      size: p.variants[0].size,
                      color: p.variants[0].color,
                      stock: p.variants[0].inventory?.quantity
                    } : 'NO VARIANTS'
                  })
                })
                
                // Thêm vào message để hiển thị ProductCard
                messages.value[aiMessageIndex].products = productsWithInventory
                messages.value[aiMessageIndex].show_purchase_form = true
                
                console.log('✅ Products with inventory added to message')
              }
              
              // Xử lý cart info
              if (parsed.cart) {
                console.log('🛒 Cart info:', parsed.cart)
                messages.value[aiMessageIndex].cart = parsed.cart
              }
              
              // Xử lý order_result
              if (parsed.order_result) {
                console.log('📦 Order result:', parsed.order_result)
                messages.value[aiMessageIndex].orderResult = parsed.order_result
              }
              
              // Xử lý suggested_actions - có thể làm quick action buttons
              if (parsed.suggested_actions && Array.isArray(parsed.suggested_actions)) {
                console.log('💡 Suggested actions:', parsed.suggested_actions)
                messages.value[aiMessageIndex].suggestedActions = parsed.suggested_actions
              }
              
              // Xử lý tools_used (để debug)
              if (parsed.tools_used && Array.isArray(parsed.tools_used)) {
                console.log('🔧 Tools used:', parsed.tools_used)
              }
              
              break
            }
          } catch (err) {
            console.warn('⚠️ Parse error:', err.message, 'Raw:', raw)
            // Fallback: treat as plain text
            fullAiMessage += raw
            messages.value[aiMessageIndex].text = fullAiMessage
          }
        }
      }

      // Xử lý buffer còn lại (nếu có)
      if (buffer.trim()) {
        console.log('📝 Processing remaining buffer:', buffer)
      }

      console.log('🏁 Final message:', fullAiMessage.substring(0, 100) + '...')
      console.log('🏁 Length:', fullAiMessage.length)

      // Nếu không có nội dung, hiển thị thông báo lỗi
      if (!fullAiMessage) {
        messages.value[aiMessageIndex].text = 'Xin lỗi, tôi không thể phản hồi lúc này. Vui lòng thử lại.'
      }

    } catch (error) {
      console.error('AI Chat Error:', error)
      messages.value.push({
        text: 'Xin lỗi, có lỗi xảy ra khi kết nối với chatbot. Vui lòng thử lại sau.',
        isUser: false,
        timestamp: new Date()
      })
    } finally {
      isTyping.value = false
    }
  }

  // Thêm phương thức tìm kiếm sản phẩm theo giá
  const searchProductsByPrice = async (query) => {
    try {
      const response = await fetch(`${apiBaseUrl}/api/ai/search-by-price`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: JSON.stringify({ query })
      })

      const data = await response.json()
      return data.success ? data : { success: false, message: data.message || 'Có lỗi xảy ra' }
    } catch (error) {
      console.error('Search Products By Price Error:', error)
      return { success: false, message: 'Có lỗi xảy ra khi tìm kiếm sản phẩm' }
    }
  }

  // Thêm phương thức lấy thông tin variant của sản phẩm
  const getProductVariants = async (productId) => {
    try {
      const response = await fetch(`${apiBaseUrl}/api/ai/product-variants?product_id=${productId}`, {
        headers: {
          'Accept': 'application/json'
        }
      })

      const data = await response.json()
      return data.success ? data : { success: false, message: data.message || 'Có lỗi xảy ra' }
    } catch (error) {
      console.error('Get Product Variants Error:', error)
      return { success: false, message: 'Có lỗi xảy ra khi lấy thông tin sản phẩm' }
    }
  }

  // Thêm phương thức tra cứu đơn hàng
  const searchOrder = async (trackingCode) => {
    try {
      const headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      // Thêm token nếu user đã đăng nhập
      if (user.value && user.value.token) {
        headers['Authorization'] = `Bearer ${user.value.token}`
      }

      console.log('Searching order with tracking code:', trackingCode)
      console.log('API URL:', `${apiBaseUrl}/api/orders/track/${trackingCode}`)

      const response = await fetch(`${apiBaseUrl}/api/orders/track/${trackingCode}`, {
        method: 'GET',
        headers
      })

      console.log('Response status:', response.status)
      const data = await response.json()
      console.log('Response data:', data)
      
      if (response.ok) {
        // Kiểm tra format response mới
        if (data.success && data.order) {
          return { success: true, order: data.order }
        } else if (data.order) {
          // Fallback cho format cũ
          return { success: true, order: data.order }
        } else {
          return { success: false, message: data.message || 'Không tìm thấy đơn hàng' }
        }
      } else {
        return { success: false, message: data.message || 'Không tìm thấy đơn hàng' }
      }
    } catch (error) {
      console.error('Search Order Error:', error)
      return { success: false, message: 'Có lỗi xảy ra khi tra cứu đơn hàng' }
    }
  }

  const searchProducts = async (query) => {
    try {
      const response = await fetch(`${apiBaseUrl}/api/ai/search-products?query=${encodeURIComponent(query)}`, {
        headers: {
          'Accept': 'application/json'
        }
      })

      const data = await response.json()
      return data.success ? data.products : []
    } catch (error) {
      console.error('Search Products Error:', error)
      return []
    }
  }

  const getAvailableCoupons = async () => {
    try {
      const response = await fetch(`${apiBaseUrl}/api/ai/coupons`, {
        headers: {
          'Accept': 'application/json'
        }
      })

      const data = await response.json()
      return data.success ? data.coupons : []
    } catch (error) {
      console.error('Get Coupons Error:', error)
      return []
    }
  }

  const getActiveFlashSales = async () => {
    try {
      const response = await fetch(`${apiBaseUrl}/api/ai/flash-sales`, {
        headers: {
          'Accept': 'application/json'
        }
      })

      const data = await response.json()
      return data.success ? data.flash_sales : []
    } catch (error) {
      console.error('Get Flash Sales Error:', error)
      return []
    }
  }

  const toggleChat = () => {
    isOpen.value = !isOpen.value
    if (isOpen.value) {
      hasUnreadMessages.value = false
      unreadCount.value = 0
      document.documentElement.classList.add('ai-chatbot-open')
    } else {
      document.documentElement.classList.remove('ai-chatbot-open')
    }
  }

  const addWelcomeMessage = () => {
    if (messages.value.length === 0) {
      messages.value.push({
        text: '👋 Xin chào! Tôi là trợ lý AI của DEVG Shop. Rất vui được hỗ trợ bạn hôm nay!\n\n🌟 Tôi có thể giúp bạn:\n\n🔍 Tìm kiếm và tư vấn sản phẩm\n🎫 Thông tin mã giảm giá & khuyến mãi\n💳 Hướng dẫn thanh toán\n🔥 Thông tin flash sale hot\n📂 Tư vấn danh mục sản phẩm\n📦 Tra cứu đơn hàng\n💰 Tìm sản phẩm theo giá\n\n💬 Hãy nhắn tin cho tôi hoặc chọn các gợi ý bên dưới nhé!',
        isUser: false,
        timestamp: new Date()
      })
    }
  }

  const clearMessages = () => {
    messages.value.length = 0
  }

  const formatMessage = (text) => {
    return text.replace(/\n/g, '<br>')
  }

  const formatTime = (timestamp) => {
    return new Date(timestamp).toLocaleTimeString('vi-VN', {
      hour: '2-digit',
      minute: '2-digit'
    })
  }

  const buildClientContextHint = () => {
    for (let i = messages.value.length - 1; i >= 0; i--) {
      const m = messages.value[i]
      if (!m.isUser && Array.isArray(m.products) && m.products.length > 0) {
        // Gửi toàn bộ context thay vì chỉ product_ids
        return { 
          products: m.products,
          show_purchase_form: m.show_purchase_form || false
        }
      }
    }
    return {}
  }

  const formatPrice = (price) => {
    return new Intl.NumberFormat('vi-VN', {
      style: 'currency',
      currency: 'VND'
    }).format(price)
  }

  const calculateDiscountPercentage = (product) => {
    if (!product.discount_price) return 0
    return Math.round(((product.price - product.discount_price) / product.price) * 100)
  }

  const getPlaceholderImage = () => {
    return 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjZjhmYWZjIi8+CiAgPHRleHQgeD0iNTAlIiB5PSI1MCUiIGZvbnQtZmFtaWx5PSJBcmlhbCwgc2Fucy1zZXJpZiIgZm9udC1zaXplPSIxNCIgZmlsbD0iIzY0NzQ4YiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iPk5vIEltYWdlPC90ZXh0Pgo8L3N2Zz4='
  }

  const getImageUrl = (product) => {
    const mainImage = product.mainImage || product.main_image
    if (mainImage && mainImage.image_url) {
      return mainImage.image_url
    }
    return getPlaceholderImage()
  }

  const handleImageError = (event) => {
    event.target.src = getPlaceholderImage()
  }

  const viewProduct = (product) => {
    window.open(`/san-pham/${product.slug}`, '_blank')
  }

  // Cleanup function
  const cleanup = () => {
    document.documentElement.classList.remove('ai-chatbot-open')
    document.documentElement.classList.remove('chatwidget-open')
  }

  return {
    isOpen,
    isTyping,
    messages,
    currentMessage,
    hasUnreadMessages,
    unreadCount,

    sendMessage,
    toggleChat,
    addWelcomeMessage,
    clearMessages,
    resetSession,
    setSessionId,
    getCurrentSessionId,
    searchProducts,
    getAvailableCoupons,
    getActiveFlashSales,
    searchProductsByPrice,
    getProductVariants,
    searchOrder,
    fetchInventoryForProducts,
    formatMessage,
    formatTime,
    formatPrice,
    calculateDiscountPercentage,
    getImageUrl,
    handleImageError,
    viewProduct,
    cleanup
  }
}