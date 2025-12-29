# HƯỚNG DẪN DEPLOY VÀ CẤU HÌNH ENVIRONMENT

## Vấn đề: Frontend vẫn gọi tới localhost sau khi thay đổi .env

### Nguyên nhân:
1. **Vite cache**: Vite cache biến môi trường khi build
2. **Hardcode URL**: Một số file đang hardcode URL
3. **Chưa rebuild**: Cần rebuild sau khi thay đổi `.env`

## Giải pháp:

### 1. Tạo file `.env` hoặc `.env.production` trong frontend

Tạo file `frontend/.env.production`:
```env
VITE_API_BASE_URL=https://shop-backend.dinon.uk
VITE_WEBSOCKET_URL=wss://shop-backend.dinon.uk:6001
```

Hoặc `frontend/.env`:
```env
VITE_API_BASE_URL=https://shop-backend.dinon.uk
VITE_WEBSOCKET_URL=wss://shop-backend.dinon.uk:6001
```

### 2. Xóa cache và rebuild

```bash
cd frontend

# Xóa cache
rm -rf node_modules/.vite
rm -rf dist

# Rebuild
npm run build
```

### 3. Kiểm tra biến môi trường

Sau khi build, kiểm tra file `dist/index.html` hoặc `dist/assets/*.js` để xem URL có đúng không.

### 4. Backend .env

Đảm bảo `backend/.env` có:
```env
APP_URL=https://shop-backend.dinon.uk
WEBSOCKET_URL=http://localhost:6001
```

### 5. WebSocket Server

Nếu WebSocket server chạy trên cùng server, cấu hình:
```env
PORT=6001
FRONTEND_URL=https://your-frontend-domain.com
```

## Lưu ý:

1. **Vite chỉ đọc biến bắt đầu với `VITE_`**
2. **Phải rebuild sau khi thay đổi `.env`**
3. **Xóa cache nếu vẫn không thay đổi**
4. **Kiểm tra file build có chứa URL mới không**

## Kiểm tra nhanh:

Mở browser console và chạy:
```javascript
console.log(import.meta.env.VITE_API_BASE_URL)
```

Nếu vẫn hiển thị `http://127.0.0.1:8000`, cần:
1. Xóa cache
2. Rebuild
3. Hard refresh browser (Ctrl+Shift+R)

