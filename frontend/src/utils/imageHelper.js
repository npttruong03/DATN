/**
 * Helper function to format product image URLs
 * Handles different URL formats from backend
 */
export function getImageUrl(imagePath) {
    if (!imagePath) {
        return 'https://via.placeholder.com/300x300?text=No+Image'
    }

    const apiBaseUrl = import.meta.env.VITE_API_BASE_URL || 'http://localhost:8000'
    
    // Nếu đã là URL đầy đủ (http:// hoặc https://), trả về luôn
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
        return imagePath
    }
    
    // Nếu là đường dẫn tương đối bắt đầu với /storage/
    if (imagePath.startsWith('/storage/')) {
        // Loại bỏ dấu / ở cuối apiBaseUrl nếu có
        const base = apiBaseUrl.replace(/\/$/, '')
        return `${base}${imagePath}`
    }
    
    // Nếu là đường dẫn tương đối không có /storage/, thêm /storage/ vào
    if (imagePath.startsWith('storage/')) {
        const base = apiBaseUrl.replace(/\/$/, '')
        return `${base}/${imagePath}`
    }
    
    // Trường hợp còn lại: thêm /storage/ vào trước
    const base = apiBaseUrl.replace(/\/$/, '')
    return `${base}/storage/${imagePath}`
}

/**
 * Get main image from product images array
 */
export function getMainImageUrl(product) {
    if (!product || !product.images || product.images.length === 0) {
        return 'https://via.placeholder.com/300x300?text=No+Image'
    }
    
    // Tìm ảnh chính (is_main === 1)
    const mainImage = product.images.find(img => img.is_main === 1)
    if (mainImage && mainImage.image_path) {
        return getImageUrl(mainImage.image_path)
    }
    
    // Nếu không có ảnh chính, lấy ảnh đầu tiên
    const firstImage = product.images[0]
    if (firstImage && firstImage.image_path) {
        return getImageUrl(firstImage.image_path)
    }
    
    return 'https://via.placeholder.com/300x300?text=No+Image'
}

