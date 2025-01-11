<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
class UserSeeder extends Seeder
{
    public function run()
    {
        // Cria um usuário fictício
        User::create([
                'name' => 'Admin User',
                'email' => 'llmagaia2@gmail.com',
                'phone' => '827017601',
                'email_verified_at' => now(),
                'role'=> 'admin',
                'password' => Hash::make('password'), // Define a senha
            ]);

        // Cria mais usuários de exemplo
        User::create([
            'name' => 'Test User',
            'email' => 'clientuser@gmail.com',
            'phone' => '877017601',
            'email_verified_at' => now(),
            'role' => 'user',
            'password' => Hash::make('password'),
        ]);

        // Para criar mais usuários dinamicamente, use uma factory:
        // User::factory(10)->create(); // Para criar 10 usuários
    }
}
