<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Project extends Model
{
    use HasFactory;
    use softDeletes;

    protected $fillable = ['name','status'];

    protected $hidden = ['created_at','updated_at','deleted_at'];
    public function users(){
        return $this->belongsToMany(User::class);
    }

    public function timesheets(){
        return $this->hasMany(Timesheet::class);
    }

    public function attributes()
    {
        return $this->hasMany(AttributeValue::class, 'entity_id');
    }
}
