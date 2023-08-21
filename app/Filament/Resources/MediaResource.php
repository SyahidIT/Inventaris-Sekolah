<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MediaResource\Pages;
use App\Filament\Resources\MediaResource\RelationManagers;
use App\Models\Media;
use Filament\Forms;
use Filament\Infolists\Components;
use Filament\Infolists\Infolist;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\DeleteBulkAction;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\MarkdownEditor;
use Filament\Forms\Components\Section;
use Filament\Tables\Columns\ImageColumn;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;
use Filament\Forms\Components\Placeholder;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class MediaResource extends Resource
{
    protected static ?string $model = Media::class;

    protected static ?string $slug = 'media/posts';
    protected static ?string $navigationIcon = 'heroicon-o-photo';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Group::make()
                ->schema([
                    Section::make()
                        ->schema([
                            TextInput::make('Judul')
                                ->required()
                                ->lazy()
                                ->afterStateUpdated(fn (string $context, $state, callable $set) => $context === 'create' ? $set('slug', Str::slug($state)) : null),

                            TextInput::make('slug')
                                ->disabled()
                                ->dehydrated()
                                ->required()
                                ->unique(Media::class, 'slug', ignoreRecord: true),

                            MarkdownEditor::make('Konten')
                                ->label('Deskripsi Media')
                                ->required()
                                ->columnSpan('full'),
                            
                        ])
                        ->columns(2),

                    Section::make('Gambar')
                        ->schema([
                            FileUpload::make('Gambar')
                                ->image(),
                        ])
                        ->collapsible(),
                ])
                ->columnSpan(['lg' => fn (?Media $record) => $record === null ? 3 : 2]),

            Section::make()
                ->schema([
                    Placeholder::make('created_at')
                        ->label('Created at')
                        ->content(fn (Media $record): ?string => $record->created_at?->diffForHumans()),

                    Placeholder::make('updated_at')
                        ->label('Last modified at')
                        ->content(fn (Media $record): ?string => $record->updated_at?->diffForHumans()),
                ])
                ->columnSpan(['lg' => 1])
                ->hidden(fn (?Media $record) => $record === null),
        ])
        ->columns([
            'sm' => 3,
            'lg' => null,
        ]);
}

public static function table(Table $table): Table
{
    return $table
        ->columns([
            TextColumn::make('Judul')
                ->searchable()
                ->sortable(),

            TextColumn::make('slug')
                ->searchable()
                ->sortable()
                ->toggleable(isToggledHiddenByDefault: false),

            TextColumn::make('Konten')
                ->label('Deskripsi Barang')
                ->searchable()
                ->sortable()
                ->toggleable(isToggledHiddenByDefault: false),

            ImageColumn::make('Gambar'),

        ])
        ->filters([
            Filter::make('published_at')
                ->form([
                    DatePicker::make('published_from')
                        ->placeholder(fn ($state): string => 'Dec 18, ' . now()->subYear()->format('Y')),
                    DatePicker::make('published_until')
                        ->placeholder(fn ($state): string => now()->format('M d, Y')),
                ])
                ->query(function (Builder $query, array $data): Builder {
                    return $query
                        ->when(
                            $data['published_from'] ?? null,
                            fn (Builder $query, $date): Builder => $query->whereDate('published_at', '>=', $date),
                        )
                        ->when(
                            $data['published_until'] ?? null,
                            fn (Builder $query, $date): Builder => $query->whereDate('published_at', '<=', $date),
                        );
                })
                ->indicateUsing(function (array $data): array {
                    $indicators = [];
                    if ($data['published_from'] ?? null) {
                        $indicators['published_from'] = 'Published from ' . Carbon::parse($data['published_from'])->toFormattedDateString();
                    }
                    if ($data['published_until'] ?? null) {
                        $indicators['published_until'] = 'Published until ' . Carbon::parse($data['published_until'])->toFormattedDateString();
                    }

                    return $indicators;
                }),
        ])
        ->actions([
            ViewAction::make(),

            EditAction::make(),

            DeleteAction::make(),
        ])
        ->groupedBulkActions([
            DeleteBulkAction::make()
                ->action(function () {
                  
                }),
        ]);
}

public static function infolist(Infolist $infolist): Infolist
{
    return $infolist
        ->schema([
            Components\Section::make()
                ->schema([
                    Components\Split::make([
                        Components\Grid::make(2)
                            ->schema([
                                Components\Group::make([
                                    Components\TextEntry::make('Judul'),
                                    Components\TextEntry::make('slug'),
                                ]),
                            ]),
                            Components\ImageEntry::make('Gambar')
                            ->hiddenLabel()
                            ->grow(false),
                    ])->from('lg'),
                ]),
                Components\Section::make('Konten')
                ->schema([
                    Components\TextEntry::make('Konten')
                        ->prose()
                        ->markdown()
                        ->hiddenLabel(),
                ])
                ->collapsible(),
        ]);
}
   
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListMedia::route('/'),
            'create' => Pages\CreateMedia::route('/create'),
            'edit' => Pages\EditMedia::route('/{record}/edit'),
        ];
    }    
}
