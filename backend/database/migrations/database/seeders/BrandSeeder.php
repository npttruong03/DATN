<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Brand;

class BrandSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $brands = [
            [
                'name' => 'Nike',
                'description' => 'Thương hiệu thể thao hàng đầu thế giới',
                'image' => 'brands/nike.jpg',
                'slug' => 'nike',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Adidas',
                'description' => 'Thương hiệu thể thao nổi tiếng',
                'image' => 'brands/adidas.jpg',
                'slug' => 'adidas',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Apple',
                'description' => 'Thương hiệu công nghệ cao cấp',
                'image' => 'brands/apple.jpg',
                'slug' => 'apple',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Samsung',
                'description' => 'Thương hiệu điện tử đa dạng',
                'image' => 'brands/samsung.jpg',
                'slug' => 'samsung',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Uniqlo',
                'description' => 'Thương hiệu thời trang Nhật Bản',
                'image' => 'brands/uniqlo.jpg',
                'slug' => 'uniqlo',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Zara',
                'description' => 'Thương hiệu thời trang nhanh',
                'image' => 'brands/zara.jpg',
                'slug' => 'zara',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'H&M',
                'description' => 'Thương hiệu thời trang giá rẻ',
                'image' => 'brands/hm.jpg',
                'slug' => 'hm',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Dell',
                'description' => 'Thương hiệu máy tính chuyên nghiệp',
                'image' => 'brands/dell.jpg',
                'slug' => 'dell',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($brands as $brand) {
            Brand::create($brand);
        }
    }
}
