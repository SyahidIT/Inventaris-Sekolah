<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Ruangan extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function Ruangan(): BelongsTo
    {
        return $this->belongsTo(Distribusi::class);
    }
}
