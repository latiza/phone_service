<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PhoneController extends Controller
{
    public function index()
    {
        $brands = Brand::all();

        return view('phones.index', compact('brands'));
    }
}
