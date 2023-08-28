<?php

namespace App\Filament\Widgets;
use App\Models\Distribusi;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Illuminate\Support\Facades\Cache;

class DistribusiOverview extends BaseWidget
{
    protected static ?int $sort = 0;

    protected function getStats(): array
    {
        $totalValuasiSD = Cache::remember('total_valuasi_sd', now()->addMinutes(60*60*24), function () {
            return Distribusi::where('Unit', 'SD')->sum('Valuasi') / 1000;
        });

        $totalValuasiSMPFD = Cache::remember('total_valuasi_smpfd', now()->addMinutes(60*60*24), function () {
            return Distribusi::where('Unit', 'SMP FULLDAY')->sum('Valuasi') / 1000;
        });

        $totalValuasiSMPBD = Cache::remember('total_valuasi_smpbd', now()->addMinutes(60*60*24), function () {
            return Distribusi::where('Unit', 'SMP BOARDING')->sum('Valuasi') / 1000;
        });

        $totalValuasiSMA = Cache::remember('total_valuasi_sma', now()->addMinutes(60*60*24), function () {
            return Distribusi::where('Unit', 'SMA')->sum('Valuasi') / 1000;
        });

    
    return [
            Stat::make('Unit SD', 'Rp. ' . $totalValuasiSD . 'K')
                ->description('sangat baik')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([7, 2, 10, 3, 15, 4, 17])
                ->color('success'),
            Stat::make('Unit SMP Fullday', 'Rp. ' . $totalValuasiSMPFD . 'K')
                ->description('sangat baik')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([7, 2, 10, 3, 15, 4, 17])
                ->color('success'),
            Stat::make('Unit SMP Boarding', 'Rp. ' . $totalValuasiSMPBD . 'K')
                ->description('sangat baik')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([7, 2, 10, 3, 15, 4, 17])
                ->color('success'),
            Stat::make('Unit SMP SMA', 'Rp. ' . $totalValuasiSMA . 'K')
                ->description('sangat baik')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([7, 2, 10, 3, 15, 4, 17])
                ->color('success'),
        ];
    }
}
