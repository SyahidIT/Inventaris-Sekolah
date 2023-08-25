<?php

namespace App\Imports;

use App\Models\FormPembelian;
use Maatwebsite\Excel\Concerns\ToModel;

class ImportFormPembelians implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new FormPembelian([
            'KodeBarang' => $row[0],
            'NamaBarang'=> $row[1],
            'Merek'=> $row[2],
            'Kategori'=> $row[3],
            'Jumlah'=> $row[4],
            'HargaPerUnit'=> $row[5],
        ]);
    }
}
