<?php

namespace App\Filament\Resources\GudangResource\Pages;

use App\Filament\Resources\GudangResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListGudangs extends ListRecords
{
    protected static string $resource = GudangResource::class;

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
