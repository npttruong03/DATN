<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class CreateAdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Check if user already exists
        $existingUser = User::where('email', 'truongnp.21it@vku.udn.vn')->first();
        
        if (!$existingUser) {
            User::create([
                'username' => 'admin',
                'email' => 'truongnp.21it@vku.udn.vn',
                'password' => Hash::make('Truong.03'), // Default password
                'role' => 'admin',
                'status' => true, // Boolean value
                'phone' => '0123456789',
                'gender' => 'male',
            ]);
            
            $this->command->info('✅ Created admin user: admin@devgang.com / admin123');
        } else {
            $this->command->info('ℹ️  Admin user already exists');
        }
    }
}
