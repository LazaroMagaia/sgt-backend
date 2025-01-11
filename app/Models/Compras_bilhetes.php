<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Compras_bilhetes extends Model
{
    use HasFactory;
    protected $fillable = ['compra_id', 'bilhete_id', 'quantidade', 'preco_unitario', 'subtotal'];
    
    public function ordens()
    {
        return $this->belongsTo(Ordens::class, 'compra_id');
    }
    public function tickets()
    {
        return $this->belongsTo(Ticket::class, 'bilhete_id');
    }

}
