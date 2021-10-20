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

        User::create([
            'name' => 'Muhammad Arunika',
            'username' => 'marunika',
            'email' => 'arrhenius12@gmail.com',
            'password' => bcrypt('123456'),
        ]);

        User::factory(9)->create();
        Category::create([
            'name' => 'Novel',
            'slug' => 'novel',
        ]);

        Category::create([
            'name' => 'Poem',
            'slug' => 'poem',
        ]);

        Category::create([
            'name' => 'Review',
            'slug' => 'review',
        ]);

        Category::create([
            'name' => 'Essay',
            'slug' => 'essay',
        ]);

        Category::create([
            'name' => 'Theater Script',
            'slug' => 'theater-script',
        ]);

        Post::factory(40)->create();
    }
}
