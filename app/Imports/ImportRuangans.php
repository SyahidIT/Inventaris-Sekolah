<?php

namespace App\Imports;

use App\Models\Ruangan;
use Maatwebsite\Excel\Concerns\ToModel;

class ImportRuangans implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Ruangan([
            'Unit' => $row[0],
            'Gedung'=> $row[1],
            'Ruangan'=> $row[2],
            'Lantai'=> $row[3],
        ]);
    }
}
