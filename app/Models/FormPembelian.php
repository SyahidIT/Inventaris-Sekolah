<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class FormPembelian extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function gudangs()
    {
    return $this->hasMany(Gudang::class, 'KodeBarang');
    }


    
    protected static function boot()
{
    parent::boot();
    //kalkulasi barang Jumlah * Harga Per Unit = Valuasi
    self::saving(function ($model) {
        $model->Valuasi = $model->Jumlah * $model->HargaPerUnit;
    });

    //Update Jumlah ke Model Gudang
    self::created(function ($formPembelian) {
        $gudang = Gudang::where('KodeBarang', $formPembelian->KodeBarang)->first();
    
        if ($gudang) {
            $gudang->Jumlah += $formPembelian->Jumlah;
            $gudang->Stok += $formPembelian->Jumlah;
            $gudang->Valuasi += $formPembelian->Valuasi;
            $gudang->save();
        }
    });
    

}

}

FormPembelian::chunk(200, function ($formpembelians) {
    foreach ($formpembelians as $formpembelian) {
        $gudang = $formpembelian->gudang;
        // do some processing...
    }
});
