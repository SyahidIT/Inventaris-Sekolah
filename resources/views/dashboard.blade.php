<x-app-layout>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Pemijaman Barang</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
           
           <style>
            .tombol-khusus {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }
        </style>

    </head>                    
    <body>
                        <div class="container col-lg-4 py-5">
                            {{-- Scanner --}}
                            <a href="{{ route('pemulangan.index') }}" class="tombol-khusus" style="text-decoration: none;">Pemulangan Barang</a>
                            <div class="card bg-white shadow rounded-3 p-3 border-0" style="display: flex; justify-content: center; align-items: center;">

                                {{-- Pesan --}}
                                @if (session()->has('gagal'))
                                    <div class="alert alert-warning" role="alert">
                                        {{ session()->get('gagal') }}
                                    </div>
                                @endif

                                @if (session('success'))
                                    <p>{{ session('success') }}</p>
                                    @if (session('newItem'))
                                        <p><b>NamaBarang:</b> {{ session('newItem')['NamaBarang'] }}</p>
                                        <p><b>Jumlah:</b> {{ session('newItem')['Jumlah'] }}</p>
                                    @endif
                                @endif

                                <video id="preview"></video>

                                {{-- Form --}}
                                <form action="{{ route('peminjaman.store') }}" method="POST" id="form">
                                    @csrf    
                                    <input type="hidden" name="user_id" id="user_id">
                                    <input type="hidden" name="NamaPeminjam" id="NamaPeminjam">
                                    <input type="hidden" name="KodeBarang" id="KodeBarang">
                                    <input type="hidden" name="NamaBarang" id="NamaBarang">
                                    <input type="hidden" name="Merek" id="Merek">
                                    <input type="hidden" name="Kategori" id="Kategori">
                                    <input type="hidden" name="KondisiBarang" id="KondisiBarang">
                                    <input type="hidden" name="SumberDana" id="SumberDana">
                                    <input type="hidden" name="Unit" id="Unit">
                                </form>
                                
                                {{-- Scripts --}}
                                <script src="/js/instascan.min.js"></script>
                                <script>
                                    let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
                                    scanner.addListener('scan', function (content) {
                                        console.log(content);
                                    });
                                    Instascan.Camera.getCameras().then(function (cameras) {
                                        if (cameras.length > 0) {
                                            scanner.start(cameras[0]);
                                        } else {
                                            console.error('No cameras found.');
                                        }
                                    }).catch(function (e) {
                                        console.error(e);
                                    });

                                    scanner.addListener('scan', function(c) {
                                        document.getElementById('user_id').value = c;
                                        document.getElementById('NamaPeminjam').value = c;
                                        document.getElementById('KodeBarang').value = c;
                                        document.getElementById('NamaBarang').value = c;
                                        document.getElementById('Merek').value = c;
                                        document.getElementById('Kategori').value = c;
                                        document.getElementById('KondisiBarang').value = c;
                                        document.getElementById('SumberDana').value = c;
                                        document.getElementById('Unit').value = c;
                                        document.getElementById('form').submit();
                                    });
                                </script>
                                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
                               
                            </div>
                            
                        </div>
                        <a href="{{ route('history.index') }}" class="tombol-khusus" style="text-decoration: none;">History Peminjaman</a>
                            <div class="card bg-white shadow rounded-3 p-3 border-0" style="display: flex; justify-content: center; align-items: center;"> 
                    </body>
                    <div class="container col-lg-4 py-2">
                    <p><b>Catatan:</b></p>
                    <p><b>1.</b>Halaman ini hanya untuk peminjaman barang saja.</p>
                    <p><b>2.</b>Untuk pemulangan barang mohon klik tombol "Pemulangan barang" di atas.</p>
                    <p><b>3.</b>Jika "Stok Habis", hubungi Abi Ule selaku koordinator sarpras</p>
                </div>
                <footer class="bg-light py-5">
                    <a href="https://github.com/SyahidIT" target="_blank">
                        <div class="container px-4 px-lg-5">
                          <div class="small text-center text-muted">Made with ❤️ by Syahid Abdillah</div>
                        </div>
                      </a>
                      
                      
                </footer>
            </div>
        </div>
    </div>
</x-app-layout>
