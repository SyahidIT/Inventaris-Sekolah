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
        Schema::create('gudangs', function (Blueprint $table) {
            $table->id();
            $table->string('KodeBarang')->unique()->index();
            $table->string('NamaBarang');
            $table->string('Merek');
            $table->string('Kategori');
            $table->integer('Jumlah');
            $table->integer('Stok');
            $table->integer('Valuasi');
            $table->timestamps();
        });

        Schema::table('gudangs', function (Blueprint $table) {
            $table->foreign('KodeBarang')->references('KodeBarang')->on('form_pembelians')->onDelete('RESTRICT')->onUpdate('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('gudangs');
    }
};
