<?php

use App\Http\Controllers\AttributeController;
use App\Http\Controllers\ProjectController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::middleware('auth:api')->group(function () {
    // Attribute Routes
    Route::get('attributes', [AttributeController::class, 'index']);
    Route::post('attributes', [AttributeController::class, 'store']);
    Route::put('attributes/{id}', [AttributeController::class, 'update']);

    // Project Routes
    Route::get('projects', [ProjectController::class, 'index']);
    Route::post('projects', [ProjectController::class, 'store']);
    Route::put('projects/{id}', [ProjectController::class, 'update']);
    Route::get('projects/filter', [ProjectController::class, 'filterByAttributes']);
});
