<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Absen;
use App\Models\Siswa;

class AbsenController extends Controller
{
    public function store(Request $request)
    {
        //cek data
        $cek = Absen::where([
            'id_siswa' => $request->id_siswa,
            'tanggal' => date('Y-m-d')
        ])->first();

        if ($cek) {
            return redirect('/')->with('gagal','Siswa sudah absen');
        }

        Absen::create([
            'id_siswa' => $request->id_siswa,
            'tanggal' => date('Y-m-d')
        ]);

       $siswa = Siswa::where('nisn', $request->id_siswa)->first(); // Mengambil data siswa yang berhasil absen

       return redirect('/')->with('success', 'Absen berhasil')->with('siswa', $siswa);
    }
}
