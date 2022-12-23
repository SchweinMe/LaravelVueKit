<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Route;


Route::get('/', function () {
    return view('welcome');
});


Route::prefix('backoffice')->group(function () {
    Route::get('/', [Controller::class, 'backOfficeIndex']);
    Route::get('/{any}', [Controller::class, 'backOfficeIndex'])->where('any', '.*');
});