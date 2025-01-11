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
        Schema::table('ordens', function (Blueprint $table) {
            $table->string('payment_type')->after("status"); // Adiciona o campo
        });
    }
    
    public function down(): void
    {
        Schema::table('ordens', function (Blueprint $table) {
            $table->dropColumn('payment_type'); // Remove o campo
        });
    }
    
};
