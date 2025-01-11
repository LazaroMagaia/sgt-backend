<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Str;
use App\Mail\UserCreated;
use Illuminate\Support\Facades\Mail;
use Exception;
use Illuminate\Validation\Rule;

class EmployeeController extends Controller
{
    public function index()
    {
        $employeesAndAdmins = User::where('role', 'admin')
        ->orWhere('role', 'secretary')
        ->with('employee')
        ->get();
        return response()->json($employeesAndAdmins);
    }
    public function driver_index()
    {
        $employeesAndAdmins = User::where('role', 'driver')
        ->with('employee')
        ->get();
        return response()->json($employeesAndAdmins);
    }
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email' => 'email|unique:users',
        ],[
            'email.email' => 'Por favor, insira um e-mail válido.',
            'email.unique' => 'Este e-mail já está cadastrado.',
        ]);
        $phone = User::where('phone', $request->phone1)->first();
        if($phone)
        {
            return response()->json(['message' => 'Telefone já cadastrado'], 400);
        }

        $password = str_replace(' ', '', $request->phone1);
        $user = User::create([
            'email' => $request->email,
            'name' => $request->name,
            'password' => bcrypt($password),
            'role' => $request->role,
            'phone' => $request->phone1,
        ]);
        $user->employee()->create([
            'birth' => $request->birth,
            'gender' => $request->gender,
            'phone1' => $request->phone1,
            'phone2' => $request->phone2,
            'address' => $request->address,
            'emergency_contact_name' => $request->emergency_contact_name,
            'emergency_contact' => $request->emergency_contact,
        ]);
        if(!$user)
        {
            return response()->json(['message' => 'Erro ao cadastrar usuário'], 400);
        }else
        {
           
            try {
                Mail::to($user->email)->send(new UserCreated($user, $password));
                return response()->json(['message' => 'Usuário cadastrado com sucesso'], 200);
            } catch (Exception $e) {
                return response()->json(['message' => 'Falha ao enviar e-mail.', 'error' => $e->getMessage()]);
            }
            return response()->json(['message' => 'Usuário cadastrado com sucesso'], 200);
        }
    }
    public function update($id,Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email' => [
                'required',
                'email',
                Rule::unique('users')->ignore($id),
            ],
            'phone1' => [
            'required',
            'string',
            Rule::unique('users', 'phone')->ignore($id),
            ],

        ],[
            'email.email' => 'Por favor, insira um e-mail válido.',
            'email.unique' => 'Este e-mail já está cadastrado.',
        ]);
        $user = User::find($id);
        if(!$user)
        {
            return response()->json(['message' => 'Usuário não encontrado'], 404);
        }
        $user->update([
            'name' => $request->name,
            'email' => $request->email,
            'role' => $request->role,
            'phone' => $request->phone1,
        ]);
        $user->employee()->update([
           'birth' => $request->birth,
            'gender' => $request->gender,
            'phone1' => $request->phone1,
            'phone2' => $request->phone2,
            'address' => $request->address,
            'emergency_contact_name' => $request->emergency_contact_name,
            'emergency_contact' => $request->emergency_contact,
        ]);
    }
    public function destroy($id)
    {
        $user = User::find($id);
        if(!$user)
        {
            return response()->json(['message' => 'Usuário não encontrado'], 404);
        }
        $user->delete();
        return response()->json(['message' => 'Usuário deletado com sucesso'], 200);
    }
}
