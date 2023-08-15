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
        Schema::create('form_pembelians', function (Blueprint $table) {
            $table->id();
            $table->string('KodeBarang');
            $table->string('NamaBarang');
            $table->string('Merek');
            $table->string('Kategori');
            $table->integer('Jumlah');
            $table->integer('Valuasi');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('form_pembelians');
    }
};
