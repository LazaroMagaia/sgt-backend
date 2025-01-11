<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ordens extends Model
{
    // compra_id == order_id 
    use HasFactory;
    protected $fillable = ['user_id', 'total', 'status','payment_type'];
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function tickets()
    {
        return $this->belongsToMany(Ticket::class, 'compras_bilhetes', 'compra_id', 'bilhete_id')
        ->withPivot('quantidade', 'preco_unitario', 'subtotal');
    }
}
