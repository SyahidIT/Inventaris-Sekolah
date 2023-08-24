<?php

namespace App\Http\Controllers;

use App\Models\Distribusi;
use App\Models\PeminjamanBarang;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PemulanganController extends Controller
{
    public function index()
{
    $user = Auth::user(); // Mengambil user yang sedang login
    return view('pemulangan.index', compact('user'));
}

    public function store(Request $request)
    {
        $userID = Auth::user()->id; 

        //input kode barang.
        $KodeBarangInput = $request->KodeBarang; 
        
        //cek kode barang dengan user_id
        $cek = PeminjamanBarang::where('KodeBarang', $KodeBarangInput)
                               ->where('user_id', $userID) 
                               ->first();
        
        if (!$cek) {
            return redirect('/pemulangan')->with('gagal', 'Barang belum dipinjam atau tidak ditemukan');
        }

    // Persiapan data untuk penyimpanan pemulangan
        $KodeBarangInput = $request->KodeBarang;
        $userID = Auth::user()->id;

        // Mengurangi nilai pada baris pertama yang memenuhi kondisi
        $updatedRow = PeminjamanBarang::where('KodeBarang', $KodeBarangInput)
            ->where('user_id', $userID)
            ->where('Jumlah', '>', 0) // Hanya mengurangi jika Jumlah > 0
            ->orderBy('id', 'asc') // Urutkan berdasarkan ID secara menaik
            ->first();

        if ($updatedRow) {
            $updatedRow->decrement('Jumlah', 1);
            if ($updatedRow->Jumlah === 0) {
                // Mengurangi nilai pada baris lain jika Jumlah sudah 0
                PeminjamanBarang::where('KodeBarang', $KodeBarangInput)
                    ->where('user_id', $userID)
                    ->where('id', '<>', $updatedRow->id) // Menghindari baris yang sudah di-update sebelumnya
                    ->decrement('Jumlah', 1);
            }
        }

    // Cek apakah Jumlah sama dengan 0
    $jumlah = 0; // Ganti dengan nilai yang sesuai

    $barang = PeminjamanBarang::where('KodeBarang', $KodeBarangInput)
                            ->where('user_id', $userID)
                            ->where('Jumlah', $jumlah)
                            ->first();

    if ($barang) {
        $barang->update([
            'Status' => '0', // Ganti dengan nilai status yang sesuai
        ]);
    }

    // Redirect dengan pesan sukses dan informasi barang
    return redirect('/pemulangan')
        ->with('success', 'Pemulangan berhasil!')
        ->with('newItem', [
            'NamaBarang' => $cek->NamaBarang,
            'Jumlah' => 1,
        ]);

 }
}
