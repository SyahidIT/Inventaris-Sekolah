<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PeminjamanBarangResource\Pages;
use App\Filament\Resources\PeminjamanBarangResource\RelationManagers;
use App\Models\PeminjamanBarang;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\BadgeColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Filament\Tables\Contracts\HasTable;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\Action;
use Illuminate\Support\Facades\Cache;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class PeminjamanBarangResource extends Resource
{
    protected static ?string $model = PeminjamanBarang::class;

    protected static ?string $navigationIcon = 'heroicon-o-inbox';
    protected static ?string $navigationGroup = 'Distribusi Barang';
    protected static ?int $navigationSort = 3;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('NamaPeminjam'),
                TextInput::make('KodeBarang'),
                TextInput::make('NamaBarang'),
                TextInput::make('Merek'),
                TextInput::make('Kategori'),
                TextInput::make('Unit'),
                TextInput::make('Gedung'),
                TextInput::make('Ruangan'),
                TextInput::make('Lantai'),
                TextInput::make('Jumlah'),
                TextInput::make('KondisiBarang'),
                TextInput::make('SumberDana'),
                TextInput::make('Valuasi'),
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
                TextColumn::make('StatusPeminjaman')
                ->default(function ($record) {
                    $status = $record->Status;

                    if ($status == 1) {
                        return 'Sedang Dipinjam';
                    } elseif ($status == 0) {
                        return 'Sudah Dipulangkan';
                    }
                }),
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
                TextColumn::make('Gedung')->sortable()->searchable(),
                TextColumn::make('Ruangan')->sortable()->searchable(),
                TextColumn::make('Lantai')->sortable()->searchable(),
                TextColumn::make('Jumlah')->sortable()->searchable(),
                TextColumn::make('KondisiBarang')->sortable()->searchable(),
                TextColumn::make('SumberDana')->sortable()->searchable(),
                TextColumn::make('Valuasi')->sortable()->searchable(),
                ToggleColumn::make('Status')
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
                Tables\Actions\EditAction::make(),
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
            'index' => Pages\ListPeminjamanBarangs::route('/'),
            'create' => Pages\CreatePeminjamanBarang::route('/create'),
            'edit' => Pages\EditPeminjamanBarang::route('/{record}/edit'),
        ];
    }    
}
