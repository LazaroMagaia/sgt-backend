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
        Schema::create('tickets', function (Blueprint $table) {
            $table->id();
            $table->string('from');
            $table->string('to');
            $table->text('description')->nullable();
            $table->string('image')->nullable();
            $table->date('data');
            $table->time('hour')->default('04:30:00');
            $table->integer('total_seats')->default(0);
            $table->integer('seats_available')->default(0);
            $table->decimal('price', 8, 2);
            $table->decimal('discount', 5, 2)->nullable();
            $table->decimal('discounted_price', 8, 2)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tickets');
    }
};
