# Khắc phục lỗi Google OAuth: redirect_uri_mismatch

## Vấn đề

Lỗi: `Error 400: redirect_uri_mismatch`

Điều này có nghĩa là redirect URI trong request không khớp với URI đã đăng ký trong Google Cloud Console.

## Nguyên nhân

1. **Redirect URI trong `.env` không khớp với Google Cloud Console**
2. **Thiếu dấu `/` cuối hoặc có dấu `/` thừa**
3. **Sử dụng `localhost` thay vì `127.0.0.1` hoặc ngược lại**
4. **Port không đúng**

## Cách khắc phục

### Bước 1: Kiểm tra redirect URI đang được sử dụng

Test API để xem redirect URI:
```bash
curl http://localhost:8000/api/google
```

Hoặc kiểm tra trong code:
```bash
docker exec laravel-backend php artisan tinker
```

Trong tinker:
```php
config('services.google.redirect')
```

### Bước 2: Kiểm tra trong Google Cloud Console

1. **Truy cập Google Cloud Console:**
   - https://console.cloud.google.com/
   - Vào project của bạn

2. **Vào OAuth 2.0 Client ID:**
   - **APIs & Services** > **Credentials**
   - Click vào OAuth 2.0 Client ID của bạn

3. **Kiểm tra "Authorized redirect URIs":**
   - Xem danh sách URI đã đăng ký
   - So sánh với URI trong `.env`

### Bước 3: Thêm đúng redirect URI

**URI phải khớp CHÍNH XÁC**, bao gồm:
- Protocol: `http://` hoặc `https://`
- Host: `localhost` hoặc `127.0.0.1` (phải giống nhau)
- Port: `8000` (phải đúng)
- Path: `/api/google/callback` (phải đúng, không có dấu `/` cuối)

**Ví dụ đúng:**
```
http://localhost:8000/api/google/callback
```

**Ví dụ sai:**
```
http://localhost:8000/api/google/callback/  ❌ (có dấu / cuối)
http://127.0.0.1:8000/api/google/callback   ❌ (nếu đã đăng ký localhost)
https://localhost:8000/api/google/callback  ❌ (sai protocol)
http://localhost/api/google/callback        ❌ (thiếu port)
```

### Bước 4: Thêm nhiều URI nếu cần

Nếu bạn dùng cả `localhost` và `127.0.0.1`, thêm cả hai:

```
http://localhost:8000/api/google/callback
http://127.0.0.1:8000/api/google/callback
```

### Bước 5: Kiểm tra lại .env

Đảm bảo trong `backend/.env`:

```env
GOOGLE_REDIRECT_URL=http://localhost:8000/api/google/callback
```

**Lưu ý:**
- Không có dấu `/` cuối
- Không có khoảng trắng
- Protocol đúng (`http://` cho local, `https://` cho production)

### Bước 6: Clear config cache

```bash
docker exec laravel-backend php artisan config:clear
```

### Bước 7: Test lại

```bash
curl http://localhost:8000/api/google
```

Response sẽ có `debug` info hiển thị redirect URI đang được sử dụng.

## Checklist

- [ ] Redirect URI trong `.env` khớp chính xác với Google Cloud Console
- [ ] Không có dấu `/` cuối
- [ ] Protocol đúng (`http://` cho local)
- [ ] Host đúng (`localhost` hoặc `127.0.0.1`)
- [ ] Port đúng (`8000`)
- [ ] Path đúng (`/api/google/callback`)
- [ ] Đã clear config cache
- [ ] Đã test lại

## Debug

Sau khi cập nhật code, API sẽ trả về debug info:

```json
{
  "success": true,
  "url": "...",
  "debug": {
    "redirect_uri_used": "http://localhost:8000/api/google/callback",
    "note": "Đảm bảo redirect URI này đã được thêm vào Google Cloud Console"
  }
}
```

Copy `redirect_uri_used` và thêm vào Google Cloud Console nếu chưa có.

## Lưu ý quan trọng

1. **URI phải khớp CHÍNH XÁC** - Google rất strict về điều này
2. **Không có dấu `/` cuối** - `http://localhost:8000/api/google/callback` ✅, không phải `http://localhost:8000/api/google/callback/` ❌
3. **Protocol phải đúng** - `http://` cho local, `https://` cho production
4. **Sau khi thêm URI mới**, đợi vài phút để Google cập nhật

## Nếu vẫn lỗi

1. **Kiểm tra lại trong Google Cloud Console:**
   - Vào Credentials > OAuth 2.0 Client ID
   - Xem "Authorized redirect URIs"
   - Copy chính xác URI từ đó

2. **Kiểm tra logs:**
   ```bash
   docker-compose logs -f backend | grep Google
   ```

3. **Test với URI chính xác:**
   - Copy URI từ Google Cloud Console
   - Paste vào `.env`
   - Clear cache và test lại


