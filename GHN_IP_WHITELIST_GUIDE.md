# Hướng dẫn Whitelist IP cho GHN API

## Vấn đề

Khi gọi GHN API, bạn gặp lỗi:
```
{"code":401,"message":"IP 171.225.184.190 is not valid!","data":null}
```

Đây là lỗi do IP của server chưa được whitelist trong GHN Dashboard.

## Giải pháp

### Bước 1: Xác định IP cần whitelist

**Nếu chạy trên server production:**
- IP public của server (ví dụ: `171.225.184.190`)

**Nếu chạy local (development):**
- IP public của máy bạn (không phải `127.0.0.1` hoặc `localhost`)
- Để lấy IP public: truy cập https://api.ipify.org?format=json

**Nếu chạy trong Docker:**
- IP public của host machine (không phải IP container)

### Bước 2: Thêm IP vào GHN Dashboard

1. **Đăng nhập GHN Dashboard**
   - Truy cập: https://5sao.ghn.vn/
   - Đăng nhập bằng tài khoản GHN của bạn

2. **Vào phần API Integration**
   - Click vào menu **Cài đặt** (Settings)
   - Chọn **API Integration** hoặc **Tích hợp API**

3. **Thêm IP vào Whitelist**
   - Tìm phần **Whitelist IP** hoặc **Danh sách IP được phép**
   - Click **Thêm IP** hoặc **Add IP**
   - Nhập IP: `171.225.184.190` (hoặc IP của bạn)
   - Click **Lưu** hoặc **Save**

4. **Đợi cập nhật**
   - Thường mất 1-5 phút để GHN cập nhật whitelist
   - Sau đó thử lại API call

### Bước 3: Kiểm tra lại

Sau khi thêm IP, test lại:

```bash
curl http://localhost:8000/api/shipping/provinces
```

Hoặc trong browser:
```
http://localhost:8000/api/shipping/provinces
```

## Lưu ý quan trọng

### 1. IP thay đổi (Dynamic IP)

Nếu bạn có **Dynamic IP** (IP thay đổi mỗi lần kết nối internet):

**Giải pháp:**
- Sử dụng **Static IP** từ nhà cung cấp internet
- Hoặc sử dụng **VPN/Proxy** có IP cố định
- Hoặc thêm nhiều IP vào whitelist (nếu GHN cho phép)

### 2. Chạy trên nhiều môi trường

Nếu bạn có nhiều môi trường (local, staging, production):

**Cần whitelist:**
- IP của server production
- IP của server staging (nếu có)
- IP public của máy local (nếu test từ local)

### 3. Docker/Container

Khi chạy trong Docker:
- **KHÔNG** dùng IP container (ví dụ: `172.17.0.x`)
- **PHẢI** dùng IP public của host machine

### 4. Load Balancer / Reverse Proxy

Nếu có Load Balancer hoặc Reverse Proxy:
- Có thể cần whitelist IP của Load Balancer
- Hoặc cấu hình để forward real IP

## Cách lấy IP hiện tại

### Từ terminal/command line:

**Windows PowerShell:**
```powershell
Invoke-RestMethod -Uri "https://api.ipify.org?format=json"
```

**Linux/Mac:**
```bash
curl https://api.ipify.org?format=json
```

**Hoặc:**
```bash
curl ifconfig.me
```

### Từ code Laravel:

```php
// Trong ShippingController hoặc bất kỳ controller nào
$ip = Http::get('https://api.ipify.org?format=json')->json()['ip'];
echo "IP hiện tại: " . $ip;
```

### Từ Docker container:

```bash
docker exec laravel-backend curl -s https://api.ipify.org?format=json
```

## Troubleshooting

### Vẫn bị lỗi sau khi thêm IP?

1. **Kiểm tra lại IP đã thêm đúng chưa**
   - So sánh IP trong error message với IP đã thêm
   - Đảm bảo không có khoảng trắng thừa

2. **Đợi thêm vài phút**
   - GHN cần thời gian để cập nhật whitelist
   - Thử lại sau 5-10 phút

3. **Kiểm tra IP có thay đổi không**
   - Nếu là Dynamic IP, có thể đã thay đổi
   - Lấy IP mới và thêm lại

4. **Kiểm tra tài khoản GHN**
   - Đảm bảo tài khoản có quyền quản lý API
   - Liên hệ GHN support nếu cần

### Không tìm thấy phần Whitelist IP?

1. **Kiểm tra phiên bản GHN Dashboard**
   - Một số tài khoản có thể có giao diện khác
   - Tìm trong menu: **Cài đặt** > **API** > **Bảo mật**

2. **Liên hệ GHN Support**
   - Email: support@ghn.vn
   - Hotline: 1900-6083
   - Yêu cầu hướng dẫn whitelist IP cho API

## Alternative: Sử dụng Proxy (Nâng cao)

Nếu không thể whitelist IP (ví dụ: IP thay đổi liên tục), có thể sử dụng proxy:

```php
// Trong GHNService.php
$response = Http::withOptions([
    'proxy' => 'http://proxy-server:port'
])->withHeaders([
    'Token' => $this->apiToken,
])->get($this->baseUrl . '/shop/detail');
```

**Lưu ý:** Cần có proxy server có IP được whitelist.

## Tóm tắt

1. ✅ Lấy IP public của server/máy bạn
2. ✅ Đăng nhập GHN Dashboard
3. ✅ Vào Cài đặt > API Integration > Whitelist IP
4. ✅ Thêm IP vào danh sách
5. ✅ Đợi 5-10 phút
6. ✅ Test lại API

Nếu vẫn gặp vấn đề, vui lòng liên hệ GHN Support hoặc kiểm tra logs chi tiết.

