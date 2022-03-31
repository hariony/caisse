<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class TypeOperationSeeder extends Seeder
{
    static $datas = [
        'Dépôt de caisse',
        'Remise en banque',
        'Retrait'
    ];

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        foreach (self::$datas as $data) {
            DB::table('type_operations')->insert([
                'titre' => $data,
            ]);
        }
    }
}
