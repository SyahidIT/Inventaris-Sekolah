<?php

namespace App\Http\Controllers;

use App\Models\Distribusi;
use App\Models\PeminjamanBarang;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PeminjamanController extends Controller
{
    public function store(Request $request)
    {
        // Cek stok barang
    $cek = Distribusi::where('Stok', '<', 1)->first();
    if ($cek) {
        return redirect('/dashboard')->with('gagal', 'Stok Barang Habis');
    }

    // Ambil informasi user yang login
    $loggedInUser = Auth::user();

    // Ambil data dari input
    $kodeBarang = $request->KodeBarang;
    $namaPeminjam = $loggedInUser->name;

    // Cek apakah ada data peminjaman dengan KodeBarang dan NamaPeminjam yang sama pada hari ini
    $existingPeminjaman = PeminjamanBarang::where('KodeBarang', $kodeBarang)
        ->where('NamaPeminjam', $namaPeminjam)
        ->whereDate('created_at', today()) // Filter data berdasarkan tanggal hari ini
        ->first();

    if ($existingPeminjaman) {
        // Jika data sudah ada, tambahkan jumlah barang pada data yang sudah ada
        $existingPeminjaman->increment('Jumlah', 1); // Tambahkan 1 ke Jumlah

        return redirect('/dashboard')->with('success', 'Peminjaman berhasil!');
    }

    // Ambil data barang dari Distribusi berdasarkan KodeBarang
    $distribusi = Distribusi::where('KodeBarang', $kodeBarang)->first();

    // Jika data barang tidak ditemukan, redirect dengan pesan error
    if (!$distribusi) {
        return redirect('/dashboard')->with('gagal', 'Barang tidak ditemukan');
    }

    // Persiapan data untuk penyimpanan peminjaman
    PeminjamanBarang::create([
        'user_id' => $loggedInUser->id,
        'NamaPeminjam' => $loggedInUser->name,
        'KodeBarang' => $kodeBarang,
        'NamaBarang' => $distribusi->NamaBarang,
        'Merek' => $distribusi->Merek,
        'Kategori' => $distribusi->Kategori,
        'KondisiBarang' => $distribusi->KondisiBarang,
        'SumberDana' => $distribusi->SumberDana,
        'Unit' => $distribusi->Unit,
        'Jumlah' => 1,
    ]);

    // Redirect dengan pesan sukses dan informasi barang
    return redirect('/dashboard')
        ->with('success', 'Peminjaman berhasil!')
        ->with('newItem', [
            'NamaBarang' => $distribusi->NamaBarang,
            'Jumlah' => 1,
        ]);
            }
}
