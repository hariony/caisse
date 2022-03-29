<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('/login');
});

/*Route::get('/dashboard/index', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');*/

Route::get('/dashboard', 'App\Http\Controllers\DashboardController@index')->middleware(['auth'])->name('dashboard');

Route::get('/dashboard/entry', 'App\Http\Controllers\DashboardController@entry')->name('dashboard.entry')->middleware(['auth']);

Route::post('/dashboard/addnewline', 'App\Http\Controllers\DashboardController@ajax_addnewline')->middleware(['auth']);

Route::post('/dashboard/store', 'App\Http\Controllers\DashboardController@store')->name('dashboard.store')->middleware(['auth']);

Route::post('/dashboard/update', 'App\Http\Controllers\DashboardController@update')->name('dashboard.update')->middleware(['auth']);

Route::post('/dashboard/deleteoperation', 'App\Http\Controllers\DashboardController@deleteoperation')->name('dashboard.deleteoperation')->middleware(['auth']);

Route::get('/dashboard/edit/{operation_id}', 'App\Http\Controllers\DashboardController@edit')->name('dashboard.edit')->middleware(['auth']);

Route::get('/dashboard/operationtype', 'App\Http\Controllers\DashboardController@operationtype')->name('dashboard.operationtype')->middleware(['auth']);

Route::any('/dashboard/typeoperation/add', 'App\Http\Controllers\DashboardController@addtypeoperation')->name('dashboard.typeoperation.add')->middleware(['auth']);

Route::any('/dashboard/edittypeoperation/{typeoperation_id}', 'App\Http\Controllers\DashboardController@edittypeoperation')->name('dashboard.typeoperation.edit')->middleware(['auth']);

Route::post('/dashboard/deletetypeoperation', 'App\Http\Controllers\DashboardController@deletetypeoperation')->name('dashboard.deletetypeoperation')->middleware(['auth']);


require __DIR__.'/auth.php';
