<?php

namespace App\Filament\Resources\DistribusiResource\Pages;

use App\Filament\Resources\DistribusiResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Support\Facades\Cache;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use SebastianBergmann\Type\VoidType;

class ListDistribusis extends ListRecords
{
    protected static string $resource = DistribusiResource::class;

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
