<?php

use App\Http\Controllers\AbsenController;
use App\Http\Controllers\GenerateQrCodeController;
use Illuminate\Support\Facades\Route;

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
//Route::post('/store',[AbsenController::class, 'store'])->name('store');
Route::get('/filament/pages/generate-qr-code', [GenerateQrCodeController::class, 'index']);
//Route::post('/filament/pages/generate-qr-code', [GenerateQrCodeController::class, 'store'])->name('store');
Route::get('/filament/pages/qrcode/{id}', [GenerateQrCodeController::class, 'generate'])->name('generate');
