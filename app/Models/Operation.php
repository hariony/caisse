<?php

namespace App\Models;

use App\Models\TypeOperation;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Operation extends Model
{
    use HasFactory;

    protected $casts = [
        'date' => 'date',
        'datas' => 'array'
    ];


    public function typeoperation()
    {
        return $this->belongsTo(TypeOperation::class);
    }

}
