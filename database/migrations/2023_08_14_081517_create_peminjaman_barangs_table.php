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
        Schema::create('peminjaman_barangs', function (Blueprint $table) {
            $table->id();
            $table->string('NamaPeminjam');
            $table->string('Status');
            $table->string('KodeBarang');
            $table->string('NamaBarang');
            $table->string('Merek');
            $table->string('Kategori');
            $table->string('KondisiBarang');
            $table->string('SumberDana');
            $table->integer('Jumlah');
            $table->string('Unit');
            $table->string('Gedung');
            $table->string('Ruangan');
            $table->string('Lantai');
            $table->integer('Valuasi');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('peminjaman_barangs');
    }
};
