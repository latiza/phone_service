<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PhoneController;
use App\Http\Controllers\BrandController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
// routes/web.php

// routes/web.php

use App\Http\Controllers\ApiController;

Route::get('/api/brands', [ApiController::class, 'getBrands']);
//Route::get('/api/inserted-brands', [ApiController::class, 'getInsertedBrands']);

// Az új útvonalak a kívánt Controller műveletekhez
Route::get('/brand-list', [ApiController::class, 'getBrands'])->name('brand.list');
Route::get('/recent-brands', [ApiController::class, 'getInsertedBrands'])->name('brand.recent');


Route::match(['get', 'head'], '/', function () {
    return view('welcome');
});

// routes/web.php

Route::get('/phones', [PhoneController::class, 'index'])->name('phones.index');


Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
