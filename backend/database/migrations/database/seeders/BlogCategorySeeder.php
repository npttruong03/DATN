<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\BlogCategory;

class BlogCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $blogCategories = [
            [
                'name' => 'Thời trang',
                'slug' => 'thoi-trang',
                'description' => 'Tin tức và xu hướng thời trang mới nhất',
                'image' => 'blog-categories/fashion.jpg',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Công nghệ',
                'slug' => 'cong-nghe',
                'description' => 'Tin tức công nghệ và đánh giá sản phẩm',
                'image' => 'blog-categories/technology.jpg',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Lifestyle',
                'slug' => 'lifestyle',
                'description' => 'Phong cách sống và tips hữu ích',
                'image' => 'blog-categories/lifestyle.jpg',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Beauty',
                'slug' => 'beauty',
                'description' => 'Làm đẹp và chăm sóc da',
                'image' => 'blog-categories/beauty.jpg',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Review',
                'slug' => 'review',
                'description' => 'Đánh giá sản phẩm chi tiết',
                'image' => 'blog-categories/review.jpg',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($blogCategories as $category) {
            BlogCategory::create($category);
        }
    }
}
