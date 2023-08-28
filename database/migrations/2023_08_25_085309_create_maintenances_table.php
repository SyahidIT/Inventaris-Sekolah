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
        Schema::create('maintenances', function (Blueprint $table) {
            $table->id();
            $table->string('KodeBarang')->unique(); // Menggunakan unique() sebelum foreign key
            $table->string('NamaBarang');
            $table->string('MaintenanceSd')->nullable();
            $table->string('MaintenanceSmpBd')->nullable();
            $table->string('MaintenanceSmpFd')->nullable();
            $table->string('MaintenanceSma')->nullable();
            $table->timestamps();

            // Definisi foreign key setelah pembuatan kolom
            $table->foreign('KodeBarang')->references('KodeBarang')->on('distribusis')->onDelete('RESTRICT')->onUpdate('NO ACTION');;
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('maintenances', function (Blueprint $table) {
            $table->dropForeign(['KodeBarang']);
        });

        Schema::dropIfExists('maintenances');
    }
};
