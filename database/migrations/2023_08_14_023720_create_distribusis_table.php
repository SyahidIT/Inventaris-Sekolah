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
        Schema::create('distribusis', function (Blueprint $table) {
            $table->id();
            $table->string('KodeBarang')->unique()->index();
            $table->string('NamaBarang');
            $table->string('Merek');
            $table->string('Kategori');
            $table->string('KondisiBarang');
            $table->string('SumberDana');
            $table->integer('Jumlah');
            $table->integer('Stok');
            $table->string('Unit');
            $table->string('Gedung');
            $table->string('Ruangan');
            $table->string('Lantai');
            $table->integer('Valuasi');
            $table->timestamps();
        });

        Schema::table('distribusis', function (Blueprint $table) {
            $table->foreign('KodeBarang')->references('KodeBarang')->on('gudangs')->onDelete('RESTRICT')->onUpdate('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('distribusis');
    }
};
