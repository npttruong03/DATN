<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use Illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $products = [
            [
                'name' => 'iPhone 15 Pro Max',
                'price' => 29990000,
                'description' => 'iPhone 15 Pro Max với chip A17 Pro mạnh mẽ, camera 48MP và màn hình Super Retina XDR 6.7 inch. Thiết kế titan cao cấp, chống nước IP68.',
                'discount_price' => 27990000,
                'slug' => 'iphone-15-pro-max',
                'is_active' => true,
                'categories_id' => 3, // Điện thoại & Phụ kiện
                'brand_id' => 3, // Apple
                'sold_count' => 150,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Samsung Galaxy S24 Ultra',
                'price' => 24990000,
                'description' => 'Samsung Galaxy S24 Ultra với camera 200MP, S Pen tích hợp, màn hình Dynamic AMOLED 2X 6.8 inch và chip Snapdragon 8 Gen 3.',
                'discount_price' => 22990000,
                'slug' => 'samsung-galaxy-s24-ultra',
                'is_active' => true,
                'categories_id' => 3, // Điện thoại & Phụ kiện
                'brand_id' => 4, // Samsung
                'sold_count' => 89,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'MacBook Pro M3 Pro',
                'price' => 45990000,
                'description' => 'MacBook Pro 14 inch với chip M3 Pro, màn hình Liquid Retina XDR, 16GB RAM và 512GB SSD. Hiệu năng mạnh mẽ cho công việc chuyên nghiệp.',
                'discount_price' => null,
                'slug' => 'macbook-pro-m3-pro',
                'is_active' => true,
                'categories_id' => 4, // Laptop & Máy tính
                'brand_id' => 3, // Apple
                'sold_count' => 45,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Dell XPS 13',
                'price' => 25990000,
                'description' => 'Dell XPS 13 với thiết kế siêu mỏng, màn hình 13.4 inch 4K, chip Intel Core i7 thế hệ 13 và 16GB RAM. Laptop cao cấp cho doanh nhân.',
                'discount_price' => 23990000,
                'slug' => 'dell-xps-13',
                'is_active' => true,
                'categories_id' => 4, // Laptop & Máy tính
                'brand_id' => 8, // Dell
                'sold_count' => 67,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Áo sơ mi nam Uniqlo',
                'price' => 299000,
                'description' => 'Áo sơ mi nam chất liệu cotton 100%, thiết kế đơn giản, phù hợp cho công sở và cuộc sống hàng ngày.',
                'discount_price' => 249000,
                'slug' => 'ao-so-mi-nam-uniqlo',
                'is_active' => true,
                'categories_id' => 5, // Áo sơ mi nam
                'brand_id' => 5, // Uniqlo
                'sold_count' => 234,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Quần jean nam Nike',
                'price' => 899000,
                'description' => 'Quần jean nam Nike với chất liệu denim cao cấp, thiết kế thể thao năng động, phù hợp cho mọi hoạt động.',
                'discount_price' => 799000,
                'slug' => 'quan-jean-nam-nike',
                'is_active' => true,
                'categories_id' => 6, // Quần jean nam
                'brand_id' => 1, // Nike
                'sold_count' => 156,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Váy nữ Zara',
                'price' => 1299000,
                'description' => 'Váy nữ Zara thiết kế thanh lịch, chất liệu vải cao cấp, phù hợp cho các dịp đặc biệt và công việc.',
                'discount_price' => 999000,
                'slug' => 'vay-nu-zara',
                'is_active' => true,
                'categories_id' => 7, // Váy nữ
                'brand_id' => 6, // Zara
                'sold_count' => 189,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Áo thun nữ H&M',
                'price' => 199000,
                'description' => 'Áo thun nữ H&M chất liệu cotton mềm mại, thiết kế đơn giản, nhiều màu sắc lựa chọn.',
                'discount_price' => 149000,
                'slug' => 'ao-thun-nu-hm',
                'is_active' => true,
                'categories_id' => 8, // Áo thun nữ
                'brand_id' => 7, // H&M
                'sold_count' => 312,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Giày thể thao Adidas',
                'price' => 2499000,
                'description' => 'Giày thể thao Adidas với công nghệ Boost, thiết kế hiện đại, phù hợp cho chạy bộ và tập luyện.',
                'discount_price' => 1999000,
                'slug' => 'giay-the-thao-adidas',
                'is_active' => true,
                'categories_id' => 1, // Thời trang nam
                'brand_id' => 2, // Adidas
                'sold_count' => 278,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Túi xách nữ Zara',
                'price' => 899000,
                'description' => 'Túi xách nữ Zara thiết kế sang trọng, chất liệu da cao cấp, phù hợp cho công việc và dạo phố.',
                'discount_price' => 699000,
                'slug' => 'tui-xach-nu-zara',
                'is_active' => true,
                'categories_id' => 2, // Thời trang nữ
                'brand_id' => 6, // Zara
                'sold_count' => 145,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($products as $product) {
            Product::create($product);
        }
    }
}
