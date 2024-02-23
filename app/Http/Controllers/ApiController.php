<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ApiController extends Controller
{
    public function getBrands()
    {
        $brands = Brand::all();
        return response()->json($brands);
    }

    public function getInsertedBrands()
    {
        $insertedBrands = Brand::where('created_at', '>=', now()->subDay())->get();
        return response()->json($insertedBrands);
    }
}
