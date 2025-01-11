<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;
    protected $fillable = [
        'from','to','description','image','data',
        'total_seats','seats_available','price',
        'discount','discounted_price',
    ];
    public function orders()
    {
        return $this->belongsToMany(Ordens::class, 'compras_bilhetes', 'bilhete_id', 'compra_id')
        ->withPivot('quantidade', 'preco_unitario', 'subtotal');
    }
}