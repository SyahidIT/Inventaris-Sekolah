<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MaintenanceResource\Pages;
use App\Filament\Resources\MaintenanceResource\RelationManagers;
use App\Models\Distribusi;
use App\Models\Maintenance;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Tables\Filters\Filter;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Contracts\HasTable;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Cache;
use Awcodes\FilamentBadgeableColumn\Components\Badge;
use Awcodes\FilamentBadgeableColumn\Components\BadgeableColumn;

class MaintenanceResource extends Resource
{
    protected static ?string $model = Maintenance::class;

    protected static ?string $navigationIcon = 'heroicon-o-calendar-days';
    protected static ?string $navigationGroup = 'Distribusi Barang';
    protected static ?int $navigationSort = 3;

    public static function getGloballySearchableAttributes(): array
    {
        return ['KodeBarang', 'NamaBarang'];
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('KodeBarang')
                    ->options(Distribusi::all()->pluck('KodeBarang', 'KodeBarang')->toArray())
                    ->searchable()
                    ->required()
                    ->reactive()
                    ->afterStateUpdated(fn(callable $set) => $set('NamaBarang', null)),

                Select::make('NamaBarang')
                    ->options(function (callable $get) {
                        $kodeBarang = $get('KodeBarang');
                        if (!$kodeBarang) {
                            return [];
                        }
                        $namaBarang = Distribusi::all()->where('KodeBarang', $kodeBarang)->pluck('NamaBarang', 'NamaBarang')->toArray();
                        return $namaBarang;
                    })
                    ->searchable()
                    ->required()
                    ->reactive(),

                DatePicker::make('MaintenanceSd')
                    ->label('Maintenanace SD')
                    ->placeholder('Kosongkan jika tidak ada')
                    ->nullable(),

                DatePicker::make('MaintenanceSmpFd')
                    ->label('Maintenanace SMP Fullday')
                    ->placeholder('Kosongkan jika tidak ada')
                    ->nullable(),

                DatePicker::make('MaintenanceSmpBd')
                    ->label('Maintenanace SMP Boarding')
                    ->placeholder('Kosongkan jika tidak ada')
                    ->nullable(),

                DatePicker::make('MaintenanceSma')
                    ->label('Maintenanace SMA')
                    ->placeholder('Kosongkan jika tidak ada')
                    ->nullable(),

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table->columns([
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
            TextColumn::make('MaintenanceSd')->label('SD'),
            TextColumn::make('MaintenanceSmpFd')->label('SMP Fullday'),
            TextColumn::make('MaintenanceSmpBd')->label('SMP Boarding'),
            TextColumn::make('MaintenanceSma')->label('SMA'),
            TextColumn::make('created_at')->dateTime()->label('Tanggal Input Data'),
            TextColumn::make('updated_at')->dateTime()->label('Tanggal Update Data'),
        ])
        ->filters([
            Filter::make('published_at')
                ->form(function () {
                    return [
                        DatePicker::make('published_from')->placeholder('Dec 18, ' . now()->subYear()->format('Y')),
                        DatePicker::make('published_until')->placeholder(now()->format('M d, Y')),
                    ];
                })
                ->query(function (Builder $query, array $data) {
                    return $query
                        ->when($data['published_from'], function ($query, $date) {
                            return $query->whereDate('published_at', '>=', $date);
                        })
                        ->when($data['published_until'], function ($query, $date) {
                            return $query->whereDate('published_at', '<=', $date);
                        });
                })
                ->indicateUsing(function (array $data) {
                    $indicators = [];
                    if ($data['published_from']) {
                        $indicators['published_from'] = 'Published from ' . Carbon::parse($data['published_from'])->toFormattedDateString();
                    }
                    if ($data['published_until']) {
                        $indicators['published_until'] = 'Published until ' . Carbon::parse($data['published_until'])->toFormattedDateString();
                    }
    
                    return $indicators;
                }),
        ])
        ->actions([
            Tables\Actions\ViewAction::make(),
            Tables\Actions\EditAction::make(),
            Tables\Actions\DeleteAction::make(),
        ])
        ->bulkActions([
            Tables\Actions\BulkActionGroup::make([
                Tables\Actions\DeleteBulkAction::make(),
            ]),
        ])
        ->emptyStateActions([
            Tables\Actions\CreateAction::make(),
        ]);
    }
      
    public static function getRelations(): array
    {
        return [
            //
        ];
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListMaintenances::route('/'),
            'create' => Pages\CreateMaintenance::route('/create'),
            'edit' => Pages\EditMaintenance::route('/{record}/edit'),
        ];
    }    
}
