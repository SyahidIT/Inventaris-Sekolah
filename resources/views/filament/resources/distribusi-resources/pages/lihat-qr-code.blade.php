<x-filament-panels::page>

{!! QrCode::size(300)->generate(collect($record)->except(['id', 'Jumlah','Stok'])) !!}

</x-filament-panels::page>