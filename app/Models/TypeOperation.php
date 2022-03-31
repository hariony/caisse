<?php

namespace App\Models;

use App\Models\Operation;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TypeOperation extends Model
{
    use HasFactory;

    public function operation()
    {
        return $this->hasMany(Operation::class);
    }
}