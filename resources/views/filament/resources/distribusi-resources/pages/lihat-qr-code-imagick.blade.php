<x-filament-panels::page>

<img src="data:image/png;base64, {!! base64_encode(QrCode::format('png')->size(100)->generate(collect($record)->except(['id', 'Jumlah','Stok']))) !!}">

</x-filament-panels::page>