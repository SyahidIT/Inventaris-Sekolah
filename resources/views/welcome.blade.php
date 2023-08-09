<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Absen Siswa</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
  <div class="container col-lg-4 py-5">
    {{-- Scanner --}}
    <div class="card bg-white shadow rounded-3 p-3 border-0">
      {{-- Pesan --}}
      @if (session()->has('gagal'))
        <div class="alert alert-warning" role="alert">
          {{ session()->get('gagal') }}
        </div>
      @endif

      @if (session('success'))
    <p>{{ session('success') }}</p>
    @if (session('siswa'))
        <p>Nama Siswa yang Absen: {{ session('siswa')->nama }}</p>
    @endif
@endif


      <video id="preview"></video>

      {{-- Form --}}
      <form action="{{ route('store') }}" method="POST" id="form">
        @csrf    
        <input type="hidden" name="id_siswa" id="id_siswa">
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
        document.getElementById('id_siswa').value = c;
        document.getElementById('form').submit();
      });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  </body>
</html>