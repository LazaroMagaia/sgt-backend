<?php
namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        dd('register');
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'string|email|max:255|unique:users',
            'phone' => 'required|max:255',
            'password' => 'required|string|min:8',
            'role'   => 'required|string',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'role' => $request->role,
            'password' => Hash::make($request->password),
        ]);

        return response()->json(['message' => 'User registered successfully.'], 201);
    }

    public function login(Request $request)
    {
        
        // Validação dos campos de entrada
        $request->validate([
            'identifier' => 'required|string', // Pode ser email ou número de telefone
            'password' => 'required|string',
        ]);

        // Verifica se o identificador é um email ou um número de telefone
        $identifier = $request->input('identifier');
        
        // Usa regex para verificar se é um email
        if (filter_var($identifier, FILTER_VALIDATE_EMAIL)) {
            // Se for email, busca o usuário pelo email
            $user = User::where('email', $identifier)->first();
        } else {
            // Caso contrário, busca o usuário pelo número de telefone
            $user = User::where('phone', $identifier)->first();
        }
        
        // Verifica se o usuário existe e se a senha está correta
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['response' =>'As credenciais fornecidas estão incorretas.'], 403);
        }
        // Gera o token de API para o usuário autenticado
        $token = $user->createToken('api-token')->plainTextToken;

        return response()->json(['user'=>$user,'access_token' => $token], 200);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logged out'], 200);
    }
}
