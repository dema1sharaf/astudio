<?php

namespace App\Http\Controllers;

use App\Models\Attribute;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class AttributeController extends Controller
{
    //

    public function index(): JsonResponse
    {
        try {
            return response()->json(Attribute::all(), 200);
        }catch (\Exception $e) {
            return response()->json(['error' => 'Internal Server Error', 'details' => $e->getMessage()], 500);
        }
    }

    public function store(Request $request): JsonResponse
    {

        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|unique:attributes,name|max:255',
                'type' => ['required', Rule::in(['text', 'date', 'number', 'select'])],
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $attribute = Attribute::create($validator->validated());

            return response()->json([
                'message' => 'Attribute created successfully',
                'attribute' => $attribute
            ], 201);

        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Internal Server Error',
                'details' => $e->getMessage()
            ], 500);
        }

    }

    public function update(Request $request, Attribute $attribute): JsonResponse
    {
        try {

            // Validate request data
            $validator = Validator::make($request->all(), [
                'name' => 'sometimes|string|unique:attributes,name,' . $attribute->id . '|max:255',
                'type' => ['sometimes', Rule::in(['text', 'date', 'number', 'select'])],
            ]);

            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $attribute->update($request->only(['name', 'type']));

            return response()->json([
                'message' => 'Attribute updated successfully',
                'attribute' => $attribute
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Internal Server Error',
                'details' => $e->getMessage()
            ], 500);
        }
    }

    public function show(Attribute $attribute): JsonResponse
    {
        return response()->json($attribute, 200);
    }


    public function destroy(Attribute $attribute): JsonResponse
    {
        $attribute->delete();

        return response()->json(['message' => 'Attribute deleted successfully'], 200);
    }
}
