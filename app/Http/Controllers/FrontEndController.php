<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FrontEndController extends Controller
{
    public function buttonsColors()
    {
        $colors = [
            'default' => '#4b5563',
            'primary' => '#007bff',
            'dark' => '#1f2937',
            'success' => '#10b981',
            'danger' => '#ef4444',
            'hoverDefault' => '#3b4d6a',
            'hoverPrimary' => '#0056b3',
            'hoverDark' => '#161e2e',
            'hoverSuccess' => '#059669',
            'hoverDanger' => '#dc2626',
        ];
        
        return response()->json(['colors' => $colors]);        
    }
}
