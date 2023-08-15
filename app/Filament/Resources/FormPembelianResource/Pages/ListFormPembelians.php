<?php

namespace App\Filament\Resources\FormPembelianResource\Pages;

use App\Filament\Resources\FormPembelianResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListFormPembelians extends ListRecords
{
    protected static string $resource = FormPembelianResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
