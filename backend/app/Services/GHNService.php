<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Exception;

class GHNService
{
    private $baseUrl;
    private $apiToken;
    private $shopId;

    public function __construct()
    {
        $this->baseUrl = config('services.ghn.base_url', 'https://online-gateway.ghn.vn/shiip/public-api/v2');
        $this->apiToken = config('services.ghn.api_token');
        $this->shopId = config('services.ghn.shop_id');
        
        // Nếu không có trong config, thử lấy từ database
        if (empty($this->apiToken) || empty($this->shopId)) {
            try {
                $settings = \App\Models\Setting::whereIn('key', ['GHN_API_TOKEN', 'GHN_SHOP_ID', 'GHN_BASE_URL'])
                    ->pluck('value', 'key');
                
                if (empty($this->apiToken) && isset($settings['GHN_API_TOKEN'])) {
                    $this->apiToken = $settings['GHN_API_TOKEN'];
                }
                
                if (empty($this->shopId) && isset($settings['GHN_SHOP_ID'])) {
                    $this->shopId = $settings['GHN_SHOP_ID'];
                }
                
                if (isset($settings['GHN_BASE_URL']) && !empty($settings['GHN_BASE_URL'])) {
                    $this->baseUrl = $settings['GHN_BASE_URL'];
                }
            } catch (\Exception $e) {
                Log::warning('Could not load GHN settings from database: ' . $e->getMessage());
            }
        }
    }

  
    public function calculateShippingFee(array $data)
    {
        try {
            $response = Http::withHeaders([
                'Content-Type' => 'application/json',
                'Token' => $this->apiToken,
                'ShopId' => $this->shopId,
            ])->post($this->baseUrl . '/shipping-order/fee', $data);

            if ($response->successful()) {
                $result = $response->json();
                
                if (isset($result['code']) && $result['code'] === 200) {
                    return [
                        'success' => true,
                        'data' => $result['data'],
                        'message' => 'Tính phí thành công'
                    ];
                } else {
                    return [
                        'success' => false,
                        'message' => $result['message'] ?? 'Có lỗi xảy ra khi tính phí'
                    ];
                }
            }

            return [
                'success' => false,
                'message' => 'Không thể kết nối đến GHN API'
            ];

        } catch (Exception $e) {
            Log::error('GHN API Error: ' . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Có lỗi xảy ra khi tính phí vận chuyển'
            ];
        }
    }

   
    public function getShopInfo()
    {
        try {
            // Kiểm tra config
            if (empty($this->apiToken)) {
                Log::error('GHN API Token is empty');
                return [
                    'success' => false,
                    'message' => 'API Token chưa được cấu hình. Vui lòng kiểm tra GHN_API_TOKEN trong .env hoặc Settings'
                ];
            }

            if (empty($this->shopId)) {
                Log::error('GHN Shop ID is empty');
                return [
                    'success' => false,
                    'message' => 'Shop ID chưa được cấu hình. Vui lòng kiểm tra GHN_SHOP_ID trong .env hoặc Settings'
                ];
            }

            Log::info('GHN Get Shop Info - Attempt 1: /shop', [
                'url' => $this->baseUrl . '/shop',
                'shop_id' => $this->shopId
            ]);

            // Thử endpoint đầu tiên: /shop
            // Endpoint này có thể cần ShopId trong header hoặc query param
            $response = Http::withHeaders([
                'Token' => $this->apiToken,
                'ShopId' => $this->shopId, // Thêm ShopId vào header
            ])->get($this->baseUrl . '/shop', [
                'id' => $this->shopId
            ]);

            if ($response->successful()) {
                $data = $response->json();
                Log::info('GHN /shop Response:', $data);
                
                if (isset($data['code']) && $data['code'] === 200) {
                    return [
                        'success' => true,
                        'data' => $data['data']
                    ];
                } else {
                    Log::warning('GHN /shop returned non-200 code', [
                        'code' => $data['code'] ?? 'unknown',
                        'message' => $data['message'] ?? 'unknown'
                    ]);
                }
            } else {
                Log::warning('GHN /shop request failed', [
                    'status' => $response->status(),
                    'body' => $response->body()
                ]);
            }

            // Thử endpoint thứ hai: /shop/detail
            Log::info('GHN Get Shop Info - Attempt 2: /shop/detail', [
                'url' => $this->baseUrl . '/shop/detail',
                'shop_id' => $this->shopId
            ]);

            $response2 = Http::withHeaders([
                'Token' => $this->apiToken,
                'ShopId' => $this->shopId,
            ])->get($this->baseUrl . '/shop/detail');

            if ($response2->successful()) {
                $data2 = $response2->json();
                Log::info('GHN /shop/detail Response:', $data2);
                
                if (isset($data2['code']) && $data2['code'] === 200) {
                    return [
                        'success' => true,
                        'data' => $data2['data']
                    ];
                } else {
                    Log::warning('GHN /shop/detail returned non-200 code', [
                        'code' => $data2['code'] ?? 'unknown',
                        'message' => $data2['message'] ?? 'unknown'
                    ]);
                }
            } else {
                Log::warning('GHN /shop/detail request failed', [
                    'status' => $response2->status(),
                    'body' => $response2->body()
                ]);
            }

            // Nếu cả hai đều fail, trả về lỗi chi tiết
            $errorMessage = 'Không thể lấy thông tin shop từ GHN API. ';
            if ($response->status() === 401) {
                $errorMessage .= 'API Token không hợp lệ hoặc đã hết hạn.';
            } elseif ($response->status() === 404) {
                $errorMessage .= 'Shop ID không tồn tại.';
            } else {
                $errorMessage .= 'Vui lòng kiểm tra lại API Token và Shop ID.';
            }

            return [
                'success' => false,
                'message' => $errorMessage,
                'debug' => [
                    'response1_status' => $response->status(),
                    'response1_body' => $response->body(),
                    'response2_status' => $response2->status(),
                    'response2_body' => $response2->body(),
                ]
            ];

        } catch (Exception $e) {
            Log::error('GHN Shop Info Error: ' . $e->getMessage(), [
                'trace' => $e->getTraceAsString()
            ]);
            return [
                'success' => false,
                'message' => 'Có lỗi xảy ra khi lấy thông tin shop: ' . $e->getMessage()
            ];
        }
    }

 
    public function calculateOrderShippingFee(array $orderData)
    {
        // Lấy thông tin shop từ GHN API
        $shopInfo = $this->getShopInfo();
        
        if (!$shopInfo['success']) {
            return $shopInfo;
        }

        $shopData = $shopInfo['data'];
        
        $params = [
            'service_type_id' => $orderData['service_type_id'] ?? 2, 
            'from_district_id' => $shopData['district_id'] ?? 1820, 
            'from_ward_code' => $shopData['ward_code'] ?? '030712', 
            'to_district_id' => $orderData['to_district_id'],
            'to_ward_code' => $orderData['to_ward_code'],
            'weight' => $orderData['weight'],
        ];

        // Thêm các tham số tùy chọn
        if (isset($orderData['length'])) {
            $params['length'] = $orderData['length'];
        }
        if (isset($orderData['width'])) {
            $params['width'] = $orderData['width'];
        }
        if (isset($orderData['height'])) {
            $params['height'] = $orderData['height'];
        }
        if (isset($orderData['insurance_value'])) {
            $params['insurance_value'] = $orderData['insurance_value'];
        }
        if (isset($orderData['cod_value'])) {
            $params['cod_value'] = $orderData['cod_value'];
        }
        if (isset($orderData['coupon'])) {
            $params['coupon'] = $orderData['coupon'];
        }
        if (isset($orderData['cod_failed_amount'])) {
            $params['cod_failed_amount'] = $orderData['cod_failed_amount'];
        }

        if (($orderData['service_type_id'] ?? 2) === 5) {
            if (!isset($orderData['items']) || empty($orderData['items'])) {
                return [
                    'success' => false,
                    'message' => 'Hàng nặng yêu cầu thông tin items'
                ];
            }
            $params['items'] = $orderData['items'];
        }

        Log::info('GHN API Request:', $params);
        return $this->calculateShippingFee($params);
    }

