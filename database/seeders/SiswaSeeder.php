<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Siswa;

class SiswaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $siswa = [
            [
                'nisn' => '111',
                'nama' => 'hisyam'
            ],
            [
                'nisn' => '222',
                'nama' => 'zubair'
            ]
            ];

            Siswa::insert($siswa);
    }
}
