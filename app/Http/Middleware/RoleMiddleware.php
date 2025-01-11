<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;
class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, ...$roles): Response
    {
        // Verifica se o usuário está autenticado via Sanctum
        if (!Auth::guard('sanctum')->check()) {
            // Usuário não autenticado
            return response()->json(['message' => 'Não autenticado.'], 401);
        }

        $user = Auth::guard('sanctum')->user();

        // Verifica se o papel do usuário está no array de papéis permitidos
        if (!in_array($user->role, $roles)) {
            return response()->json(['message' => 'Acesso negado.'], 403);
        }

        return $next($request);
    }
}
