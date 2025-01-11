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
        Schema::create('compras_bilhetes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('compra_id')->constrained('ordens')->onDelete('cascade');
            $table->foreignId('bilhete_id')->constrained('tickets')->onDelete('cascade');
            $table->integer('quantidade'); 
            $table->decimal('preco_unitario', 10, 2); 
            $table->decimal('subtotal', 10, 2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('compras_bilhetes');
    }
};
