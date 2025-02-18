<?php

namespace App\Models;

use Dom\Entity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttributeValue extends Model
{
    use HasFactory;

    protected $fillable = ['attribute_id', 'entity_id','value'];

    protected $hidden = ['created_at','updated_at','deleted_at'];
    public function attribute(){
        return $this->belongsTo(Attribute::class);
    }

}
