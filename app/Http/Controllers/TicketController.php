<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ticket;
class TicketController extends Controller
{
    public function index()
    {
        $tickets = Ticket::all();
        return response()->json($tickets);
    }
    public function store(Request $request)
    {
        $validated = $request->validate([
            'from' => 'required|string|max:255',
            'to' => 'required|string|max:255',
            'description' => 'string',
            'data' => 'required|date',
            'total_seats' => 'required|integer|min:1',
            'price' => 'required|numeric|min:0',
            'image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'discount' => 'nullable|numeric|min:0|max:100',
            'discounted_price' => 'nullable|numeric|min:0',
            'hour' => 'date_format:H:i',
        ]);

        $ticket = new Ticket();

        $validated['seats_available'] = $validated['total_seats'];
        if ($validated['discount'] > 0) {
            $validated['discounted_price'] = 
            $validated['price'] - ($validated['price'] * ($validated['discount'] / 100));
        }
        $validated['seats_available'] = $validated['total_seats'];
        $ticket = Ticket::create($validated);
        if ($ticket) {
            if ($request->hasFile('image')) {
                $imagePath = $request->file('image')->store('images', 'public');
                $ticket->image = $imagePath;
                $ticket->save();
            }
            return response()->json(['message' => 'Ticket created!'], 200);
        } else {
            return response()->json(['message' => 'Ticket not created!'], 400);
        }
    }
    public function show($id)
    {
        $ticket = Ticket::find($id);
        if ($ticket) {
            return response()->json($ticket);
        } else {
            return response()->json(['message' => 'Ticket not found!'], 404);
        }
    }
    public function update($id,Request $request)
    {
        $validated = $request->validate([
            'from' => 'required|string|max:255',
            'to' => 'required|string|max:255',
            'description' => 'string',
            'data' => 'required|date',
            'total_seats' => 'required|integer|min:1',
            'price' => 'required|numeric|min:0',
            'discount' => 'nullable|numeric|min:0|max:100',
            'discounted_price' => 'nullable|numeric|min:0',
        ]);

        $ticket = Ticket::find($id);
        if ($ticket) {
            $validated['seats_available'] = $validated['total_seats'];
            if ($validated['discount'] > 0) {
                $validated['discounted_price'] = 
                $validated['price'] - ($validated['price'] * ($validated['discount'] / 100));
            }
            $validated['seats_available'] = $validated['total_seats'];
            $ticket->update($validated);
            return response()->json(['message' => 'Ticket updated!'], 200);
        } else {
            return response()->json(['message' => 'Ticket not found!'], 404);
        }
    }
    
    public function storeImage($id, Request $request)
    {
        $request->validate([
            'image' => 'image|mimes:jpeg,png,jpg|max:2048',
        ]);
    
        // Encontra o ticket pelo id
        $ticket = Ticket::find($id); 
    
        if ($ticket) {
            // Armazena a nova imagem no diretório 'images' na pasta 'public'
            $imagePath = $request->file('image')->store('images', 'public');
            
            // Atualiza o caminho da imagem no ticket
            $ticket->image = $imagePath;
            $ticket->save();
    
            return response()->json(['message' => 'Image updated!'], 200);
        } else {
            return response()->json(['message' => 'Ticket not found!'], 404);
        }
    }
}
