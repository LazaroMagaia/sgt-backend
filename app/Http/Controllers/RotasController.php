<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Routes;
use Illuminate\Validation\Rule;
class RotasController extends Controller
{
    public function index()
    {
        $routes = Routes::all();
        return response()->json($routes);
    }
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:routes',
            'description' => 'nullable|string',
        ],[
            'name.unique' => 'Este e-mail já está cadastrado.',
        ]);
        $route = Routes::create([
            'name' => $request->name,
            'description' => $request->description,
        ]);
        return response()->json($route);
    }
    public function update($id,Request $request)
    {
        $request->validate([
            'name' => ['required', 'string', Rule::unique('users')->ignore($id)],
            'description' => 'nullable|string',
        ],[
            'name.unique' => 'Este e-mail já está cadastrado.',
        ]);
        $route = Routes::find($id);
        $route->name = $request->name;
        $route->description = $request->description;
        $route->save();
        return response()->json($route);
    }
    public function destroy($id)
    {
        $route = Routes::find($id);
        $route->delete();
        return response()->json(['message' => 'Rota deletada com sucesso']);
    }   
}
