<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Attribute extends Model
{
    use HasFactory;
    use softDeletes;

    protected $fillable = ['name','type'];

    protected $hidden = ['created_at','updated_at','deleted_at'];

    public function values(){
        return $this->hasMany(AttributeValue::class);
    }


}
