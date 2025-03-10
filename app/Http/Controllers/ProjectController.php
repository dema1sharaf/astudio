<?php

namespace App\Http\Controllers;

use App\Models\AttributeValue;
use App\Models\Project;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ProjectController extends Controller
{
    //

    public function index(Request $request): JsonResponse
    {
        try {
//            $projects = Project::with('attributes.attribute')->get();
//            return response()->json($projects, 200);

            $query = Project::query()->with('attributes.attribute');

            // Apply filters from request
            //exp: http://127.0.0.1:8000/api/projects?filters[name]=LIKE:%Dima%
            if ($request->has('filters')) {
                foreach ($request->filters as $key => $value) {
                    $this->applyFilter($query, $key, $value);
                }
            }

            return response()->json($query->get(), 200);

        }catch (\Exception $e) {
                return response()->json(['error' => 'Internal Server Error', 'details' => $e->getMessage()], 500);
        }
    }

    public function store(Request $request): JsonResponse
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


    public function update(Request $request, Project $project): JsonResponse
    {
        try {

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

        }
        catch (\Exception $e) {
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

    public function filterByAttributes(Request $request): JsonResponse
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

    public function show(Project $project): JsonResponse
    {
        $project->load('attributes.attribute');

        return response()->json($project, 200);
    }


    public function destroy(Project $project): JsonResponse
    {
        $project->attributes()->delete();
        $project->delete();

        return response()->json(['message' => 'Project deleted successfully'], 200);
    }

    private function applyFilter($query, $key, $value)
    {
        $operator = '=';
        $searchValue = $value;

        // Check if value contains an operator
        if (preg_match('/^(>=|<=|>|<|LIKE):(.+)$/', $value, $matches)) {
            $operator = $matches[1]; // Extract operator
            $searchValue = $matches[2]; // Extract actual value
        }

        // Check if filtering is on a standard column
        if (in_array($key, ['name', 'status'])) {
            $query->where($key, $operator, $searchValue);
        }

        // Check if filtering is on a dynamic EAV attribute
        else {
            $query->whereHas('attributes', function ($subQuery) use ($key, $operator, $searchValue) {
                $subQuery->whereHas('attribute', function ($attrQuery) use ($key) {
                    $attrQuery->where('name', $key);
                })->where('value', $operator, $searchValue);
            });
        }
    }


}
