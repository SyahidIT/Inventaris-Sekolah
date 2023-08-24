<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Models\PeminjamanBarang;
use Illuminate\Http\Request;
use Carbon\Carbon;


class HistoryController extends Controller
{
    public function index()
    {
        $user = Auth::user(); // Mengambil user yang sedang login
        $peminjamanBarangs = PeminjamanBarang::where('user_id', $user->id)->get();

        return view('history.index', compact('peminjamanBarangs'));
    }
    
}
