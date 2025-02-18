<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Timesheet extends Model
{
    use HasFactory;

    protected $fillable = ['task_name','date','hours','user_id','project_id'];

    function user(){
        return $this->belongsTo(User::class);
    }

    function project(){
        return $this->belongsTo(Project::class);
    }
}
