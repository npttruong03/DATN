# Hướng dẫn Khắc phục Lỗi GHN API

## Vấn đề: Không thể lấy thông tin shop từ GHN API

### Nguyên nhân có thể:

1. **API Token chưa được cấu hình hoặc không hợp lệ**
2. **Shop ID chưa được cấu hình hoặc không đúng**
3. **API endpoint đã thay đổi**
4. **Kết nối mạng không ổn định**

## Các bước khắc phục:

### 1. Kiểm tra cấu hình trong .env

Đảm bảo file `backend/.env` có các dòng sau:

```env
GHN_BASE_URL=https://online-gateway.ghn.vn/shiip/public-api/v2
GHN_API_TOKEN=your_api_token_here
GHN_SHOP_ID=your_shop_id_here
```

### 2. Kiểm tra cấu hình trong Database

Nếu không có trong .env, hệ thống sẽ tự động load từ database. Kiểm tra bảng `settings`:

```sql
SELECT * FROM settings WHERE `key` IN ('GHN_API_TOKEN', 'GHN_SHOP_ID', 'GHN_BASE_URL');
```

Hoặc qua API:
```bash
curl http://localhost:8000/api/settings
```

### 3. Kiểm tra logs

Xem logs của Laravel để biết chi tiết lỗi:

```bash
# Xem logs real-time
docker exec laravel-backend tail -f storage/logs/laravel.log

# Hoặc xem logs qua docker
docker-compose logs -f backend | grep GHN
```

### 4. Test API trực tiếp

Test API endpoint để kiểm tra token và shop_id:

```bash
# Test endpoint 1: /shop/detail
curl -X GET "https://online-gateway.ghn.vn/shiip/public-api/v2/shop/detail" \
  -H "Token: YOUR_API_TOKEN" \
  -H "ShopId: YOUR_SHOP_ID"

# Test endpoint 2: /shop
curl -X GET "https://online-gateway.ghn.vn/shiip/public-api/v2/shop?id=YOUR_SHOP_ID" \
  -H "Token: YOUR_API_TOKEN"
```

### 5. Kiểm tra qua API của hệ thống

```bash
# Lấy thông tin shop
curl http://localhost:8000/api/shipping/config

# Hoặc endpoint riêng
curl http://localhost:8000/api/shipping/shop-info
```

### 6. Cập nhật cấu hình

Nếu cần cập nhật cấu hình, có thể:

**Cách 1: Cập nhật qua .env**
```bash
# Sửa file backend/.env
# Sau đó restart container
docker-compose restart backend
```

**Cách 2: Cập nhật qua Database**
```sql
UPDATE settings SET `value` = 'your_new_token' WHERE `key` = 'GHN_API_TOKEN';
UPDATE settings SET `value` = 'your_new_shop_id' WHERE `key` = 'GHN_SHOP_ID';
```

**Cách 3: Cập nhật qua API (nếu có admin panel)**
```bash
POST http://localhost:8000/api/settings
{
  "GHN_API_TOKEN": "your_new_token",
  "GHN_SHOP_ID": "your_new_shop_id"
}
```

### 7. Clear cache

Sau khi cập nhật cấu hình, clear cache:

```bash
docker exec laravel-backend php artisan config:clear
docker exec laravel-backend php artisan cache:clear
```

## Các lỗi thường gặp:

### Lỗi 401: Unauthorized
- **Nguyên nhân**: API Token không hợp lệ hoặc đã hết hạn
- **Giải pháp**: Kiểm tra lại token trong GHN dashboard và cập nhật

### Lỗi 404: Not Found
- **Nguyên nhân**: Shop ID không tồn tại
- **Giải pháp**: Kiểm tra lại Shop ID trong GHN dashboard

### Lỗi: "API Token chưa được cấu hình"
- **Nguyên nhân**: Chưa set GHN_API_TOKEN trong .env hoặc database
- **Giải pháp**: Thêm token vào .env hoặc database

### Lỗi: "Shop ID chưa được cấu hình"
- **Nguyên nhân**: Chưa set GHN_SHOP_ID trong .env hoặc database
- **Giải pháp**: Thêm shop_id vào .env hoặc database

## Lấy thông tin từ GHN Dashboard:

1. Đăng nhập vào [GHN Dashboard](https://5sao.ghn.vn/)
2. Vào **Cài đặt** > **API Integration**
3. Copy **API Token** và **Shop ID**
4. Cập nhật vào hệ thống

## Debug nâng cao:

### Bật debug mode trong code

File `backend/app/Services/GHNService.php` đã được cải thiện để log chi tiết. Kiểm tra logs:

```bash
docker exec laravel-backend tail -f storage/logs/laravel.log | grep GHN
```

### Test với Postman/Insomnia

Import các request sau để test:

**Request 1: Get Shop Detail**
```
GET https://online-gateway.ghn.vn/shiip/public-api/v2/shop/detail
Headers:
  Token: YOUR_API_TOKEN
  ShopId: YOUR_SHOP_ID
```

**Request 2: Get Shop by ID**
```
GET https://online-gateway.ghn.vn/shiip/public-api/v2/shop?id=YOUR_SHOP_ID
Headers:
  Token: YOUR_API_TOKEN
```

## Liên hệ hỗ trợ:

Nếu vẫn gặp vấn đề, vui lòng cung cấp:
1. Output của `docker exec laravel-backend php artisan tinker`:
   ```php
   config('services.ghn.api_token')
   config('services.ghn.shop_id')
   config('services.ghn.base_url')
   ```

2. Logs từ `storage/logs/laravel.log` (phần liên quan đến GHN)

3. Response từ API test (curl hoặc Postman)

