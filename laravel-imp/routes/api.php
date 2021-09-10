<?php

use App\Http\Controllers\ProductApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('product')->group(function () {
    Route::get('', [ProductApiController::class, 'index'])->name('product.index');
    Route::post('', [ProductApiController::class, 'store'])->name('product.store');
    Route::get('{product}', [ProductApiController::class, 'show'])->name('product.show');
    Route::put('{product}', [ProductApiController::class, 'update'])->name('product.update');
    Route::delete('{product}', [ProductApiController::class, 'destroy'])->name('product.destroy');
});
