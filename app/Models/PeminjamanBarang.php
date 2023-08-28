<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Distribusi;
use Carbon\Carbon;


class PeminjamanBarang extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
   
    protected static function boot()
{
    parent::boot();

     //ubah value StatusPeminjaman berdasarkan Status
    self::saving(function ($peminjamanBarang) {
        if ($peminjamanBarang->Status == 1) {
            $peminjamanBarang->StatusPeminjaman = 'Sedang Dipinjam';
        } else {
            $peminjamanBarang->StatusPeminjaman = 'Sudah Dipulangkan';
        }
    });

    // Assuming this is inside the PeminjamanBarang model
    self::updated(function ($peminjamanBarang) {
    $distribusi = Distribusi::firstOrNew(['KodeBarang' => $peminjamanBarang->KodeBarang]);

    // Update the stock based on the change in the "Jumlah"
    $stokChange = $peminjamanBarang->Jumlah - $peminjamanBarang->getOriginal('Jumlah');
    $distribusi->Stok -= $stokChange;

    // Save the updated "Stok" value
    $distribusi->save();

    self::deleted(function ($distribusi) {
    $peminjamanBarang = PeminjamanBarang::where('KodeBarang', $distribusi->KodeBarang)->first();

    if ($peminjamanBarang) {
        $peminjamanBarang->Jumlah -= $distribusi->Jumlah;
        $peminjamanBarang->save();
    }
});

});


}

}
