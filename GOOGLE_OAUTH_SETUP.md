# Hướng dẫn cấu hình Google OAuth

## Lỗi: "Missing required parameter: client_id"

Lỗi này xảy ra khi `GOOGLE_CLIENT_ID` chưa được cấu hình trong file `.env`.

## Cách khắc phục

### Bước 1: Tạo Google OAuth Credentials

1. **Truy cập Google Cloud Console:**
   - Vào: https://console.cloud.google.com/
   - Đăng nhập bằng tài khoản Google

2. **Tạo Project mới (nếu chưa có):**
   - Click vào dropdown project ở top bar
   - Click "New Project"
   - Đặt tên project (ví dụ: "My E-commerce")
   - Click "Create"

3. **Bật Google+ API:**
   - Vào **APIs & Services** > **Library**
   - Tìm "Google+ API" hoặc "Google Identity"
   - Click "Enable"

4. **Tạo OAuth 2.0 Credentials:**
   - Vào **APIs & Services** > **Credentials**
   - Click **+ CREATE CREDENTIALS** > **OAuth client ID**
   - Nếu chưa có OAuth consent screen, sẽ được yêu cầu tạo:
     - **User Type**: External (cho development) hoặc Internal (cho G Suite)
     - **App name**: Tên ứng dụng của bạn
     - **User support email**: Email hỗ trợ
     - **Developer contact**: Email của bạn
     - Click **Save and Continue**
     - **Scopes**: Click **Save and Continue** (có thể bỏ qua)
     - **Test users**: Thêm email test (nếu cần)
     - Click **Save and Continue**

5. **Tạo OAuth Client ID:**
   - **Application type**: Web application
   - **Name**: Tên client (ví dụ: "My E-commerce Web")
   - **Authorized JavaScript origins**:
     ```
     http://localhost:5173
     http://localhost:8000
     http://127.0.0.1:5173
     http://127.0.0.1:8000
     ```
     (Thêm domain production khi deploy)
   - **Authorized redirect URIs**:
     ```
     http://localhost:8000/api/google/callback
     http://127.0.0.1:8000/api/google/callback
     ```
     (Thêm domain production khi deploy)
   - Click **Create**

6. **Copy Credentials:**
   - Sau khi tạo, bạn sẽ thấy:
     - **Client ID**: Copy giá trị này
     - **Client Secret**: Click "Show" và copy

### Bước 2: Cấu hình trong .env

Mở file `backend/.env` và thêm:

```env
GOOGLE_CLIENT_ID=your_client_id_here.apps.googleusercontent.com
GOOGLE_CLIENT_SECRET=your_client_secret_here
GOOGLE_REDIRECT_URL=http://localhost:8000/api/google/callback
```

**Lưu ý:**
- Thay `your_client_id_here` bằng Client ID bạn vừa copy
- Thay `your_client_secret_here` bằng Client Secret bạn vừa copy
- `GOOGLE_REDIRECT_URL` phải khớp với "Authorized redirect URIs" trong Google Cloud Console

### Bước 3: Clear config cache

```bash
docker exec laravel-backend php artisan config:clear
```

### Bước 4: Restart container (nếu cần)

```bash
docker-compose restart backend
```

### Bước 5: Test cấu hình

```bash
curl http://localhost:8000/api/test-google-login
```

Hoặc test endpoint:
```bash
curl http://localhost:8000/api/google
```

## Kiểm tra cấu hình

### Cách 1: Qua API test

```bash
curl http://localhost:8000/api/test-google-login
```

Response sẽ hiển thị:
```json
{
  "message": "Google OAuth test successful",
  "config": {
    "google_client_id": "your_client_id",
    "google_client_secret": "your_client_secret",
    "google_redirect": "http://localhost:8000/api/google/callback",
    "frontend_url": "http://localhost:5173"
  }
}
```

### Cách 2: Qua artisan tinker

```bash
docker exec laravel-backend php artisan tinker
```

Trong tinker:
```php
config('services.google.client_id')
config('services.google.client_secret')
config('services.google.redirect')
```

## Lưu ý quan trọng

### 1. Authorized Redirect URIs

Redirect URI trong `.env` **PHẢI** khớp chính xác với URI đã đăng ký trong Google Cloud Console:

- ✅ Đúng: `http://localhost:8000/api/google/callback`
- ❌ Sai: `http://localhost:8000/api/google/callback/` (có dấu / cuối)
- ❌ Sai: `http://127.0.0.1:8000/api/google/callback` (nếu đã đăng ký localhost)

### 2. Authorized JavaScript Origins

Phải thêm đầy đủ các origins:
- `http://localhost:5173` (frontend)
- `http://localhost:8000` (backend)
- Domain production (khi deploy)

### 3. OAuth Consent Screen

- **Development**: Có thể dùng "External" và thêm test users
- **Production**: Cần submit để Google review và phê duyệt

### 4. Environment Variables

Đảm bảo các biến trong `.env`:
- Không có khoảng trắng thừa
- Không có dấu ngoặc kép (trừ khi giá trị có khoảng trắng)
- Đúng format

## Troubleshooting

### Lỗi: "redirect_uri_mismatch"

**Nguyên nhân:** Redirect URI không khớp với URI đã đăng ký.

**Giải pháp:**
1. Kiểm tra `GOOGLE_REDIRECT_URL` trong `.env`
2. Kiểm tra "Authorized redirect URIs" trong Google Cloud Console
3. Đảm bảo chúng khớp chính xác (kể cả http/https, port, path)

### Lỗi: "invalid_client"

**Nguyên nhân:** Client ID hoặc Client Secret không đúng.

**Giải pháp:**
1. Kiểm tra lại Client ID và Client Secret trong `.env`
2. Đảm bảo không có khoảng trắng thừa
3. Clear config cache: `php artisan config:clear`

### Lỗi: "access_denied"

**Nguyên nhân:** User từ chối quyền hoặc app chưa được phê duyệt.

**Giải pháp:**
1. Nếu là development, thêm email vào "Test users" trong OAuth Consent Screen
2. Nếu là production, đợi Google phê duyệt app

## Production Deployment

Khi deploy lên production:

1. **Cập nhật Authorized JavaScript Origins:**
   ```
   https://yourdomain.com
   ```

2. **Cập nhật Authorized Redirect URIs:**
   ```
   https://yourdomain.com/api/google/callback
   ```

3. **Cập nhật .env:**
   ```env
   GOOGLE_REDIRECT_URL=https://yourdomain.com/api/google/callback
   APP_URL=https://yourdomain.com
   FRONTEND_URL=https://yourdomain.com
   ```

4. **Submit OAuth Consent Screen:**
   - Vào OAuth Consent Screen
   - Click "PUBLISH APP"
   - Điền đầy đủ thông tin
   - Submit để Google review

## Tài liệu tham khảo

- [Google OAuth 2.0 Documentation](https://developers.google.com/identity/protocols/oauth2)
- [Laravel Socialite Documentation](https://laravel.com/docs/socialite)
- [Google Cloud Console](https://console.cloud.google.com/)

