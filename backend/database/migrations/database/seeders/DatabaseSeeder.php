<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            UserSeeder::class,
            CategorySeeder::class,
            BrandSeeder::class,
            ProductSeeder::class,
            VariantSeeder::class,
            ImageSeeder::class,
            AddressSeeder::class,
            BlogCategorySeeder::class,
            BlogSeeder::class,
            OrderSeeder::class,
            CartSeeder::class,
        ]);
    }
}
