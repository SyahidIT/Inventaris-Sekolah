<?php

use App\Http\Controllers\HistoryController;
use App\Http\Controllers\PeminjamanController;
use App\Http\Controllers\PemulanganController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Response;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::post('/peminjaman/store', [PeminjamanController::class, 'store'])->name('peminjaman.store');
Route::post('/pemulangan/store', [PemulanganController::class, 'store'])->name('pemulangan.store');
Route::get('/pemulangan', function () {
    return view('pemulangan.index');
})->name('pemulangan.index');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/history', [HistoryController::class, 'index'])->name('history.index');
});

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/pemulangan', [PemulanganController::class, 'index'])->name('pemulangan.index');
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::get('/download-template', function () {
    $filePath = public_path('/template/TemplateFormPembelian.csv');
    $headers = [
        'Content-Type' => 'text/csv',
    ];

    return response()->file($filePath, $headers);
});

Route::get('/download-template-ruangan', function () {
    $filePath = public_path('/template/TemplateRuangan.csv');
    $headers = [
        'Content-Type' => 'text/csv',
    ];

    return response()->file($filePath, $headers);
});
require __DIR__.'/auth.php';
