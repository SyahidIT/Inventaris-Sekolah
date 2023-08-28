<x-app-layout>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>History Pemijaman Barang</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <style>
    .table-container {
        overflow-x: auto;
    }
</style>
    </head>                    
    <body>
    <div class="container col-lg-4 py-2">
    @section('content')
    <div class="container">
        <h1>History Peminjaman Barang</h1>
        <div class="table-container">
            <table class="table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Peminjam</th>
                    <th>Kode Barang</th>
                    <th>Nama Barang</th>
                    <th>Merek</th>
                    <th>Kategori</th>
                    <th>Kondisi Barang</th>
                    <th>Jumlah</th>
                    <th>Unit</th>
                    <th>Status Peminjaman</th>
                    <th>Tanggal Peminjaman</th>
                  
                </tr>
            </thead>
            <tbody>
                @foreach ($peminjamanBarangs as $index => $peminjamanBarang)
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $peminjamanBarang->NamaPeminjam }}</td>
                        <td>{{ $peminjamanBarang->KodeBarang }}</td>
                        <td>{{ $peminjamanBarang->NamaBarang }}</td>
                        <td>{{ $peminjamanBarang->Merek }}</td>
                        <td>{{ $peminjamanBarang->Kategori }}</td>
                        <td>{{ $peminjamanBarang->KondisiBarang }}</td>
                        <td>{{ $peminjamanBarang->Jumlah }}</td>
                        <td>{{ $peminjamanBarang->Unit }}</td>
                        <td style="font-weight: bold; color:{{ $peminjamanBarang->StatusPeminjaman == 'Sedang Dipinjam' ? 'red' : 'green' }}"></td>
                        <td>{{ \Carbon\Carbon::parse($peminjamanBarang->created_at)->format('d F Y') }}</td>
                        
                    </tr>
                @endforeach
            </tbody>
        </table>
        <p> Catatan:</p>
        <p> Jika ada ketidak sesuaian data yang ditampilkan, mohon untuk dapat menghubungi abi Ule</p>
    </div>
</body>

</x-app-layout>