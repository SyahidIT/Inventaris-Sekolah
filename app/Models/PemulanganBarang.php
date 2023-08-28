<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Distribusi;

class PemulanganBarang extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected static function boot()
    {
        parent::boot();

     // Assuming this is inside the PeminjamanBarang model
        self::updated(function ($peminjamanBarang) {
        $distribusi = Distribusi::firstOrNew(['KodeBarang' => $peminjamanBarang->KodeBarang]);
    
        // Update the stock based on the change in the "Jumlah"
        $stokChange = $peminjamanBarang->Jumlah + $peminjamanBarang->getOriginal('Jumlah');
        $distribusi->Stok += $stokChange;
    
        // Save the updated "Stok" value
        $distribusi->save();
    });
}
}