    /**
     * Validate dữ liệu đầu vào
     *
     * @param array $data
     * @return array
     */
    public function validateShippingData(array $data)
    {
        $errors = [];

        if (empty($data['to_district_id'])) {
            $errors[] = 'Mã quận/huyện người nhận là bắt buộc';
        }

        if (empty($data['to_ward_code'])) {
            $errors[] = 'Mã phường/xã người nhận là bắt buộc';
        }

        if (empty($data['weight'])) {
            $errors[] = 'Cân nặng là bắt buộc';
        } elseif (!is_numeric($data['weight']) || $data['weight'] <= 0) {
            $errors[] = 'Cân nặng phải là số dương';
        } elseif ($data['weight'] > 1600000) {
            $errors[] = 'Cân nặng tối đa là 1.600.000 gram';
        }

        if (isset($data['service_type_id']) && !in_array($data['service_type_id'], [2, 5])) {
            $errors[] = 'Loại dịch vụ phải là 2 (hàng nhẹ) hoặc 5 (hàng nặng)';
        }

        if (isset($data['insurance_value']) && (!is_numeric($data['insurance_value']) || $data['insurance_value'] < 0)) {
            $errors[] = 'Giá trị khai giá phải là số không âm';
        } elseif (isset($data['insurance_value']) && $data['insurance_value'] > 5000000) {
            $errors[] = 'Giá trị khai giá tối đa là 5.000.000 VNĐ';
        }

        if (isset($data['cod_value']) && (!is_numeric($data['cod_value']) || $data['cod_value'] < 0)) {
            $errors[] = 'Tiền thu hộ phải là số không âm';
        } elseif (isset($data['cod_value']) && $data['cod_value'] > 10000000) {
            $errors[] = 'Tiền thu hộ tối đa là 10.000.000 VNĐ';
        }

        // Validate kích thước
        $dimensions = ['length', 'width', 'height'];
        foreach ($dimensions as $dimension) {
            if (isset($data[$dimension])) {
                if (!is_numeric($data[$dimension]) || $data[$dimension] <= 0) {
                    $errors[] = ucfirst($dimension) . ' phải là số dương';
                } elseif ($data[$dimension] > 200) {
                    $errors[] = ucfirst($dimension) . ' tối đa là 200 cm';
                }
            }
        }

        // Validate items cho hàng nặng
        if (($data['service_type_id'] ?? 2) === 5) {
            if (!isset($data['items']) || empty($data['items'])) {
                $errors[] = 'Hàng nặng yêu cầu thông tin items';
            } else {
                foreach ($data['items'] as $index => $item) {
                    if (empty($item['name'])) {
                        $errors[] = "Item " . ($index + 1) . ": Tên sản phẩm là bắt buộc";
                    }
                    if (empty($item['quantity']) || !is_numeric($item['quantity']) || $item['quantity'] <= 0) {
                        $errors[] = "Item " . ($index + 1) . ": Số lượng phải là số dương";
                    }
                    if (empty($item['weight']) || !is_numeric($item['weight']) || $item['weight'] <= 0) {
                        $errors[] = "Item " . ($index + 1) . ": Cân nặng phải là số dương";
                    }
                    if (empty($item['length']) || !is_numeric($item['length']) || $item['length'] <= 0) {
                        $errors[] = "Item " . ($index + 1) . ": Chiều dài phải là số dương";
                    }
                    if (empty($item['width']) || !is_numeric($item['width']) || $item['width'] <= 0) {
                        $errors[] = "Item " . ($index + 1) . ": Chiều rộng phải là số dương";
                    }
                    if (empty($item['height']) || !is_numeric($item['height']) || $item['height'] <= 0) {
                        $errors[] = "Item " . ($index + 1) . ": Chiều cao phải là số dương";
                    }
                }
            }
        }

        return [
            'valid' => empty($errors),
            'errors' => $errors
        ];
    }

