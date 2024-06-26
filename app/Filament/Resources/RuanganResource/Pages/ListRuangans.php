<?php

namespace App\Filament\Resources\RuanganResource\Pages;

use App\Filament\Resources\RuanganResource;
use App\Imports\ImportRuangans;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Support\Facades\Cache;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Facades\Excel;

class ListRuangans extends ListRecords
{
    protected static string $resource = RuanganResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    public function getHeader(): ?View
    {
        $data =  Actions\CreateAction::make();
        return view('filament.custom.upload-file-ruangan', compact('data'));
    }

    public $file = '';

    public function save(){
        if($this->file != ''){
            Excel::import(new ImportRuangans, $this->file);
        }
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
