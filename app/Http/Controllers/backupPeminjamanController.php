<?php

namespace App\Http\Controllers;

// use App\Models\Distribusi;
// use App\Models\PeminjamanBarang;
// use Illuminate\Http\Request;
// use Illuminate\Support\Facades\Auth;

class PeminjamanController extends Controller
{
    // public function store(Request $request)
    // {
    //     $cek = Distribusi::where('Stok', '<', 1)->first();

    //     if ($cek) {
    //         return redirect('/dashboard')->with('gagal', 'Stok Barang Habis');
    //     }

    //     $loggedInUser = Auth::user();
    //     $kodeBarang = $request->KodeBarang;
    //     $namaPeminjam = $loggedInUser->name;

    //     // Cek apakah ada data peminjaman dengan KodeBarang dan NamaPeminjam yang sama pada hari ini
    //     $existingPeminjaman = PeminjamanBarang::where('KodeBarang', $kodeBarang)
    //         ->where('NamaPeminjam', $namaPeminjam)
    //         ->whereDate('created_at', today()) // Filter data berdasarkan tanggal hari ini
    //         ->first();

    //     if ($existingPeminjaman) {
    //         // Jika data sudah ada, tambahkan jumlah barang pada data yang sudah ada
    //         $existingPeminjaman->increment('Jumlah', 1); // Tambahkan 1 ke Jumlah

    //         return redirect('/dashboard')->with('success', 'Peminjaman berhasil!');
    //     }

    //     $distribusi = Distribusi::where('KodeBarang', $kodeBarang)->first();

    //     if ($distribusi) {
    //         $namaBarang = $distribusi->NamaBarang;
    //         $merek = $distribusi->Merek;
    //         $kategori = $distribusi->Kategori;
    //         $kondisiBarang = $distribusi->KondisiBarang;
    //         $sumberDana = $distribusi->SumberDana;
    //         $unit = $distribusi->Unit;
    //     } else {
    //         $namaBarang = $request->NamaBarang;
    //         $merek = $request->Merek;
    //         $kategori = $request->Kategori;
    //         $kondisiBarang = $request->KondisiBarang;
    //         $sumberDana = $request->SumberDana;
    //         $unit = $request->Unit;
    //     }

    //     PeminjamanBarang::create([
    //         'NamaPeminjam' => $loggedInUser->name,
    //         'KodeBarang' => $kodeBarang,
    //         'NamaBarang' => $namaBarang,
    //         'Merek' => $merek,
    //         'Kategori' => $kategori,
    //         'KondisiBarang' => $kondisiBarang,
    //         'SumberDana' => $sumberDana,
    //         'Unit' => $unit,
    //         'Jumlah' => 1, // Nilai default Jumlah diatur menjadi 1
    //     ]);

    //     $peminjaman = PeminjamanBarang::where('Stok', '>', 0)->first(); // Mengambil data peminjaman dengan stok lebih dari 0

    //     return redirect('/dashboard')->with('success', 'Peminjaman berhasil!')->with('Stok', $peminjaman);
    //         }
}
