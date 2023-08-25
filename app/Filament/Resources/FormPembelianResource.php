<?php

namespace App\Filament\Resources;

use App\Filament\Resources\FormPembelianResource\Pages;
use App\Filament\Resources\FormPembelianResource\RelationManagers;
use App\Models\FormPembelian;
use App\Models\Gudang;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Actions\BulkActionGroup;
use Filament\Tables\Actions\CreateAction;
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
use pxlrbt\FilamentExcel\Exports\ExcelExport;
use pxlrbt\FilamentExcel\Columns\Column;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class FormPembelianResource extends Resource
{
    protected static ?string $model = FormPembelian::class;

    protected static ?string $navigationIcon = 'heroicon-o-currency-dollar';
    protected static ?string $navigationGroup = 'Master Data';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('KodeBarang')
                    ->placeholder('Contoh: AC0001SD, contoh SD disini kode untuk unit SD')
                    ->required()
                    ->minLength(5),
                // Define the NamaBarang field
                TextInput::make('NamaBarang')
                    ->placeholder('Contoh: AC')
                    ->required()
                    ->maxLength(255),
                // Define the Merek field
                TextInput::make('Merek')
                    ->placeholder('Contoh: Gree')
                    ->required()
                    ->maxLength(255),
                Select::make('Kategori')
                    ->options([
                        'Electronik' => 'Elektronik',
                        'Furniture' => 'Furniture',
                        'Pecah Belah' => 'Pecah Belah',
                        'Alat Olahraga' => 'Alat Olahraga',
                        'Lainnya' => 'Lainnya',
                    ])
                    ->searchable()
                    ->required(),
                TextInput::make('Jumlah')
                    ->placeholder('Contoh: 10')
                    ->required()
                    ->numeric(),

                TextInput::make('HargaPerUnit')
                    ->placeholder('Contoh: 1000')
                    ->required()
                    ->numeric(),

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
                TextColumn::make('Jumlah')->sortable()->searchable(),
                TextColumn::make('HargaPerUnit')->prefix('Rp.')->sortable()->searchable()
                ->numeric(
                    decimalPlaces: 0,
                    decimalSeparator: '.',
                    thousandsSeparator: '.',
                ),
                TextColumn::make('Valuasi')
                    ->sortable()
                    ->searchable()
                    ->default(function ($record) {
                        return Cache::remember('valuasi_formpembelian' . $record->id, now()->addMinutes(60*60*24), function () use ($record) {
                            $valuasi = $record->Jumlah * $record->HargaPerUnit;
                            return 'Rp.' . number_format($valuasi, 0, ',', '.');
                        });
                    }),

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
                DeleteAction::make()
                // ->before(function () {
                //     //
                // })
                // ->after(function () {
                //     // ...
                // })
                ]),
            ])
            ->bulkActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                    ExportBulkAction::make()->exports([
                        ExcelExport::make()->withColumns([
                            Column::make('No'),
                            Column::make('KodeBarang'),
                            Column::make('NamaBarang'),
                            Column::make('Merek'),
                            Column::make('Kategori'),
                            Column::make('Jumlah'),
                            Column::make('HargaPerUnit'),
                            Column::make('Valuasi'),
                            Column::make('created_at'),
                        ])
                    ])
                    
                        ]),
            ])
            ->emptyStateActions([
                CreateAction::make(),
            ]);
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListFormPembelians::route('/'),
            'create' => Pages\CreateFormPembelian::route('/create'),
        ];
    }
    
}

