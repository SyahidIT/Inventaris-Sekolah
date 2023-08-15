<?php

namespace App\Filament\Resources\FormPembelianResource\Pages;

use App\Filament\Resources\FormPembelianResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditFormPembelian extends EditRecord
{
    protected static string $resource = FormPembelianResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
