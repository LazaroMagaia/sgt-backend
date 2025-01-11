<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id','identity_card','gender','birth','phone1','phone2','address','emergency_contact_name',
        'emergency_contact'
    ];
}
