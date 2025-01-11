<?php 
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\
{AuthController,EmployeeController,FrontEndController,ClientController,RotasController,
    TicketController,OrdemController};

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Rotas protegidas por autenticação Sanctum
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    //EMPLOYEE
    Route::post('/employee', [EmployeeController::class, 'store'])->name('employee.store');
    Route::get('/employee', [EmployeeController::class, 'index'])->name('employee.index');
    Route::get('/employee/driver', [EmployeeController::class, 'driver_index'])->name('employee.driver_index');
    Route::get('/employee/{id}', [EmployeeController::class, 'show'])->name('employee.show');
    Route::put('/employee/{id}', [EmployeeController::class, 'update'])->name('employee.update');
    Route::delete('/employee/{id}', [EmployeeController::class, 'destroy'])->name('employee.destroy');
    //CLIENT
    Route::post('/client', [ClientController::class, 'store'])->name('client.store');
    Route::get('/client', [ClientController::class, 'index'])->name('client.index');
    Route::get('/client/{id}', [ClientController::class, 'show'])->name('client.show');
    Route::put('/client/{id}', [ClientController::class, 'update'])->name('client.update');
    Route::delete('/client/{id}', [ClientController::class, 'destroy'])->name('client.destroy');
    //VEHICLE TEMOS DE ADICIONAR VEICULOS E OS VINCULAR AOS MOTORISTAS


    //ROTAS
    Route::post('/routes', [RotasController::class, 'store'])->name('routes.store');
    Route::get('/routes/{id}', [RotasController::class, 'show'])->name('routes.show');
    Route::put('/routes/{id}', [RotasController::class, 'update'])->name('routes.update');
    Route::delete('/routes/{id}', [RotasController::class, 'destroy'])->name('routes.destroy');

    //TICKETS
    Route::post('/tickets', [TicketController::class, 'store'])->name('tickets.store');
    Route::post('/tickets/image/{id}', [TicketController::class, 'storeImage'])->name('tickets.storeImage');
    Route::put('/tickets/{id}', [TicketController::class, 'update'])->name('tickets.update');
    Route::delete('/tickets/{id}', [TicketController::class, 'destroy'])->name('tickets.destroy');
});

//BUTTONS COLORS
Route::get('/settings/buttons-colors', [FrontEndController::class, 'buttonsColors']);
//ROTAS
Route::get('/routes', [RotasController::class, 'index'])->name('routes.index');
//TICKETS
Route::get('/tickets', [TicketController::class, 'index'])->name('tickets.index');
Route::get('/tickets/{id}', [TicketController::class, 'show'])->name('tickets.show');
//ORDENS
/*Route::get('/ordens', [OrdemController::class, 'index'])->name('ordens.index');
Route::post('/ordens/store', [OrdemController::class, 'store'])->name('ordens.store');
Route::get('/ordens/{id}', [OrdemController::class, 'show'])->name('ordens.show');
Route::put('/ordens/{id}', [OrdemController::class, 'update'])->name('ordens.update');
*/
Route::apiResource('ordens', OrdemController::class);
Route::post('ordens/{id}/downloadPDF', [OrdemController::class, 'downloadPDF'])
->name('ordens.downloadPDF');
