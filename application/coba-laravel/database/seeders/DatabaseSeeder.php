<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        User::factory(5)->create();

        Category::create([
            'name' => 'Novel',
            'slug' => 'novel',
        ]);

        Category::create([
            'name' => 'Poem',
            'slug' => 'poem',
        ]);

        Category::create([
            'name' => 'Poem',
            'slug' => 'poem',
        ]);

        Post::factory(25)->create();
    }
}
