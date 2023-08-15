<?php

namespace App\Filament\Resources\PeminjamanBarangResource\Pages;

use App\Filament\Resources\PeminjamanBarangResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPeminjamanBarangs extends ListRecords
{
    protected static string $resource = PeminjamanBarangResource::class;

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
            'Sedang Dipinjam' => ListRecords\Tab::make()->query(fn ($query) => $query->where('StatusPeminjaman', 'Sedang Dipinjam')),
            'Sudah Dipulangkan' => ListRecords\Tab::make()->query(fn ($query) => $query->where('StatusPeminjaman', 'Sudah Dipulangkan')),
        ];
    }
}
