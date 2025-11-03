<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;
use Illuminate\Support\Str;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            [
                'name' => 'Thời trang nam',
                'description' => 'Quần áo, phụ kiện thời trang dành cho nam giới',
                'image' => 'categories/men-fashion.jpg',
                'slug' => 'thoi-trang-nam',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Thời trang nữ',
                'description' => 'Quần áo, phụ kiện thời trang dành cho nữ giới',
                'image' => 'categories/women-fashion.jpg',
                'slug' => 'thoi-trang-nu',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Điện thoại & Phụ kiện',
                'description' => 'Điện thoại di động và các phụ kiện liên quan',
                'image' => 'categories/phones-accessories.jpg',
                'slug' => 'dien-thoai-phu-kien',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Laptop & Máy tính',
                'description' => 'Laptop, máy tính để bàn và phụ kiện',
                'image' => 'categories/laptops-computers.jpg',
                'slug' => 'laptop-may-tinh',
                'is_active' => true,
                'parent_id' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Áo sơ mi nam',
                'description' => 'Áo sơ mi dành cho nam giới',
                'image' => 'categories/men-shirts.jpg',
                'slug' => 'ao-so-mi-nam',
                'is_active' => true,
                'parent_id' => 1, // Thời trang nam
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Quần jean nam',
                'description' => 'Quần jean dành cho nam giới',
                'image' => 'categories/men-jeans.jpg',
                'slug' => 'quan-jean-nam',
                'is_active' => true,
                'parent_id' => 1, // Thời trang nam
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Váy nữ',
                'description' => 'Váy dành cho nữ giới',
                'image' => 'categories/women-dresses.jpg',
                'slug' => 'vay-nu',
                'is_active' => true,
                'parent_id' => 2, // Thời trang nữ
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Áo thun nữ',
                'description' => 'Áo thun dành cho nữ giới',
                'image' => 'categories/women-t-shirts.jpg',
                'slug' => 'ao-thun-nu',
                'is_active' => true,
                'parent_id' => 2, // Thời trang nữ
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($categories as $category) {
            Category::create($category);
        }
    }
}
