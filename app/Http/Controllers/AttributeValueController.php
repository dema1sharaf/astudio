<?php

namespace App\Http\Controllers;

use App\Models\AttributeValue;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AttributeValueController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        return response()->json(AttributeValue::with(['attribute','project'])->get(), 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        //
        try {
            $validator = Validator::make($request->all(), [
                'value' => 'required|string|max:255',
                'entity_id' => 'required|exists:projects,id,deleted_at,NULL',
                'attribute_id' => 'required|exists:attributes,id,deleted_at,NULL',
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $timesheet = AttributeValue::create([
                'entity_id' => $request->entity_id,
                'attribute_id' => $request->attribute_id,
                'value' => $request->value,
            ]);

            return response()->json([
                'message' => 'AttributeValue created successfully',
                'attributeValue' => $timesheet->load(['attribute','project'])
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
    public function show(AttributeValue $attributeValue): JsonResponse
    {
        return response()->json($attributeValue->load(['attribute','project']), 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, AttributeValue $attributeValue): JsonResponse
    {
        //
        try{
            $validator = Validator::make($request->all(), [
                'value' => 'sometimes|string|max:255',
                'entity_id' => 'sometimes|exists:projects,id,deleted_at,NULL',
                'attribute_id' => 'sometimes|exists:attributes,id,deleted_at,NULL',
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $attributeValue->update($request->only(['entity_id','attribute_id', 'value']));

            return response()->json(['message' => 'AttributeValue updated successfully', 'timesheet' => $attributeValue->load(['attribute','project'])], 200);
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
    public function destroy(AttributeValue $attributeValue): JsonResponse
    {
        //
        $attributeValue->delete();
        return response()->json(['message' => 'AttributeValue deleted successfully'], 200);
    }
}
