<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Distribusi extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function gudangs()
    {
        return $this->belongsTo(Gudang::class, 'KodeBarang');
    }
}


Distribusi::chunk(200, function($distribusis) {
    foreach ($distribusis as $distribusi) {
        $gudangs = $distribusi->gudangs;
        // do some processing...
    }
});