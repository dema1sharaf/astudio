<?php

namespace App\Models;

use Dom\Entity;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AttributeValue extends Model
{
    use HasFactory;
    use softDeletes;

    protected $fillable = ['attribute_id', 'entity_id','value'];

    protected $hidden = ['created_at','updated_at','deleted_at'];

    public function attribute(){
        return $this->belongsTo(Attribute::class);
    }

    public function project(){
        return $this->belongsTo(Project::class,'entity_id');
    }

}
