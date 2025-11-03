# Database Seeders - Hướng dẫn sử dụng

## Tổng quan
Bộ seeder này tạo dữ liệu mẫu cho hệ thống e-commerce với các bảng chính:

### Các bảng được tạo dữ liệu mẫu:

1. **Users** - 5 người dùng (1 admin, 4 user)
2. **Categories** - 8 danh mục sản phẩm (có phân cấp)
3. **Brands** - 8 thương hiệu
4. **Products** - 10 sản phẩm đa dạng
5. **Variants** - 24 biến thể sản phẩm (màu sắc, kích thước)
6. **Images** - Hình ảnh cho sản phẩm và biến thể
7. **Addresses** - 5 địa chỉ giao hàng
8. **Blog Categories** - 5 danh mục blog
9. **Blogs** - 5 bài viết blog mẫu
10. **Orders** - 4 đơn hàng với trạng thái khác nhau
11. **Order Details** - Chi tiết các đơn hàng
12. **Carts** - 8 item trong giỏ hàng

## Cách chạy seeder

### Chạy tất cả seeder:
```bash
php artisan db:seed
```

### Chạy seeder cụ thể:
```bash
php artisan db:seed --class=UserSeeder
php artisan db:seed --class=ProductSeeder
```

### Reset và chạy lại toàn bộ:
```bash
php artisan migrate:fresh --seed
```

## Dữ liệu mẫu được tạo

### Users (5 người dùng):
- **Admin**: admin@example.com / password
- **User 1**: user1@example.com / password  
- **User 2**: user2@example.com / password
- **User 3**: user3@example.com / password
- **User 4**: user4@example.com / password

### Products (10 sản phẩm):
1. iPhone 15 Pro Max - 29,990,000 VNĐ
2. Samsung Galaxy S24 Ultra - 24,990,000 VNĐ
3. MacBook Pro M3 Pro - 45,990,000 VNĐ
4. Dell XPS 13 - 25,990,000 VNĐ
5. Áo sơ mi nam Uniqlo - 299,000 VNĐ
6. Quần jean nam Nike - 899,000 VNĐ
7. Váy nữ Zara - 1,299,000 VNĐ
8. Áo thun nữ H&M - 199,000 VNĐ
9. Giày thể thao Adidas - 2,499,000 VNĐ
10. Túi xách nữ Zara - 899,000 VNĐ

### Orders (4 đơn hàng):
- **Order 1**: Hoàn thành (iPhone 15 Pro Max)
- **Order 2**: Đang giao hàng (nhiều sản phẩm)
- **Order 3**: Chờ xử lý (Váy nữ)
- **Order 4**: Đã hủy (MacBook Pro)

### Blog Categories (5 danh mục):
- Thời trang
- Công nghệ  
- Lifestyle
- Beauty
- Review

### Blogs (5 bài viết):
- Xu hướng thời trang 2024
- Đánh giá iPhone 15 Pro Max
- Tips phối đồ công sở
- MacBook Pro M3 cho dân IT
- Quy trình chăm sóc da mặt

## Lưu ý quan trọng

1. **Thứ tự chạy seeder**: Các seeder được sắp xếp theo thứ tự phụ thuộc (foreign key)
2. **Dữ liệu thực tế**: Các giá tiền, địa chỉ, số điện thoại đều là dữ liệu mẫu
3. **Hình ảnh**: Các đường dẫn hình ảnh là giả định, cần thay thế bằng hình ảnh thực tế
4. **Mật khẩu**: Tất cả user đều có mật khẩu là "password"

## Tùy chỉnh dữ liệu

Để thay đổi dữ liệu mẫu, chỉnh sửa các file seeder tương ứng trong thư mục `database/seeders/`.

Ví dụ:
- Thay đổi thông tin user: `UserSeeder.php`
- Thêm sản phẩm mới: `ProductSeeder.php`
- Thay đổi đơn hàng: `OrderSeeder.php`
