<?php

namespace App\Http\Controllers;

use App\Models\Distribusi;
use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;


class GenerateQrCodeController extends Controller
{
    public function index()
{
    $data = Distribusi::all();
    return view('filament/pages/generate-qr-code', ['data' => $data]);
    
}
    
    public function store(Request $request){
        $data = new Distribusi;
        $data->KodeBarang = $request->KodeBarang;
        $data->save();
        return back();
    }
    public function generate ($id)
    {
        $data = Distribusi::findOrFail($id);
        $qrcode = QrCode::size(400)->generate($data->KodeBarang);
        return view('qrcode',compact('qrcode'));
    }
}
