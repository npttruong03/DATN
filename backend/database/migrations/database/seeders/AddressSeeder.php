<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Address;

class AddressSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $addresses = [
            [
                'full_name' => 'Nguyễn Văn A',
                'phone' => '0123456789',
                'province' => 'Hà Nội',
                'district' => 'Quận Cầu Giấy',
                'ward' => 'Phường Dịch Vọng',
                'street' => 'Số 123, Đường Cầu Giấy',
                'user_id' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'full_name' => 'Trần Thị B',
                'phone' => '0987654321',
                'province' => 'TP. Hồ Chí Minh',
                'district' => 'Quận 1',
                'ward' => 'Phường Bến Nghé',
                'street' => 'Số 456, Đường Nguyễn Huệ',
                'user_id' => 3,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'full_name' => 'Lê Văn C',
                'phone' => '0912345678',
                'province' => 'Đà Nẵng',
                'district' => 'Quận Hải Châu',
                'ward' => 'Phường Thạch Thang',
                'street' => 'Số 789, Đường Lê Duẩn',
                'user_id' => 4,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'full_name' => 'Phạm Thị D',
                'phone' => '0923456789',
                'province' => 'Hà Nội',
                'district' => 'Quận Đống Đa',
                'ward' => 'Phường Láng Thượng',
                'street' => 'Số 321, Đường Láng',
                'user_id' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'full_name' => 'Hoàng Văn E',
                'phone' => '0934567890',
                'province' => 'TP. Hồ Chí Minh',
                'district' => 'Quận 3',
                'ward' => 'Phường Võ Thị Sáu',
                'street' => 'Số 654, Đường Võ Thị Sáu',
                'user_id' => 3,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($addresses as $address) {
            Address::create($address);
        }
    }
}
