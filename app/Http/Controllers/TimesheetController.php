<?php

namespace App\Http\Controllers;

use App\Models\Timesheet;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Throwable;

class TimesheetController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        //
        return response()->json(Timesheet::with(['user', 'project'])->get(), 200);

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        //
        try {
            $validator = Validator::make($request->all(), [
                'task_name' => 'required|string|max:255',
                'date' => 'required|date',
                'hours' => 'required|numeric|min:0.5|max:24',
                'user_id' => 'required|exists:users,id',
                'project_id' => 'required|exists:projects,id,deleted_at,NULL',
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $timesheet = Timesheet::create([
                'task_name' => $request->task_name,
                'date' => $request->date,
                'hours' => $request->hours,
                'user_id' => $request->user_id,
                'project_id' => $request->project_id,
            ]);

            return response()->json([
                'message' => 'Timesheet created successfully',
                'timesheet' => $timesheet->load(['user', 'project'])
            ], 201);
        }
        catch (\Exception $e) {
            return response()->json([
                'error' => 'Internal Server Error',
                'details' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Timesheet $timesheet): JsonResponse
    {
        return response()->json($timesheet->load(['user', 'project']), 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Timesheet $timesheet): JsonResponse
    {
        //
        try{
            $validator = Validator::make($request->all(), [
                'task_name' => 'sometimes|string|max:255',
                'date' => 'sometimes|date',
                'hours' => 'sometimes|numeric|min:0.5|max:24',
                'user_id' => 'sometimes|exists:users,id',
                'project_id' => 'sometimes|exists:projects,id,deleted_at,NULL',
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $timesheet->update($request->only(['task_name','date', 'hours', 'user_id', 'project_id']));

            return response()->json(['message' => 'Timesheet updated successfully', 'timesheet' => $timesheet->load(['user', 'project'])], 200);
        }
        catch (\Exception $e) {
            return response()->json([
                'error' => 'Internal Server Error',
                'details' => $e->getMessage()
            ], 500);
        }
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Timesheet $timesheet): JsonResponse
    {
        //
        $timesheet->delete();
        return response()->json(['message' => 'Timesheet deleted successfully'], 200);
    }


}
