<?php

namespace Database\Seeders;

use App\Models\Timesheet;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TimesheetSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        Timesheet::create([
            'user_id' => 1,
            'project_id' => 1,
            'task_name' => 'Design Database',
            'date' => now(),
            'hours' => 6,
        ]);
    }
}
