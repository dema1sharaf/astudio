<?php

namespace App\Http\Controllers;

use App\Models\AttributeValue;
use App\Models\Project;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ProjectController extends Controller
{
    //

    public function index(){
        try {
            $projects = Project::with('attributes.attribute')->get();
            return response()->json($projects, 200);

        }catch (\Exception $e) {
                return response()->json(['error' => 'Internal Server Error', 'details' => $e->getMessage()], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            // Validate input
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:255',
                'status' => 'required|in:active,completed,archived',
                'attributes' => 'nullable|array',
                'attributes.*.id' => 'exists:attributes,id',
                'attributes.*.value' => 'required|string|max:255',
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            // Create project
            $project = Project::create($request->only(['name', 'status']));

            // Assign attributes (if provided)
            if ($request->has('attributes')) {
                foreach ($request->input('attributes') as $attribute) {
                    AttributeValue::create([
                        'attribute_id' => $attribute['id'],
                        'entity_id' => $project->id, // Project ID as entity_id
                        'value' => $attribute['value']
                    ]);
                }
            }

            return response()->json([
                'message' => 'Project created successfully',
                'project' => $project
            ], 201);

        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Internal Server Error',
                'details' => $e->getMessage()
            ], 500);
        }
    }


    public function update(Request $request, $id)
    {
        try {
            // Find project or return 404
            $project = Project::findOrFail($id);

            // Validate input
            $validator = Validator::make($request->all(), [
                'name' => 'sometimes|string|max:255',
                'status' => 'sometimes|in:active,completed,archived',
                'attributes' => 'nullable|array',
                'attributes.*.id' => 'exists:attributes,id',
                'attributes.*.value' => 'required|string|max:255',
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $project->update($request->only(['name', 'status']));

            // Update or assign new attributes
            if ($request->has('attributes')) {
                foreach ($request->input('attributes') as $attribute) {
                    AttributeValue::updateOrCreate(
                        ['attribute_id' => $attribute['id'], 'entity_id' => $project->id],
                        ['value' => $attribute['value']]
                    );
                }
            }

            return response()->json([
                'message' => 'Project updated successfully',
                'project' => $project
            ], 200);

        } catch (ModelNotFoundException $e) {
            return response()->json([
                'error' => 'Project not found',
                'details' => $e->getMessage()
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Internal Server Error',
                'details' => $e->getMessage()
            ], 500);
        }
    }


    /**
     * Filter projects by dynamic attributes.
     *
     * GET /api/projects/filter?filters[department]=IT&filters[start_date]=2025-06-01
     */

    public function filterByAttributes(Request $request)
    {
        try {
            // Validate that filters parameter is provided
            $validator = Validator::make($request->all(), [
                'filters' => 'required|array',
                'filters.*' => 'string|max:255'
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $query = Project::query()->with('attributes.attribute');

            // Loop through filters and apply conditions
            foreach ($request->filters as $attributeName => $attributeValue) {
                $query->whereHas('attributes', function ($q) use ($attributeName, $attributeValue) {
                    $q->whereHas('attribute', function ($subQuery) use ($attributeName) {
                        $subQuery->where('name', $attributeName);
                    })->where('value', $attributeValue);
                });
            }

            $projects = $query->get();

            return response()->json([
                'message' => count($projects) > 0 ? 'Projects found' : 'No projects match the given criteria',
                'projects' => $projects
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Internal Server Error',
                'details' => $e->getMessage()
            ], 500);
        }
    }


}
