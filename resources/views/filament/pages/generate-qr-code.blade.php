<div>
    <x-filament-panels::page>
        <head>
            <!-- ... (head section remains the same) ... -->
        </head>
        <body>
            <div class="container">
                <div class="row mt-5">
                    <form class="form-inline" wire:submit.prevent="store">
                        @csrf
                        <div class="form-group mb-2">
                            <input type="text" class="form-control" wire:model="kodeBarang" placeholder="KodeBarang">
                        </div>
                        <button type="submit" class="btn btn-primary ml-1 mb-2">Generate</button>
                    </form>
                    <br>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">KodeBarang</th>
                                <th scope="col">QR code</th>
                            </tr>
                        </thead>
                        <tbody>
                           
                        </tbody>
                    </table>
                </div>
            </div>
        </body>
    </x-filament-panels::page>
</div>
