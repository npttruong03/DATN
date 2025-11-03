<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Support\Str;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Tạo đơn hàng 1
        $order1 = Order::create([
            'user_id' => 2,
            'address_id' => 1,
            'status' => 'completed',
            'payment_method' => 'credit_card',
            'payment_status' => 'paid',
            'total_price' => 29990000,
            'discount_price' => 2000000,
            'final_price' => 27990000,
            'coupon_id' => null,
            'note' => 'Giao hàng trong giờ hành chính',
            'tracking_code' => 'ORD' . Str::random(8),
            'return_status' => null,
            'cancel_reason' => null,
            'reject_reason' => null,
            'return_reason' => null,
            'created_at' => now()->subDays(5),
            'updated_at' => now()->subDays(3),
        ]);

        // Chi tiết đơn hàng 1
        OrderDetail::create([
            'order_id' => $order1->id,
            'variant_id' => 1, // iPhone 15 Pro Max Titanium Natural 256GB
            'quantity' => 1,
            'price' => 27990000,
            'original_price' => 29990000,
            'total_price' => 27990000,
            'created_at' => now()->subDays(5),
            'updated_at' => now()->subDays(5),
        ]);

        // Tạo đơn hàng 2
        $order2 = Order::create([
            'user_id' => 3,
            'address_id' => 2,
            'status' => 'shipping',
            'payment_method' => 'bank_transfer',
            'payment_status' => 'paid',
            'total_price' => 3598000,
            'discount_price' => 0,
            'final_price' => 3598000,
            'coupon_id' => null,
            'note' => 'Giao hàng tận nơi',
            'tracking_code' => 'ORD' . Str::random(8),
            'return_status' => null,
            'cancel_reason' => null,
            'reject_reason' => null,
            'return_reason' => null,
            'created_at' => now()->subDays(3),
            'updated_at' => now()->subDays(1),
        ]);

        // Chi tiết đơn hàng 2
        OrderDetail::create([
            'order_id' => $order2->id,
            'variant_id' => 9, // Áo sơ mi nam Uniqlo Trắng M
            'quantity' => 2,
            'price' => 299000,
            'original_price' => 299000,
            'total_price' => 598000,
            'created_at' => now()->subDays(3),
            'updated_at' => now()->subDays(3),
        ]);

        OrderDetail::create([
            'order_id' => $order2->id,
            'variant_id' => 12, // Quần jean nam Nike Xanh đậm 30
            'quantity' => 1,
            'price' => 799000,
            'original_price' => 899000,
            'total_price' => 799000,
            'created_at' => now()->subDays(3),
            'updated_at' => now()->subDays(3),
        ]);

        OrderDetail::create([
            'order_id' => $order2->id,
            'variant_id' => 18, // Áo thun nữ H&M Trắng S
            'quantity' => 3,
            'price' => 149000,
            'original_price' => 199000,
            'total_price' => 447000,
            'created_at' => now()->subDays(3),
            'updated_at' => now()->subDays(3),
        ]);

        OrderDetail::create([
            'order_id' => $order2->id,
            'variant_id' => 21, // Giày thể thao Adidas Trắng 40
            'quantity' => 1,
            'price' => 1999000,
            'original_price' => 2499000,
            'total_price' => 1999000,
            'created_at' => now()->subDays(3),
            'updated_at' => now()->subDays(3),
        ]);

        // Tạo đơn hàng 3
        $order3 = Order::create([
            'user_id' => 4,
            'address_id' => 3,
            'status' => 'pending',
            'payment_method' => 'cod',
            'payment_status' => 'unpaid',
            'total_price' => 1299000,
            'discount_price' => 300000,
            'final_price' => 999000,
            'coupon_id' => null,
            'note' => 'Kiểm tra hàng trước khi thanh toán',
            'tracking_code' => null,
            'return_status' => null,
            'cancel_reason' => null,
            'reject_reason' => null,
            'return_reason' => null,
            'created_at' => now()->subDays(1),
            'updated_at' => now()->subDays(1),
        ]);

        // Chi tiết đơn hàng 3
        OrderDetail::create([
            'order_id' => $order3->id,
            'variant_id' => 13, // Váy nữ Zara Đen S
            'quantity' => 1,
            'price' => 999000,
            'original_price' => 1299000,
            'total_price' => 999000,
            'created_at' => now()->subDays(1),
            'updated_at' => now()->subDays(1),
        ]);

        // Tạo đơn hàng 4
        $order4 = Order::create([
            'user_id' => 2,
            'address_id' => 4,
            'status' => 'cancelled',
            'payment_method' => 'credit_card',
            'payment_status' => 'refunded',
            'total_price' => 45990000,
            'discount_price' => 0,
            'final_price' => 45990000,
            'coupon_id' => null,
            'note' => null,
            'tracking_code' => null,
            'return_status' => null,
            'cancel_reason' => 'Khách hàng thay đổi ý định',
            'reject_reason' => null,
            'return_reason' => null,
            'created_at' => now()->subDays(7),
            'updated_at' => now()->subDays(6),
        ]);

        // Chi tiết đơn hàng 4
        OrderDetail::create([
            'order_id' => $order4->id,
            'variant_id' => 6, // MacBook Pro M3 Pro Space Gray 14 inch
            'quantity' => 1,
            'price' => 45990000,
            'original_price' => 45990000,
            'total_price' => 45990000,
            'created_at' => now()->subDays(7),
            'updated_at' => now()->subDays(7),
        ]);
    }
}
