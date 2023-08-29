<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PeminjamanBarangResource\Pages;
use App\Filament\Resources\PeminjamanBarangResource\RelationManagers;
use App\Models\Distribusi;
use App\Models\Gudang;
use App\Models\PeminjamanBarang;
use App\Models\Ruangan;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\BulkActionGroup;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\DeleteBulkAction;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Columns\BadgeColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Filament\Tables\Contracts\HasTable;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use pxlrbt\FilamentExcel\Exports\ExcelExport;
use pxlrbt\FilamentExcel\Columns\Column;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class PeminjamanBarangResource extends Resource
{
    protected static ?string $model = PeminjamanBarang::class;

    protected static ?string $navigationIcon = 'heroicon-o-inbox';
    protected static ?string $navigationGroup = 'Distribusi Barang';
    protected static ?int $navigationSort = 4;

    public static function getGloballySearchableAttributes(): array
    {
        return ['KodeBarang', 'Kategori', 'NamaBarang', 'Merek'];
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Hidden::make('NamaPeminjam')
                    ->default(function () {
                        return Auth::user()->name;
                    }),
                Select::make('KodeBarang')
                    ->options(Distribusi::all()->pluck('KodeBarang', 'KodeBarang')->toArray())
                    ->unique()
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
                    ->required()
                    ->reactive()
                    ->afterStateUpdated(fn(callable $set) => $set('Merek', null)),

                Select::make('Merek')
                    ->options(function (callable $get) {
                        $kodeBarang = $get('KodeBarang');
                        if (!$kodeBarang) {
                            return [];
                        }
                        $kodeBarang = Distribusi::all()->where('KodeBarang', $kodeBarang)->pluck('Merek', 'Merek')->toArray();
                        return $kodeBarang;
                    })
                    ->required()
                    ->reactive()
                    ->afterStateUpdated(fn(callable $set) => $set('Kategori', null)),

                Select::make('Kategori')
                    ->options(function (callable $get) {
                        $kodeBarang = $get('KodeBarang');
                        if (!$kodeBarang) {
                            return [];
                        }
                        $kategoriBarang = Distribusi::all()->where('KodeBarang', $kodeBarang)->pluck('Kategori', 'Kategori')->toArray();
                        return $kategoriBarang;
                    })
                    ->required()
                    ->reactive()
                    ->afterStateUpdated(fn(callable $set) => $set('Unit', null)),

                Select::make('Unit')
                    ->options(Ruangan::all()->pluck('Unit', 'Unit'))
                    ->searchable()
                    ->required()
                    ->reactive(),

                TextInput::make('Jumlah')
                    ->numeric()
                    ->required()
                    ->placeholder(function (callable $get) {
                        $kodeBarang = $get('KodeBarang');
                        if (!$kodeBarang) {
                            return 'Tersedia:';
                        }
                        $sum = Distribusi::where('KodeBarang', $kodeBarang)->sum('Stok');
                        return 'Tersedia: ' . $sum;
                    }),

                Select::make('KondisiBarang')
                    ->options(function (callable $get) {
                        $kodeBarang = $get('KodeBarang');
                        if (!$kodeBarang) {
                            return [];
                        }
                        $kondisiBarang = Distribusi::all()->where('KodeBarang', $kodeBarang)->pluck('KondisiBarang', 'KondisiBarang')->toArray();
                        return $kondisiBarang;
                    })
                    ->required()
                    ->reactive(),

                Select::make('SumberDana')
                    ->options(function (callable $get) {
                        $kodeBarang = $get('KodeBarang');
                        if (!$kodeBarang) {
                            return [];
                        }
                        $kondisiBarang = Distribusi::all()->where('KodeBarang', $kodeBarang)->pluck('SumberDana', 'SumberDana')->toArray();
                        return $kondisiBarang;
                    })
                    ->required()
                    ->reactive(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
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
                TextColumn::make('NamaPeminjam')->sortable()->searchable(),
                TextColumn::make('StatusPeminjaman'),
                BadgeColumn::make('Unit')
                ->colors([
                    'gray' => fn ($state) => in_array($state, ['Unit', 'SD']),
                    'danger' => fn ($state) => in_array($state, ['Unit', 'SMP Fullday']),
                    'warning' => fn ($state) => in_array($state, ['Unit', 'SMP Boarding']),
                    'success' => fn ($state) => in_array($state, ['Unit', 'SMA']),
                ]),
                TextColumn::make('KodeBarang')->sortable()->searchable(),
                TextColumn::make('NamaBarang')->sortable()->searchable(),
                TextColumn::make('Merek')->sortable()->searchable(),
                TextColumn::make('Kategori')->sortable()->searchable(),
                TextColumn::make('Jumlah')->sortable()->searchable(),
                TextColumn::make('KondisiBarang')->sortable()->searchable(),
                TextColumn::make('SumberDana')->sortable()->searchable(),
                ToggleColumn::make('Status'),
                TextColumn::make('created_at')
                    ->dateTime()
                    ->label('Tanggal Input Data'),
            ])
            ->filters([
                Filter::make('created_at')
                        ->form([
                                DatePicker::make('Dari')->label('Dari tanggal')->placeholder('Pilih tanggal'),
                                DatePicker::make('Sampai')->label('Sampai tanggal')->placeholder('Pilih tanggal'),
                            ])
                        ->indicateUsing(function (array $data): array {
                            $indicators = [];

                            if ($data['Dari'] ?? null) {
                                $indicators['from'] = 'Data dari tanggal ' . Carbon::parse($data['Dari'])->toFormattedDateString();
                            }

                            if ($data['Sampai'] ?? null) {
                                $indicators['until'] = 'Data sampai tanggal ' . Carbon::parse($data['Sampai'])->toFormattedDateString();
                            }

                            return $indicators;
                        })
                        ->query(function (Builder $query, array $data): Builder {
                            return $query
                                ->when(
                                    $data['Dari'],
                                    fn(Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                                )
                                ->when(
                                    $data['Sampai'],
                                    fn(Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                                );
                        })
            ])
            ->filtersTriggerAction(
                fn (Action $action) => $action
                    ->button()
                    ->label('Filter'),
            )
            ->actions([
                ViewAction::make(),
                DeleteAction::make(),
                // DeleteAction::make()->visible(function ($record) {
                //     $kodeBarang = $record->getModel()->KodeBarang;
                //     $isInDistribusi = Distribusi::where('KodeBarang', $kodeBarang)->exists();
                //     return !$isInDistribusi;
                // }),
            ])
            ->bulkActions([
                BulkActionGroup::make([
                    ExportBulkAction::make()->exports([
                        ExcelExport::make()->withColumns([
                            Column::make('No'),
                            Column::make('NamaPeminjam'),
                            Column::make('StatusPeminjaman'),
                            Column::make('Unit'),
                            Column::make('KodeBarang'),
                            Column::make('NamaBarang'),
                            Column::make('Merek'),
                            Column::make('Kategori'),
                            Column::make('Jumlah'),
                            Column::make('KondisiBarang'),
                            Column::make('SumberDana'),
                            Column::make('Status'),
                            Column::make('created_at'), 
                        ])
                    ])
                    
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
            'index' => Pages\ListPeminjamanBarangs::route('/'),
            'create' => Pages\CreatePeminjamanBarang::route('/create'),
            'edit' => Pages\EditPeminjamanBarang::route('/{record}/edit'),
        ];
    }    
}
