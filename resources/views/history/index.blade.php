<x-app-layout>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>History Pemijaman Barang</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    </head>                    
    <body>
    <div class="container col-lg-4 py-2">
    @section('content')
    <div class="container">
        <h1>History Peminjaman Barang</h1>

        <table class="table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Peminjam</th>
                    <th>Nama Barang</th>
                  
                </tr>
            </thead>
            <tbody>
                @foreach ($peminjamanBarangs as $index => $peminjamanBarang)
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $peminjamanBarang->NamaPeminjam }}</td>
                        <td>{{ $peminjamanBarang->NamaBarang }}</td>
                        
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</body>

</x-app-layout>