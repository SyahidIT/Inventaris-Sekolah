<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormPembelian extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function gudangs()
    {
    return $this->hasMany(Gudang::class, 'KodeBarang');
    }

}



FormPembelian::chunk(200, function ($formpembelians) {
    foreach ($formpembelians as $formpembelian) {
        $gudang = $formpembelian->gudang;
        // do some processing...
    }
});
