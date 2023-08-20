<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gudang extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function formpembelian()
    {
        return $this->belongsTo(FormPembelian::class, 'KodeBarang');
    }
    

    public function distribusi()
    {
        return $this->hasMany(Distribusi::class, 'KodeBarang');
    }
}

Gudang::chunk(200, function ($gudangs) {
    foreach ($gudangs as $gudang) {
        $formpembelians = $gudang->formpembelians;
        // do some processing...
    }
});
