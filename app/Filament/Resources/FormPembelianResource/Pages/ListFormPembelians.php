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

    public function getTabs(): array
    {
        return [
            null => ListRecords\Tab::make('Semua'),
            'Electronik' => ListRecords\Tab::make()->query(fn ($query) => $query->where('Kategori', 'Electronik')),
            'Furniture' => ListRecords\Tab::make()->query(fn ($query) => $query->where('Kategori', 'Furniture')),
            'Pecah Belah' => ListRecords\Tab::make()->query(fn ($query) => $query->where('Kategori', 'Pecah Belah')),
            'Olahraga' => ListRecords\Tab::make()->query(fn ($query) => $query->where('Kategori', 'Olahraga')),
            'Lainnya' => ListRecords\Tab::make()->query(fn ($query) => $query->where('Kategori', 'Lainnya')),
        ];
    }
}
