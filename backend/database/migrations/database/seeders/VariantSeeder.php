<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Variant;
use Illuminate\Support\Str;

class VariantSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $variants = [
            // iPhone 15 Pro Max variants
            [
                'color' => 'Titanium Natural',
                'size' => '256GB',
                'price' => 29990000,
                'sku' => 'IP15PM-NAT-256',
                'product_id' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Titanium Blue',
                'size' => '256GB',
                'price' => 29990000,
                'sku' => 'IP15PM-BLU-256',
                'product_id' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Titanium White',
                'size' => '512GB',
                'price' => 33990000,
                'sku' => 'IP15PM-WHT-512',
                'product_id' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Samsung Galaxy S24 Ultra variants
            [
                'color' => 'Titanium Black',
                'size' => '256GB',
                'price' => 24990000,
                'sku' => 'S24U-BLK-256',
                'product_id' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Titanium Gray',
                'size' => '512GB',
                'price' => 27990000,
                'sku' => 'S24U-GRY-512',
                'product_id' => 2,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // MacBook Pro M3 Pro variants
            [
                'color' => 'Space Gray',
                'size' => '14 inch',
                'price' => 45990000,
                'sku' => 'MBP-M3-SG-14',
                'product_id' => 3,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Silver',
                'size' => '14 inch',
                'price' => 45990000,
                'sku' => 'MBP-M3-SLV-14',
                'product_id' => 3,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Dell XPS 13 variants
            [
                'color' => 'Platinum',
                'size' => '13.4 inch',
                'price' => 25990000,
                'sku' => 'XPS13-PLT-13',
                'product_id' => 4,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Áo sơ mi nam Uniqlo variants
            [
                'color' => 'Trắng',
                'size' => 'M',
                'price' => 299000,
                'sku' => 'ASM-UNI-WHT-M',
                'product_id' => 5,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Xanh navy',
                'size' => 'L',
                'price' => 299000,
                'sku' => 'ASM-UNI-NAV-L',
                'product_id' => 5,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Xám',
                'size' => 'XL',
                'price' => 299000,
                'sku' => 'ASM-UNI-GRY-XL',
                'product_id' => 5,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Quần jean nam Nike variants
            [
                'color' => 'Xanh đậm',
                'size' => '30',
                'price' => 899000,
                'sku' => 'QJ-NIKE-BLU-30',
                'product_id' => 6,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Xanh đậm',
                'size' => '32',
                'price' => 899000,
                'sku' => 'QJ-NIKE-BLU-32',
                'product_id' => 6,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Đen',
                'size' => '34',
                'price' => 899000,
                'sku' => 'QJ-NIKE-BLK-34',
                'product_id' => 6,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Váy nữ Zara variants
            [
                'color' => 'Đen',
                'size' => 'S',
                'price' => 1299000,
                'sku' => 'VAY-ZARA-BLK-S',
                'product_id' => 7,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Xanh navy',
                'size' => 'M',
                'price' => 1299000,
                'sku' => 'VAY-ZARA-NAV-M',
                'product_id' => 7,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Đỏ',
                'size' => 'L',
                'price' => 1299000,
                'sku' => 'VAY-ZARA-RED-L',
                'product_id' => 7,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Áo thun nữ H&M variants
            [
                'color' => 'Trắng',
                'size' => 'S',
                'price' => 199000,
                'sku' => 'AT-HM-WHT-S',
                'product_id' => 8,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Hồng',
                'size' => 'M',
                'price' => 199000,
                'sku' => 'AT-HM-PNK-M',
                'product_id' => 8,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Xanh lá',
                'size' => 'L',
                'price' => 199000,
                'sku' => 'AT-HM-GRN-L',
                'product_id' => 8,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Giày thể thao Adidas variants
            [
                'color' => 'Trắng',
                'size' => '40',
                'price' => 2499000,
                'sku' => 'GIAY-ADI-WHT-40',
                'product_id' => 9,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Đen',
                'size' => '42',
                'price' => 2499000,
                'sku' => 'GIAY-ADI-BLK-42',
                'product_id' => 9,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Xanh',
                'size' => '44',
                'price' => 2499000,
                'sku' => 'GIAY-ADI-BLU-44',
                'product_id' => 9,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Túi xách nữ Zara variants
            [
                'color' => 'Đen',
                'size' => 'One Size',
                'price' => 899000,
                'sku' => 'TUI-ZARA-BLK-OS',
                'product_id' => 10,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'color' => 'Nâu',
                'size' => 'One Size',
                'price' => 899000,
                'sku' => 'TUI-ZARA-BRN-OS',
                'product_id' => 10,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($variants as $variant) {
            Variant::create($variant);
        }
    }
}
