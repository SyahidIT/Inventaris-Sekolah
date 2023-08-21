<x-filament-panels::page>
<style>
    #container {
    display: flex;
    align-items: flex-start;
  }
  #download-button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
  }

  #download-button:hover {
    background-color: #45a049;
  }
</style>
    <img id="qr-code-image" src="data:image/png;base64, {!! base64_encode(QrCode::margin(5)->backgroundColor(255, 255, 255)->format('png')->merge('/public/Logo-SQDF.png', .2)->size(300)->generate(collect($record)->except(['id', 'Jumlah','Stok','created_at','updated_at']))) !!}">

    <a id="download-button" href="#" download="qrcode.png"><b>Download QR Code</b></a>

</x-filament-panels::page>

<script>
    const downloadButton = document.getElementById('download-button');
    const qrCodeImage = document.getElementById('qr-code-image');

    downloadButton.addEventListener('click', () => {
        const canvas = document.createElement('canvas');
        const context = canvas.getContext('2d');

        canvas.width = qrCodeImage.width;
        canvas.height = qrCodeImage.height;
        context.drawImage(qrCodeImage, 0, 0);

        const a = document.createElement('a');
        a.href = canvas.toDataURL('image/png');
        a.download = 'qrcode.jpg';
        a.click();
    });
</script>
