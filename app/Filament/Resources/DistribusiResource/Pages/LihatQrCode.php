<?php

namespace App\Filament\Resources\DistribusiResource\Pages;

use App\Filament\Resources\DistribusiResource;
use App\Models\Distribusi;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class LihatQrCode extends ListRecords
{
    protected static string $resource = DistribusiResource::class;

    protected static string $view = 'filament.resources.distribusi-resources.pages.lihat-qr-code';

    public Distribusi $record;

}
