<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DistribusiResource\Pages;
use App\Filament\Resources\DistribusiResource\RelationManagers;
use App\Models\Distribusi;
use App\Models\FormPembelian;
use App\Models\Gudang;
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
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Actions\BulkActionGroup;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\DeleteBulkAction;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Columns\BadgeColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Filament\Tables\Contracts\HasTable;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class DistribusiResource extends Resource
{
    protected static ?string $model = Distribusi::class;

    protected static ?string $navigationIcon = 'heroicon-o-truck';
    protected static ?string $navigationGroup = 'Distribusi Barang';
    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('KodeBarang')
                    ->options(Gudang::all()->pluck('KodeBarang', 'KodeBarang')->toArray())
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
                        $namaBarang = Gudang::all()->where('KodeBarang', $kodeBarang)->pluck('NamaBarang', 'NamaBarang')->toArray();
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
                        $kodeBarang = Gudang::all()->where('KodeBarang', $kodeBarang)->pluck('Merek', 'Merek')->toArray();
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
                        $kategoriBarang = Gudang::all()->where('KodeBarang', $kodeBarang)->pluck('Kategori', 'Kategori')->toArray();
                        return $kategoriBarang;
                    })
                    ->required()
                    ->reactive()
                    ->afterStateUpdated(fn(callable $set) => $set('Unit', null)),

                Select::make('Unit')
                    ->options(Ruangan::all()->pluck('Unit', 'Unit'))
                    ->searchable()
                    ->required()
                    ->reactive()
                    ->afterStateUpdated(fn(callable $set) => $set('Gedung', null)),

                Select::make('Gedung')
                    ->options(function (callable $get) {
                        $unit = $get('Unit');
                        if (!$unit) {
                            return [];
                        }
                        $gedung = Ruangan::all()->where('Unit', $unit)->pluck('Gedung', 'Gedung')->toArray();
                        return $gedung;
                    })
                    ->required()
                    ->reactive()
                    ->afterStateUpdated(fn(callable $set) => $set('Ruangan', null)),

                Select::make('Ruangan')
                    ->options(function (callable $get) {
                        $unit = $get('Unit');
                        if (!$unit) {
                            return [];
                        }
                        $gedung = Ruangan::all()->where('Unit', $unit)->pluck('Ruangan', 'Ruangan')->toArray();
                        return $gedung;
                    })
                    ->required()
                    ->reactive()
                    ->afterStateUpdated(fn(callable $set) => $set('Lantai', null)),

                Select::make('Lantai')
                    ->options(function (callable $get) {
                        $unit = $get('Unit');
                        if (!$unit) {
                            return [];
                        }
                        $gedung = Ruangan::all()->where('Unit', $unit)->pluck('Lantai', 'Lantai')->toArray();
                        return $gedung;
                    })
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
                        $sum = Gudang::where('KodeBarang', $kodeBarang)->sum('Stok');
                        return 'Tersedia: ' . $sum;
                    }),

                TextInput::make('Stok')
                    ->numeric()
                    ->required()
                    ->lte('Jumlah')
                    ->placeholder(function (callable $get) {
                        $kodeBarang = $get('KodeBarang');
                        if (!$kodeBarang) {
                            return 'Tersedia:';
                        }
                        $sum = Gudang::where('KodeBarang', $kodeBarang)->sum('Stok');
                        return 'Tersedia: ' . $sum;
                    }),

                Select::make('KondisiBarang')
                    ->options([
                        'Sangat Baik' => 'Sangat Baik',
                        'Cukup Baik' => 'Cukup Baik',
                        'Baik' => 'Baik',
                        'Rusak Ringan' => 'Rusak Ringan',
                        'Rusak Parah' => 'Rusak Parah',
                    ])
                    ->searchable()
                    ->required(),

                Select::make('SumberDana')
                    ->options([
                        'Dana Bos' => 'Dana Bos',
                        'Dana Sekolah' => 'Dana Sekolah',
                    ])
                    ->searchable()
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('No')->state(
                    static function (HasTable $livewire, $rowLoop): string {
                        return (string) (
                            $rowLoop->iteration +
                            ($livewire->getTableRecordsPerPage() * (
                                $livewire->getTablePage() - 1
                            ))
                        );
                    }
                ),
                BadgeColumn::make('Unit')
                ->colors([
                    'primary' => fn ($state) => in_array($state, ['Unit', 'SD']),
                    'gray' => fn ($state) => in_array($state, ['Unit', 'SMP Fullday']),
                    'warning' => fn ($state) => in_array($state, ['Unit', 'SMP Boarding']),
                    'success' => fn ($state) => in_array($state, ['Unit', 'SMA']),
                ]),
                TextColumn::make('KodeBarang')->sortable()->searchable(),
                TextColumn::make('NamaBarang')->sortable()->searchable(),
                TextColumn::make('Merek')->sortable()->searchable(),
                TextColumn::make('Kategori')->sortable()->searchable(),
                TextColumn::make('Gedung')->sortable()->searchable(),
                TextColumn::make('Ruangan')->sortable()->searchable(),
                TextColumn::make('Lantai')->sortable()->searchable(),
                TextColumn::make('Jumlah')->sortable()->searchable(),
                TextColumn::make('KondisiBarang')->sortable()->searchable(),
                TextColumn::make('SumberDana')->sortable()->searchable(),
                TextColumn::make('Valuasi') 
                    ->numeric(
                        decimalPlaces: 0,
                        decimalSeparator: '.',
                        thousandsSeparator: '.',
                        )
                    ->sortable()->searchable()->prefix('Rp.'),
                    ])
            
                ->filters([
                SelectFilter::make('SumberDana')
                        ->options([
                            'Dana Bos' => 'Dana Bos',
                            'Dana Sekolah' => 'Dana Sekolah',
                        ]),
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
                ActionGroup::make([
                    ViewAction::make(),
                    DeleteAction::make(),
                    Action::make('Lihat Qr Code')
                    ->icon('heroicon-o-qr-code')
                    ->url(fn (Distribusi $record) => static::getUrl('qr-code', ['record' => $record]))
                    ->openUrlInNewTab()
                ])
            ])
            ->bulkActions([
                BulkActionGroup::make([
                DeleteBulkAction::make(),
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
            'index' => Pages\ListDistribusis::route('/'),
            'create' => Pages\CreateDistribusi::route('/create'),
            'qr-code' => Pages\LihatQrCode::route('/{record}/qr-code'),
        ];
    }    
}
