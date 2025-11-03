<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Image;

class ImageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $images = [
            // Hình ảnh cho sản phẩm iPhone 15 Pro Max (product_id = 1)
            [
                'url' => 'products/iphone-15-pro-max-1.jpg',
                'alt' => 'iPhone 15 Pro Max Titanium Natural',
                'product_id' => 1,
                'variant_id' => 1,
                'is_primary' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'url' => 'products/iphone-15-pro-max-2.jpg',
                'alt' => 'iPhone 15 Pro Max Titanium Blue',
                'product_id' => 1,
                'variant_id' => 2,
                'is_primary' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'url' => 'products/iphone-15-pro-max-3.jpg',
                'alt' => 'iPhone 15 Pro Max Titanium White',
                'product_id' => 1,
                'variant_id' => 3,
                'is_primary' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Hình ảnh cho sản phẩm Samsung Galaxy S24 Ultra (product_id = 2)
            [
                'url' => 'products/samsung-s24-ultra-1.jpg',
                'alt' => 'Samsung Galaxy S24 Ultra Titanium Black',
                'product_id' => 2,
                'variant_id' => 4,
                'is_primary' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'url' => 'products/samsung-s24-ultra-2.jpg',
                'alt' => 'Samsung Galaxy S24 Ultra Titanium Gray',
                'product_id' => 2,
                'variant_id' => 5,
                'is_primary' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Hình ảnh cho sản phẩm MacBook Pro M3 Pro (product_id = 3)
            [
                'url' => 'products/macbook-pro-m3-1.jpg',
                'alt' => 'MacBook Pro M3 Pro Space Gray',
                'product_id' => 3,
                'variant_id' => 6,
                'is_primary' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'url' => 'products/macbook-pro-m3-2.jpg',
                'alt' => 'MacBook Pro M3 Pro Silver',
                'product_id' => 3,
                'variant_id' => 7,
                'is_primary' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Hình ảnh cho sản phẩm Áo sơ mi nam Uniqlo (product_id = 5)
            [
                'url' => 'products/ao-so-mi-nam-uniqlo-1.jpg',
                'alt' => 'Áo sơ mi nam Uniqlo Trắng',
                'product_id' => 5,
                'variant_id' => 9,
                'is_primary' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'url' => 'products/ao-so-mi-nam-uniqlo-2.jpg',
                'alt' => 'Áo sơ mi nam Uniqlo Xanh navy',
                'product_id' => 5,
                'variant_id' => 10,
                'is_primary' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Hình ảnh cho sản phẩm Quần jean nam Nike (product_id = 6)
            [
                'url' => 'products/quan-jean-nam-nike-1.jpg',
                'alt' => 'Quần jean nam Nike Xanh đậm',
                'product_id' => 6,
                'variant_id' => 12,
                'is_primary' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'url' => 'products/quan-jean-nam-nike-2.jpg',
                'alt' => 'Quần jean nam Nike Đen',
                'product_id' => 6,
                'variant_id' => 14,
                'is_primary' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Hình ảnh cho sản phẩm Váy nữ Zara (product_id = 7)
            [
                'url' => 'products/vay-nu-zara-1.jpg',
                'alt' => 'Váy nữ Zara Đen',
                'product_id' => 7,
                'variant_id' => 13,
                'is_primary' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'url' => 'products/vay-nu-zara-2.jpg',
                'alt' => 'Váy nữ Zara Xanh navy',
                'product_id' => 7,
                'variant_id' => 15,
                'is_primary' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Hình ảnh cho sản phẩm Áo thun nữ H&M (product_id = 8)
            [
                'url' => 'products/ao-thun-nu-hm-1.jpg',
                'alt' => 'Áo thun nữ H&M Trắng',
                'product_id' => 8,
                'variant_id' => 18,
                'is_primary' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'url' => 'products/ao-thun-nu-hm-2.jpg',
                'alt' => 'Áo thun nữ H&M Hồng',
                'product_id' => 8,
                'variant_id' => 19,
                'is_primary' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Hình ảnh cho sản phẩm Giày thể thao Adidas (product_id = 9)
            [
                'url' => 'products/giay-the-thao-adidas-1.jpg',
                'alt' => 'Giày thể thao Adidas Trắng',
                'product_id' => 9,
                'variant_id' => 21,
                'is_primary' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'url' => 'products/giay-the-thao-adidas-2.jpg',
                'alt' => 'Giày thể thao Adidas Đen',
                'product_id' => 9,
                'variant_id' => 22,
                'is_primary' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],

            // Hình ảnh cho sản phẩm Túi xách nữ Zara (product_id = 10)
            [
                'url' => 'products/tui-xach-nu-zara-1.jpg',
                'alt' => 'Túi xách nữ Zara Đen',
                'product_id' => 10,
                'variant_id' => 23,
                'is_primary' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'url' => 'products/tui-xach-nu-zara-2.jpg',
                'alt' => 'Túi xách nữ Zara Nâu',
                'product_id' => 10,
                'variant_id' => 24,
                'is_primary' => false,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($images as $image) {
            Image::create($image);
        }
    }
}
