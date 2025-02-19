<?php

use App\Http\Controllers\AttributeController;
use App\Http\Controllers\AttributeValueController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TimesheetController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Laravel\Passport\Http\Controllers\AccessTokenController;

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


Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);


Route::middleware('auth:api')->group(function () {
    // Attribute Routes *** these routes already included with apiResource For Project Model ***
//    Route::get('attributes', [AttributeController::class, 'index']);
//    Route::post('attributes', [AttributeController::class, 'store']);
//    Route::put('attributes/{id}', [AttributeController::class, 'update']);

    // Project Routes - *** these routes already included with apiResource For Project Model ***
//    Route::get('projects', [ProjectController::class, 'index']);
//    Route::post('projects', [ProjectController::class, 'store']);
//    Route::put('projects/{id}', [ProjectController::class, 'update']);
    Route::get('projects/filter', [ProjectController::class, 'filterByAttributes']);

    Route::post('logout', [AuthController::class, 'logout']);

    //CRUD Models
    Route::apiResource('users', UserController::class);
    Route::apiResource('projects', ProjectController::class);
    Route::apiResource('timesheets', TimesheetController::class);
    Route::apiResource('attributes', AttributeController::class);
    Route::apiResource('projects', ProjectController::class);
    Route::apiResource('attribute-values', AttributeValueController::class);


});
