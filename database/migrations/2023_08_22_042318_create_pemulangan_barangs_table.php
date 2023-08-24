<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('pemulangan_barangs', function (Blueprint $table) {
            $table->id();
            $table->string('NamaPeminjam');
            $table->string('KodeBarang')->index();
            $table->string('Unit');
            $table->string('Status')->default('0');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pemulangan_barangs');
    }
};
