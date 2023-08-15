<?php

namespace App\Filament\Resources\RuanganResource\Pages;

use App\Filament\Resources\RuanganResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListRuangans extends ListRecords
{
    protected static string $resource = RuanganResource::class;

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
            'SD' => ListRecords\Tab::make()->query(fn ($query) => $query->where('Unit', 'SD')),
            'SMP Fullday' => ListRecords\Tab::make()->query(fn ($query) => $query->where('Unit', 'SMP Fullday')),
            'SMP Boarding' => ListRecords\Tab::make()->query(fn ($query) => $query->where('Unit', 'SMP Boarding')),
            'SMA' => ListRecords\Tab::make()->query(fn ($query) => $query->where('Unit', 'SMA')),
        ];
    }
}