    /**
     * Lấy danh sách tỉnh/thành phố
     *
     * @return array
     */
    public function getProvinces()
    {
        try {
            $response = Http::withHeaders([
                'Token' => $this->apiToken,
            ])->get($this->baseUrl . '/master-data/province');

            if ($response->successful()) {
                $result = $response->json();
                if (isset($result['code']) && $result['code'] === 200) {
                    return [
                        'success' => true,
                        'data' => $result['data']
                    ];
                }
            }

            return [
                'success' => false,
                'message' => 'Không thể lấy danh sách tỉnh/thành phố'
            ];

        } catch (Exception $e) {
            Log::error('GHN API Error: ' . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Có lỗi xảy ra khi lấy danh sách tỉnh/thành phố'
            ];
        }
    }

    /**
     * Lấy danh sách quận/huyện theo tỉnh/thành phố
     *
     * @param int $provinceId
     * @return array
     */
    public function getDistricts($provinceId)
    {
        try {
            $response = Http::withHeaders([
                'Token' => $this->apiToken,
            ])->get($this->baseUrl . '/master-data/district', [
                'province_id' => $provinceId
            ]);

            if ($response->successful()) {
                $result = $response->json();
                if (isset($result['code']) && $result['code'] === 200) {
                    return [
                        'success' => true,
                        'data' => $result['data']
                    ];
                }
            }

            return [
                'success' => false,
                'message' => 'Không thể lấy danh sách quận/huyện'
            ];

        } catch (Exception $e) {
            Log::error('GHN API Error: ' . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Có lỗi xảy ra khi lấy danh sách quận/huyện'
            ];
        }
    }

    /**
     * Lấy danh sách phường/xã theo quận/huyện
     *
     * @param int $districtId
     * @return array
     */
    public function getWards($districtId)
    {
        try {
            $response = Http::withHeaders([
                'Token' => $this->apiToken,
            ])->get($this->baseUrl . '/master-data/ward', [
                'district_id' => $districtId
            ]);

            if ($response->successful()) {
                $result = $response->json();
                if (isset($result['code']) && $result['code'] === 200) {
                    return [
                        'success' => true,
                        'data' => $result['data']
                    ];
                }
            }

            return [
                'success' => false,
                'message' => 'Không thể lấy danh sách phường/xã'
            ];

        } catch (Exception $e) {
            Log::error('GHN API Error: ' . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Có lỗi xảy ra khi lấy danh sách phường/xã'
            ];
        }
    }
} 