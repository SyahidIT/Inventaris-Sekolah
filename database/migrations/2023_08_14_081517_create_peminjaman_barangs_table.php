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
            $table->integer('user_id');
            $table->string('NamaPeminjam');
            $table->string('StatusPeminjaman');
            $table->string('KodeBarang')->index();
            $table->string('NamaBarang');
            $table->string('Merek');
            $table->string('Kategori');
            $table->string('KondisiBarang');
            $table->string('SumberDana');
            $table->integer('Jumlah');
            $table->string('Unit')->index();
            $table->integer('Status')->default(1);
            $table->timestamps();
        });

        Schema::table('peminjaman_barangs', function (Blueprint $table) {
            $table->foreign('KodeBarang')->references('KodeBarang')->on('distribusis')->onDelete('RESTRICT')->onUpdate('NO ACTION');
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
