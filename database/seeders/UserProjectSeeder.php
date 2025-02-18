<?php

namespace Database\Seeders;

use App\Models\Project;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserProjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        $users = User::all();
        $projects = Project::all();
        // Assign each user to random projects
        foreach ($users as $user) {
            $randomProjects = $projects->random(rand(1, 2)); // Each user gets 1 to 3 projects
            foreach ($randomProjects as $project) {
                DB::table('user_project')->insert([
                    'user_id' => $user->id,
                    'project_id' => $project->id,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}
