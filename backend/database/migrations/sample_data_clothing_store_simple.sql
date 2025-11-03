-- =============================================
-- DỮ LIỆU MẪU CHO CỬA HÀNG BÁN QUẦN ÁO (PHIÊN BẢN ĐƠN GIẢN)
-- Database: clothing_store
-- =============================================

-- =============================================
-- 1. BẢNG USERS (Người dùng)
-- =============================================
INSERT INTO users (username, email, phone, avatar, gender, dateOfBirth, password, role, status, ip_user, note, created_at, updated_at) VALUES
('admin', 'admin@clothingstore.com', '0123456789', 'avatars/admin.jpg', 'male', '1990-01-01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 1, '192.168.1.1', 'Quản trị viên hệ thống', NOW(), NOW()),
('nguyenvana', 'nguyenvana@gmail.com', '0987654321', 'avatars/user1.jpg', 'male', '1995-05-15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 1, '192.168.1.2', NULL, NOW(), NOW()),
('tranthib', 'tranthib@gmail.com', '0912345678', 'avatars/user2.jpg', 'female', '1998-08-20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 1, '192.168.1.3', NULL, NOW(), NOW()),
('levanc', 'levanc@gmail.com', '0923456789', 'avatars/user3.jpg', 'male', '1992-12-10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 1, '192.168.1.4', NULL, NOW(), NOW()),
('phamthid', 'phamthid@gmail.com', '0934567890', 'avatars/user4.jpg', 'female', '1996-03-25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', 1, '192.168.1.5', NULL, NOW(), NOW());

-- =============================================
-- 2. BẢNG CATEGORIES (Danh mục sản phẩm)
-- =============================================
INSERT INTO categories (name, description, image, slug, is_active, parent_id, created_at, updated_at) VALUES
('Áo nam', 'Các loại áo dành cho nam giới', 'categories/ao-nam.jpg', 'ao-nam', 1, NULL, NOW(), NOW()),
('Quần nam', 'Các loại quần dành cho nam giới', 'categories/quan-nam.jpg', 'quan-nam', 1, NULL, NOW(), NOW()),
('Áo nữ', 'Các loại áo dành cho nữ giới', 'categories/ao-nu.jpg', 'ao-nu', 1, NULL, NOW(), NOW()),
('Quần nữ', 'Các loại quần dành cho nữ giới', 'categories/quan-nu.jpg', 'quan-nu', 1, NULL, NOW(), NOW()),
('Váy nữ', 'Các loại váy dành cho nữ giới', 'categories/vay-nu.jpg', 'vay-nu', 1, NULL, NOW(), NOW()),
('Áo sơ mi nam', 'Áo sơ mi dành cho nam giới', 'categories/ao-so-mi-nam.jpg', 'ao-so-mi-nam', 1, 1, NOW(), NOW()),
('Áo thun nam', 'Áo thun dành cho nam giới', 'categories/ao-thun-nam.jpg', 'ao-thun-nam', 1, 1, NOW(), NOW()),
('Quần jean nam', 'Quần jean dành cho nam giới', 'categories/quan-jean-nam.jpg', 'quan-jean-nam', 1, 2, NOW(), NOW()),
('Áo thun nữ', 'Áo thun dành cho nữ giới', 'categories/ao-thun-nu.jpg', 'ao-thun-nu', 1, 3, NOW(), NOW()),
('Váy liền nữ', 'Váy liền dành cho nữ giới', 'categories/vay-lien-nu.jpg', 'vay-lien-nu', 1, 5, NOW(), NOW());

-- =============================================
-- 3. BẢNG BRANDS (Thương hiệu)
-- =============================================
INSERT INTO brands (name, description, image, slug, is_active, parent_id, created_at, updated_at) VALUES
('Uniqlo', 'Thương hiệu thời trang Nhật Bản nổi tiếng', 'brands/uniqlo.jpg', 'uniqlo', 1, NULL, NOW(), NOW()),
('Zara', 'Thương hiệu thời trang nhanh từ Tây Ban Nha', 'brands/zara.jpg', 'zara', 1, NULL, NOW(), NOW()),
('H&M', 'Thương hiệu thời trang giá rẻ từ Thụy Điển', 'brands/hm.jpg', 'hm', 1, NULL, NOW(), NOW()),
('Nike', 'Thương hiệu thể thao hàng đầu thế giới', 'brands/nike.jpg', 'nike', 1, NULL, NOW(), NOW()),
('Adidas', 'Thương hiệu thể thao nổi tiếng', 'brands/adidas.jpg', 'adidas', 1, NULL, NOW(), NOW()),
('Gucci', 'Thương hiệu thời trang cao cấp', 'brands/gucci.jpg', 'gucci', 1, NULL, NOW(), NOW()),
('Chanel', 'Thương hiệu thời trang cao cấp', 'brands/chanel.jpg', 'chanel', 1, NULL, NOW(), NOW()),
('Louis Vuitton', 'Thương hiệu thời trang cao cấp', 'brands/louis-vuitton.jpg', 'louis-vuitton', 1, NULL, NOW(), NOW());

-- =============================================
-- 4. BẢNG PRODUCTS (Sản phẩm)
-- =============================================
INSERT INTO products (name, price, description, discount_price, slug, is_active, categories_id, brand_id, sold_count, created_at, updated_at) VALUES
('Áo sơ mi nam Uniqlo', 299000, 'Áo sơ mi nam chất liệu cotton 100%, thiết kế đơn giản, phù hợp cho công sở và cuộc sống hàng ngày. Form dáng chuẩn, dễ phối đồ.', 249000, 'ao-so-mi-nam-uniqlo', 1, 6, 1, 156, NOW(), NOW()),
('Áo thun nam Nike', 399000, 'Áo thun nam Nike với chất liệu cotton cao cấp, thiết kế thể thao năng động. Phù hợp cho tập luyện và cuộc sống hàng ngày.', 349000, 'ao-thun-nam-nike', 1, 7, 4, 234, NOW(), NOW()),
('Quần jean nam Zara', 599000, 'Quần jean nam Zara với chất liệu denim cao cấp, thiết kế hiện đại. Form dáng chuẩn, phù hợp cho mọi hoạt động.', 499000, 'quan-jean-nam-zara', 1, 8, 2, 189, NOW(), NOW()),
('Áo thun nữ H&M', 199000, 'Áo thun nữ H&M chất liệu cotton mềm mại, thiết kế đơn giản. Nhiều màu sắc lựa chọn, phù hợp cho mọi lứa tuổi.', 149000, 'ao-thun-nu-hm', 1, 9, 3, 312, NOW(), NOW()),
('Váy liền nữ Zara', 899000, 'Váy liền nữ Zara thiết kế thanh lịch, chất liệu vải cao cấp. Phù hợp cho các dịp đặc biệt và công việc.', 799000, 'vay-lien-nu-zara', 1, 10, 2, 145, NOW(), NOW()),
('Áo sơ mi nữ Uniqlo', 399000, 'Áo sơ mi nữ Uniqlo với thiết kế tinh tế, chất liệu cotton cao cấp. Form dáng chuẩn, phù hợp cho công sở.', 349000, 'ao-so-mi-nu-uniqlo', 1, 3, 1, 178, NOW(), NOW()),
('Quần jean nữ H&M', 399000, 'Quần jean nữ H&M với thiết kế hiện đại, chất liệu denim mềm mại. Nhiều kiểu dáng và màu sắc.', 299000, 'quan-jean-nu-hm', 1, 4, 3, 267, NOW(), NOW()),
('Áo khoác nam Adidas', 1299000, 'Áo khoác nam Adidas với thiết kế thể thao, chất liệu cao cấp. Chống nước nhẹ, phù hợp cho mọi thời tiết.', 999000, 'ao-khoac-nam-adidas', 1, 1, 5, 89, NOW(), NOW()),
('Váy dạ hội nữ Gucci', 15999000, 'Váy dạ hội nữ Gucci thiết kế sang trọng, chất liệu cao cấp. Phù hợp cho các sự kiện quan trọng.', 13999000, 'vay-da-hoi-nu-gucci', 1, 5, 6, 23, NOW(), NOW()),
('Áo len nam Uniqlo', 499000, 'Áo len nam Uniqlo chất liệu len cao cấp, thiết kế đơn giản. Giữ ấm tốt, phù hợp cho mùa đông.', 399000, 'ao-len-nam-uniqlo', 1, 1, 1, 134, NOW(), NOW());

-- =============================================
-- 5. BẢNG VARIANTS (Biến thể sản phẩm)
-- =============================================
INSERT INTO variants (color, size, price, sku, product_id, created_at, updated_at) VALUES
-- Áo sơ mi nam Uniqlo (product_id = 1)
('Trắng', 'M', 299000, 'ASM-UNI-WHT-M', 1, NOW(), NOW()),
('Trắng', 'L', 299000, 'ASM-UNI-WHT-L', 1, NOW(), NOW()),
('Trắng', 'XL', 299000, 'ASM-UNI-WHT-XL', 1, NOW(), NOW()),
('Xanh navy', 'M', 299000, 'ASM-UNI-NAV-M', 1, NOW(), NOW()),
('Xanh navy', 'L', 299000, 'ASM-UNI-NAV-L', 1, NOW(), NOW()),

-- Áo thun nam Nike (product_id = 2)
('Trắng', 'M', 399000, 'AT-NIKE-WHT-M', 2, NOW(), NOW()),
('Trắng', 'L', 399000, 'AT-NIKE-WHT-L', 2, NOW(), NOW()),
('Đen', 'M', 399000, 'AT-NIKE-BLK-M', 2, NOW(), NOW()),
('Đen', 'L', 399000, 'AT-NIKE-BLK-L', 2, NOW(), NOW()),
('Xanh', 'M', 399000, 'AT-NIKE-BLU-M', 2, NOW(), NOW()),

-- Quần jean nam Zara (product_id = 3)
('Xanh đậm', '30', 599000, 'QJ-ZARA-BLU-30', 3, NOW(), NOW()),
('Xanh đậm', '32', 599000, 'QJ-ZARA-BLU-32', 3, NOW(), NOW()),
('Xanh đậm', '34', 599000, 'QJ-ZARA-BLU-34', 3, NOW(), NOW()),
('Đen', '30', 599000, 'QJ-ZARA-BLK-30', 3, NOW(), NOW()),
('Đen', '32', 599000, 'QJ-ZARA-BLK-32', 3, NOW(), NOW()),

-- Áo thun nữ H&M (product_id = 4)
('Trắng', 'S', 199000, 'AT-HM-WHT-S', 4, NOW(), NOW()),
('Trắng', 'M', 199000, 'AT-HM-WHT-M', 4, NOW(), NOW()),
('Hồng', 'S', 199000, 'AT-HM-PNK-S', 4, NOW(), NOW()),
('Hồng', 'M', 199000, 'AT-HM-PNK-M', 4, NOW(), NOW()),
('Xanh lá', 'S', 199000, 'AT-HM-GRN-S', 4, NOW(), NOW()),

-- Váy liền nữ Zara (product_id = 5)
('Đen', 'S', 899000, 'VL-ZARA-BLK-S', 5, NOW(), NOW()),
('Đen', 'M', 899000, 'VL-ZARA-BLK-M', 5, NOW(), NOW()),
('Xanh navy', 'S', 899000, 'VL-ZARA-NAV-S', 5, NOW(), NOW()),
('Xanh navy', 'M', 899000, 'VL-ZARA-NAV-M', 5, NOW(), NOW()),
('Đỏ', 'S', 899000, 'VL-ZARA-RED-S', 5, NOW(), NOW());

-- =============================================
-- 6. BẢNG IMAGES (Hình ảnh sản phẩm)
-- =============================================
INSERT INTO images (image_path, alt, product_id, variant_id, is_primary, created_at, updated_at) VALUES
('products/ao-so-mi-nam-uniqlo-1.jpg', 'Áo sơ mi nam Uniqlo Trắng', 1, 1, 1, NOW(), NOW()),
('products/ao-so-mi-nam-uniqlo-2.jpg', 'Áo sơ mi nam Uniqlo Xanh navy', 1, 4, 0, NOW(), NOW()),
('products/ao-thun-nam-nike-1.jpg', 'Áo thun nam Nike Trắng', 2, 6, 1, NOW(), NOW()),
('products/ao-thun-nam-nike-2.jpg', 'Áo thun nam Nike Đen', 2, 8, 0, NOW(), NOW()),
('products/quan-jean-nam-zara-1.jpg', 'Quần jean nam Zara Xanh đậm', 3, 11, 1, NOW(), NOW()),
('products/quan-jean-nam-zara-2.jpg', 'Quần jean nam Zara Đen', 3, 14, 0, NOW(), NOW()),
('products/ao-thun-nu-hm-1.jpg', 'Áo thun nữ H&M Trắng', 4, 16, 1, NOW(), NOW());

-- =============================================
-- 7. BẢNG ADDRESSES (Địa chỉ giao hàng)
-- =============================================
INSERT INTO addresses (full_name, phone, province, district, ward, street, user_id, created_at, updated_at) VALUES
('Nguyễn Văn A', '0987654321', 'Hà Nội', 'Quận Cầu Giấy', 'Phường Dịch Vọng', 'Số 123, Đường Cầu Giấy', 1, NOW(), NOW()),
('Trần Thị B', '0912345678', 'TP. Hồ Chí Minh', 'Quận 1', 'Phường Bến Nghé', 'Số 456, Đường Nguyễn Huệ', 2, NOW(), NOW()),
('Lê Văn C', '0923456789', 'Đà Nẵng', 'Quận Hải Châu', 'Phường Thạch Thang', 'Số 789, Đường Lê Duẩn', 3, NOW(), NOW()),
('Phạm Thị D', '0934567890', 'Hà Nội', 'Quận Đống Đa', 'Phường Láng Thượng', 'Số 321, Đường Láng', 4, NOW(), NOW()),
('Hoàng Văn E', '0945678901', 'TP. Hồ Chí Minh', 'Quận 3', 'Phường Võ Thị Sáu', 'Số 654, Đường Võ Thị Sáu', 1, NOW(), NOW());

-- =============================================
-- 8. BẢNG ORDERS (Đơn hàng)
-- =============================================
INSERT INTO orders (user_id, address_id, status, payment_method, payment_status, total_price, discount_price, final_price, note, tracking_code, created_at, updated_at) VALUES
(1, 1, 'completed', 'credit_card', 'paid', 299000, 50000, 249000, 'Giao hàng trong giờ hành chính', 'ORD001', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 3 DAY),
(2, 2, 'shipping', 'bank_transfer', 'paid', 798000, 100000, 698000, 'Giao hàng tận nơi', 'ORD002', NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 1 DAY),
(3, 3, 'pending', 'cod', 'unpaid', 899000, 100000, 799000, 'Kiểm tra hàng trước khi thanh toán', NULL, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY),
(4, 4, 'cancelled', 'credit_card', 'refunded', 15999000, 2000000, 13999000, NULL, NULL, NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 6 DAY);

-- =============================================
-- 9. BẢNG ORDERS_DETAILS (Chi tiết đơn hàng)
-- =============================================
INSERT INTO orders_details (order_id, variant_id, quantity, price, original_price, total_price, created_at, updated_at) VALUES
-- Chi tiết đơn hàng 1
(1, 1, 1, 249000, 299000, 249000, NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 5 DAY),

-- Chi tiết đơn hàng 2
(2, 6, 2, 349000, 399000, 698000, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 3 DAY),

-- Chi tiết đơn hàng 3
(3, 21, 1, 799000, 899000, 799000, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY),

-- Chi tiết đơn hàng 4 (đã hủy)
(4, 25, 1, 13999000, 15999000, 13999000, NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 7 DAY);

-- =============================================
-- 10. BẢNG CARTS (Giỏ hàng)
-- =============================================
INSERT INTO carts (user_id, session_id, variant_id, quantity, price, created_at, updated_at) VALUES
(1, NULL, 2, 1, 299000, NOW(), NOW()),
(1, NULL, 4, 2, 299000, NOW(), NOW()),
(2, NULL, 7, 1, 399000, NOW(), NOW()),
(2, NULL, 16, 3, 199000, NOW(), NOW()),
(3, NULL, 11, 1, 599000, NOW(), NOW()),
(3, NULL, 22, 1, 899000, NOW(), NOW()),
(NULL, 'session_123456789', 18, 2, 199000, NOW(), NOW()),
(NULL, 'session_123456789', 20, 1, 199000, NOW(), NOW());

-- =============================================
-- 11. BẢNG BLOG_CATEGORIES (Danh mục blog)
-- =============================================
INSERT INTO blog_categories (name, slug, description, image, status, created_at, updated_at) VALUES
('Thời trang', 'thoi-trang', 'Tin tức và xu hướng thời trang mới nhất', 'blog-categories/fashion.jpg', 'active', NOW(), NOW()),
('Phong cách', 'phong-cach', 'Hướng dẫn phối đồ và phong cách', 'blog-categories/style.jpg', 'active', NOW(), NOW()),
('Làm đẹp', 'lam-dep', 'Tips làm đẹp và chăm sóc da', 'blog-categories/beauty.jpg', 'active', NOW(), NOW()),
('Lifestyle', 'lifestyle', 'Phong cách sống và tips hữu ích', 'blog-categories/lifestyle.jpg', 'active', NOW(), NOW()),
('Review', 'review', 'Đánh giá sản phẩm chi tiết', 'blog-categories/review.jpg', 'active', NOW(), NOW());

-- =============================================
-- 12. BẢNG BLOGS (Bài viết blog)
-- =============================================
INSERT INTO blogs (title, slug, content, excerpt, image, status, blog_category_id, created_at, updated_at) VALUES
('Xu hướng thời trang nam 2024: Những mẫu áo sơ mi hot nhất', 'xu-huong-thoi-trang-nam-2024-ao-so-mi', '<p>Năm 2024 mang đến những xu hướng thời trang nam mới mẻ và hiện đại. Áo sơ mi nam đang trở thành item không thể thiếu trong tủ đồ của mọi quý ông.</p><p>Những mẫu áo sơ mi với thiết kế tối giản, chất liệu cao cấp và màu sắc đa dạng đang được ưa chuộng. Từ phong cách công sở đến casual, áo sơ mi luôn tạo nên vẻ ngoài lịch lãm và tự tin.</p>', 'Khám phá những xu hướng thời trang nam mới nhất năm 2024 với các mẫu áo sơ mi đang được ưa chuộng.', 'blogs/ao-so-mi-nam-2024.jpg', 'published', 1, NOW() - INTERVAL 10 DAY, NOW() - INTERVAL 10 DAY),
('10 tips phối đồ cho nữ công sở chuyên nghiệp', '10-tips-phoi-do-nu-cong-so', '<p>Phối đồ công sở là một nghệ thuật cần sự tinh tế và hiểu biết về thời trang. Với 10 tips dưới đây, bạn sẽ luôn tự tin và chuyên nghiệp trong mọi tình huống công việc.</p>', 'Bí quyết phối đồ công sở chuyên nghiệp cho phụ nữ hiện đại.', 'blogs/phoi-do-cong-so-nu.jpg', 'published', 2, NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 5 DAY),
('Làm đẹp da mặt: Quy trình chăm sóc da cơ bản', 'lam-dep-da-mat-quy-trinh-cham-soc-da', '<p>Chăm sóc da mặt đúng cách là bước đầu tiên để có làn da khỏe mạnh và rạng rỡ. Với quy trình chăm sóc da cơ bản, bạn sẽ dễ dàng duy trì làn da đẹp mỗi ngày.</p>', 'Hướng dẫn quy trình chăm sóc da mặt cơ bản cho người mới bắt đầu.', 'blogs/cham-soc-da-mat.jpg', 'published', 3, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY),
('Review áo sơ mi Uniqlo: Có đáng mua không?', 'review-ao-so-mi-uniqlo-co-dang-mua-khong', '<p>Áo sơ mi Uniqlo luôn được đánh giá cao về chất lượng và giá cả. Trong bài review này, chúng tôi sẽ phân tích chi tiết về chất liệu, form dáng và trải nghiệm sử dụng.</p>', 'Đánh giá chi tiết áo sơ mi Uniqlo sau 1 tháng sử dụng.', 'blogs/review-ao-so-mi-uniqlo.jpg', 'published', 5, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 3 DAY),
('Phong cách thời trang tối giản cho nam giới', 'phong-cach-thoi-trang-toi-gian-cho-nam-gioi', '<p>Phong cách tối giản đang trở thành xu hướng được nhiều nam giới yêu thích. Với những item cơ bản, bạn có thể tạo nên nhiều phong cách khác nhau.</p>', 'Hướng dẫn phong cách thời trang tối giản cho nam giới hiện đại.', 'blogs/phong-cach-toi-gian-nam.jpg', 'published', 4, NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 7 DAY);

-- =============================================
-- HOÀN THÀNH CHÈN DỮ LIỆU MẪU
-- =============================================

-- Hiển thị thông tin tổng quan
SELECT 'Dữ liệu mẫu đã được chèn thành công!' as message;
SELECT COUNT(*) as total_users FROM users;
SELECT COUNT(*) as total_products FROM products;
SELECT COUNT(*) as total_orders FROM orders;
SELECT COUNT(*) as total_blogs FROM blogs;
