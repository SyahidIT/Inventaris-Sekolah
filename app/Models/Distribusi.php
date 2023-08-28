<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Gudang;

class Distribusi extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function gudangs()
    {
        return $this->belongsTo(Gudang::class, 'KodeBarang');
    }

    protected static function boot()
    {
        parent::boot();
        self::saving(function ($distribusi) {
            $gudang = Gudang::firstOrNew(['KodeBarang' => $distribusi->KodeBarang]);
        
            // Update the stock based on the change in the "Jumlah"
            $stokChange = $distribusi->Jumlah - $distribusi->getOriginal('Jumlah');
            $gudang->Stok -= $stokChange;
        
            // Save the updated "Stok" value
            $gudang->save();
        });

        //tambah ke Stok Gudang
        self::deleted(function ($distribusi) {
            $gudang = Gudang::where('KodeBarang', $distribusi->KodeBarang)->first();
    
            if ($gudang) {
                $gudang->Stok += $distribusi->Jumlah;
                $gudang->save();
            }
        });
        
    }
        
}


Distribusi::chunk(200, function($distribusis) {
    foreach ($distribusis as $distribusi) {
        $gudangs = $distribusi->gudangs;
        // do some processing...
    }
});