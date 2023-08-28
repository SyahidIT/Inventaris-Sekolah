<?php

namespace App\Filament\Widgets;

use DB;
use Carbon\Carbon;
use App\Models\PeminjamanBarang;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Widgets\TableWidget as BaseWidget;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Contracts\HasTable;
use Awcodes\FilamentBadgeableColumn\Components\Badge;
use Filament\Tables\Columns\BadgeColumn;
use Awcodes\FilamentBadgeableColumn\Components\BadgeableColumn;
use Illuminate\Support\Facades\Cache;

class PeminjamanTerbaru extends BaseWidget
{
    protected function getTableQuery(): Builder
    {
        return PeminjamanBarang::query()->latest();
    }

    protected static ?int $sort = 2;

    protected function getTableColumns(): array
    {
        return [
            TextColumn::make('No')->state(
                static function (HasTable $livewire, $rowLoop): string {
                    $cacheKey = 'row_number_' . $livewire->getTablePage() . '_' . $rowLoop->iteration;
            
                    return Cache::remember($cacheKey, now()->addMinutes(60*60*24), function () use ($livewire, $rowLoop) {
                        return (string) (
                            $rowLoop->iteration +
                            ($livewire->getTableRecordsPerPage() * (
                                $livewire->getTablePage() - 1
                            ))
                        );
                    });
                }
            ),
            TextColumn::make('NamaPeminjam')->sortable(),
            TextColumn::make('StatusPeminjaman'),
            BadgeColumn::make('Unit')
            ->colors([
                'gray' => fn ($state) => in_array($state, ['Unit', 'SD']),
                'danger' => fn ($state) => in_array($state, ['Unit', 'SMP Fullday']),
                'warning' => fn ($state) => in_array($state, ['Unit', 'SMP Boarding']),
                'success' => fn ($state) => in_array($state, ['Unit', 'SMA']),
            ]),
        ];
    }
}