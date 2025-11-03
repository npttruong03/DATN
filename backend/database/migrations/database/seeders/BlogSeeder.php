<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Blog;
use Illuminate\Support\Str;

class BlogSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $blogs = [
            [
                'title' => 'Xu hướng thời trang 2024: Những mẫu áo sơ mi nam hot nhất',
                'slug' => 'xu-huong-thoi-trang-2024-ao-so-mi-nam',
                'content' => '<p>Năm 2024 mang đến những xu hướng thời trang nam mới mẻ và hiện đại. Áo sơ mi nam đang trở thành item không thể thiếu trong tủ đồ của mọi quý ông.</p><p>Những mẫu áo sơ mi với thiết kế tối giản, chất liệu cao cấp và màu sắc đa dạng đang được ưa chuộng. Từ phong cách công sở đến casual, áo sơ mi luôn tạo nên vẻ ngoài lịch lãm và tự tin.</p>',
                'excerpt' => 'Khám phá những xu hướng thời trang nam mới nhất năm 2024 với các mẫu áo sơ mi đang được ưa chuộng.',
                'image' => 'blogs/ao-so-mi-nam-2024.jpg',
                'status' => 'published',
                'blog_category_id' => 1, // Thời trang
                'created_at' => now()->subDays(10),
                'updated_at' => now()->subDays(10),
            ],
            [
                'title' => 'iPhone 15 Pro Max: Đánh giá chi tiết sau 1 tháng sử dụng',
                'slug' => 'iphone-15-pro-max-danh-gia-chi-tiet',
                'content' => '<p>iPhone 15 Pro Max đã ra mắt với nhiều cải tiến đáng kể so với thế hệ trước. Với chip A17 Pro mạnh mẽ, camera 48MP và thiết kế titan cao cấp, đây là một trong những smartphone tốt nhất hiện tại.</p><p>Trong bài đánh giá này, chúng tôi sẽ phân tích chi tiết về hiệu năng, camera, pin và trải nghiệm sử dụng thực tế của iPhone 15 Pro Max.</p>',
                'excerpt' => 'Đánh giá toàn diện iPhone 15 Pro Max sau 1 tháng sử dụng thực tế.',
                'image' => 'blogs/iphone-15-pro-max-review.jpg',
                'status' => 'published',
                'blog_category_id' => 2, // Công nghệ
                'created_at' => now()->subDays(7),
                'updated_at' => now()->subDays(7),
            ],
            [
                'title' => '10 tips phối đồ cho nữ công sở chuyên nghiệp',
                'slug' => '10-tips-phoi-do-nu-cong-so-chuyen-nghiep',
                'content' => '<p>Phối đồ công sở là một nghệ thuật cần sự tinh tế và hiểu biết về thời trang. Với 10 tips dưới đây, bạn sẽ luôn tự tin và chuyên nghiệp trong mọi tình huống công việc.</p><p>Từ việc chọn màu sắc phù hợp đến cách phối phụ kiện, mỗi chi tiết nhỏ đều góp phần tạo nên vẻ ngoài hoàn hảo.</p>',
                'excerpt' => 'Bí quyết phối đồ công sở chuyên nghiệp cho phụ nữ hiện đại.',
                'image' => 'blogs/phoi-do-cong-so-nu.jpg',
                'status' => 'published',
                'blog_category_id' => 1, // Thời trang
                'created_at' => now()->subDays(5),
                'updated_at' => now()->subDays(5),
            ],
            [
                'title' => 'MacBook Pro M3: Lựa chọn hoàn hảo cho dân IT',
                'slug' => 'macbook-pro-m3-lua-chon-hoan-hao-dan-it',
                'content' => '<p>MacBook Pro M3 với chip Apple Silicon mới nhất mang đến hiệu năng vượt trội cho các lập trình viên và chuyên gia IT. Với khả năng xử lý đa nhiệm mạnh mẽ và thời lượng pin dài, đây là lựa chọn lý tưởng cho công việc.</p><p>Trong bài viết này, chúng tôi sẽ phân tích chi tiết về hiệu năng, khả năng lập trình và so sánh với các dòng laptop khác.</p>',
                'excerpt' => 'Tại sao MacBook Pro M3 là lựa chọn tốt nhất cho lập trình viên và dân IT.',
                'image' => 'blogs/macbook-pro-m3-it.jpg',
                'status' => 'published',
                'blog_category_id' => 2, // Công nghệ
                'created_at' => now()->subDays(3),
                'updated_at' => now()->subDays(3),
            ],
            [
                'title' => 'Làm đẹp da mặt: Quy trình chăm sóc da cơ bản',
                'slug' => 'lam-dep-da-mat-quy-trinh-cham-soc-da-co-ban',
                'content' => '<p>Chăm sóc da mặt đúng cách là bước đầu tiên để có làn da khỏe mạnh và rạng rỡ. Với quy trình chăm sóc da cơ bản, bạn sẽ dễ dàng duy trì làn da đẹp mỗi ngày.</p><p>Từ việc làm sạch da đến dưỡng ẩm và bảo vệ khỏi tia UV, mỗi bước đều quan trọng và cần được thực hiện đúng cách.</p>',
                'excerpt' => 'Hướng dẫn quy trình chăm sóc da mặt cơ bản cho người mới bắt đầu.',
                'image' => 'blogs/cham-soc-da-mat.jpg',
                'status' => 'published',
                'blog_category_id' => 4, // Beauty
                'created_at' => now()->subDays(1),
                'updated_at' => now()->subDays(1),
            ],
        ];

        foreach ($blogs as $blog) {
            Blog::create($blog);
        }
    }
}
