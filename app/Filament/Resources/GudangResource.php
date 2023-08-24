<?php

namespace App\Filament\Resources;

use App\Filament\Resources\GudangResource\Pages;
use App\Filament\Resources\GudangResource\RelationManagers;
use App\Models\FormPembelian;
use App\Models\Gudang;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Actions\BulkActionGroup;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\DeleteBulkAction;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Filament\Tables\Contracts\HasTable;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Illuminate\Support\Facades\Cache;
use Illuminate\Database\Eloquent\SoftDeletingScope;

//custom action
//use Illuminate\Http\Request;

class GudangResource extends Resource
{
    protected static ?string $model = Gudang::class;

    protected static ?string $navigationIcon = 'heroicon-o-cube';
    protected static ?string $navigationGroup = 'Master Data';
    public static function getGloballySearchableAttributes(): array
    {
        return ['KodeBarang', 'Kategori', 'NamaBarang', 'Merek'];
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
            Select::make('KodeBarang')
                ->options(FormPembelian::all()->pluck('KodeBarang', 'KodeBarang'))
                ->unique(ignoreRecord: true)
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
                    $namaBarang = FormPembelian::all()->where('KodeBarang', $kodeBarang)->pluck('NamaBarang', 'NamaBarang');
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
                    $kodeBarang = FormPembelian::all()->where('KodeBarang', $kodeBarang)->pluck('Merek', 'Merek');
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
                    $kategoriBarang = FormPembelian::all()->where('KodeBarang', $kodeBarang)->pluck('Kategori', 'Kategori');
                    return $kategoriBarang;
                })
                ->required()
                ->reactive()
                ->afterStateUpdated(fn(callable $set) => $set('Jumlah', null)),

            Select::make('Jumlah')
                ->options(function (callable $get) {
                    $kodeBarang = $get('KodeBarang');
                    if (!$kodeBarang) {
                        return [];
                    }
                    $sum = FormPembelian::all()->where('KodeBarang', $kodeBarang)->sum('Jumlah');
                    return [$sum => $sum];
                })
                ->required()
                ->reactive(),

            Select::make('Valuasi')
                ->options(function (callable $get) {
                    $kodeBarang = $get('KodeBarang');
                    if (!$kodeBarang) {
                        return [];
                    }
                    $formPembelian = FormPembelian::where('KodeBarang', $kodeBarang)->first();
                    if (!$formPembelian) {
                        return [];
                    }
                    $valuasiBarang = $formPembelian->Jumlah * $formPembelian->HargaPerUnit;
                    return [$valuasiBarang => $valuasiBarang];
                })
                ->required()
                ->reactive()
                ->prefix('Rp.'),

            Select::make('Stok')
                ->options(function (callable $get) {
                    $kodeBarang = $get('KodeBarang');
                    if (!$kodeBarang) {
                        return [];
                    }
                    $sum = FormPembelian::all()->where('KodeBarang', $kodeBarang)->sum('Jumlah');
                    return [$sum => $sum];
                })
                ->required()
                ->reactive()


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
                TextColumn::make('KodeBarang')->sortable()->searchable(),
                TextColumn::make('NamaBarang')->sortable()->searchable(),
                TextColumn::make('Merek')->sortable()->searchable(),
                TextColumn::make('Kategori')->sortable()->searchable(),
                TextColumn::make('Jumlah')
                    ->label('Jumlah Total'),
                TextColumn::make('Stok'),
                TextColumn::make('Valuasi') 
                    ->prefix('Rp.')    
                    ->numeric(
                        decimalPlaces: 0,
                        decimalSeparator: '.',
                        thousandsSeparator: '.',
                ),
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
                ActionGroup::make([
                ViewAction::make(),
                DeleteAction::make(),
            ]),
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
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListGudangs::route('/'),
            'create' => Pages\CreateGudang::route('/create'),
        ];
    }
    
    //custom action
    // function (Request $request, array $arguments) {
    //     // ...
    // }
}
