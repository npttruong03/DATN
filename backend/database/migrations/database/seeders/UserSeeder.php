<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = [
            [
                'username' => 'admin',
                'email' => 'admin@example.com',
                'phone' => '0123456789',
                'password' => Hash::make('password'),
                'role' => 'admin',
                'status' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'username' => 'user1',
                'email' => 'user1@example.com',
                'phone' => '0987654321',
                'password' => Hash::make('password'),
                'role' => 'user',
                'status' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'username' => 'user2',
                'email' => 'user2@example.com',
                'phone' => '0912345678',
                'password' => Hash::make('password'),
                'role' => 'user',
                'status' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'username' => 'user3',
                'email' => 'user3@example.com',
                'phone' => '0923456789',
                'password' => Hash::make('password'),
                'role' => 'user',
                'status' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'username' => 'user4',
                'email' => 'user4@example.com',
                'phone' => '0934567890',
                'password' => Hash::make('password'),
                'role' => 'user',
                'status' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($users as $user) {
            User::create($user);
        }
    }
}
