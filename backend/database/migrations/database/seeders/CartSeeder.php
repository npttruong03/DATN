<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Cart;

class CartSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $carts = [
            [
                'user_id' => 2,
                'session_id' => null,
                'variant_id' => 2, // iPhone 15 Pro Max Titanium Blue 256GB
                'quantity' => 1,
                'price' => 29990000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'user_id' => 2,
                'session_id' => null,
                'variant_id' => 9, // Áo sơ mi nam Uniqlo Trắng M
                'quantity' => 2,
                'price' => 299000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'user_id' => 3,
                'session_id' => null,
                'variant_id' => 4, // Samsung Galaxy S24 Ultra Titanium Black 256GB
                'quantity' => 1,
                'price' => 24990000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'user_id' => 3,
                'session_id' => null,
                'variant_id' => 15, // Váy nữ Zara Xanh navy M
                'quantity' => 1,
                'price' => 1299000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'user_id' => 4,
                'session_id' => null,
                'variant_id' => 7, // MacBook Pro M3 Pro Silver 14 inch
                'quantity' => 1,
                'price' => 45990000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'user_id' => 4,
                'session_id' => null,
                'variant_id' => 22, // Túi xách nữ Zara Đen One Size
                'quantity' => 1,
                'price' => 899000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            // Giỏ hàng cho session (khách hàng chưa đăng nhập)
            [
                'user_id' => null,
                'session_id' => 'session_123456789',
                'variant_id' => 10, // Áo sơ mi nam Uniqlo Xanh navy L
                'quantity' => 1,
                'price' => 299000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'user_id' => null,
                'session_id' => 'session_123456789',
                'variant_id' => 19, // Áo thun nữ H&M Hồng M
                'quantity' => 2,
                'price' => 199000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($carts as $cart) {
            Cart::create($cart);
        }
    }
}
