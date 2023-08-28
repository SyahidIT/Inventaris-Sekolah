<?php

namespace App\Filament\Widgets;

use DB;
use Carbon\Carbon;
use App\Models\Maintenance;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Widgets\TableWidget as BaseWidget;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Contracts\HasTable;
use Awcodes\FilamentBadgeableColumn\Components\Badge;
use Awcodes\FilamentBadgeableColumn\Components\BadgeableColumn;
use Illuminate\Support\Facades\Cache;

class MaintenanceTerbaru extends BaseWidget
{
    protected function getTableQuery(): Builder
    {
        return Maintenance::query()->latest();
    }

    protected static ?int $sort = 1;

    protected function getTableColumns(): array
    {
        return [
            TextColumn::make('No')->state(function (HasTable $livewire, $rowLoop) {
                $cacheKey = 'row_number_' . $livewire->getTablePage() . '_' . $rowLoop->iteration;

                return Cache::remember($cacheKey, now()->addMinutes(60 * 60 * 24), function () use ($livewire, $rowLoop) {
                    return (string)(
                        $rowLoop->iteration +
                        ($livewire->getTableRecordsPerPage() * ($livewire->getTablePage() - 1))
                    );
                });
            }),
            BadgeableColumn::make('KodeBarang')->suffixBadges([
                Badge::make('MaintenanceSd')
                    ->label('SD')
                    ->color('danger')
                    ->visible(function ($record) {
                        $maintenanceDate = Carbon::parse($record->MaintenanceSd);
                        $today = Carbon::today();
                        $daysLeft = $today->diffInDays($maintenanceDate, false);
                        return $daysLeft <= 5;
                    }),

                Badge::make('MaintenanceSmpFd')
                    ->label('SMP FD')
                    ->color('danger')
                    ->visible(function ($record) {
                        $maintenanceDate = Carbon::parse($record->MaintenanceSmpFd);
                        $today = Carbon::today();
                        $daysLeft = $today->diffInDays($maintenanceDate, false);
                        return $daysLeft <= 5;
                    }),

                Badge::make('MaintenanceSmpBd')
                    ->label('SMP BD')
                    ->color('danger')
                    ->visible(function ($record) {
                        $maintenanceDate = Carbon::parse($record->MaintenanceSmpBd);
                        $today = Carbon::today();
                        $daysLeft = $today->diffInDays($maintenanceDate, false);
                        return $daysLeft <= 5;
                    }),

                Badge::make('MaintenanceSma')
                    ->label('SMP SMA')
                    ->color('danger')
                    ->visible(function ($record) {
                        $maintenanceDate = Carbon::parse($record->MaintenanceSma);
                        $today = Carbon::today();
                        $daysLeft = $today->diffInDays($maintenanceDate, false);
                        return $daysLeft <= 5;
                    }),

            ]),
            TextColumn::make('NamaBarang'),
        ];
    }
}