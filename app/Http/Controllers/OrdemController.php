<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Compras_bilhetes;
use App\Models\Ordens;
use App\Models\Ticket;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf as PDF;
use Illuminate\Support\Facades\Storage;
class OrdemController extends Controller
{
    public function index()
    {
        $ordens = Ordens::with('tickets')->get();
        return response()->json($ordens);
    }

    public function store(Request $request)
    {   
        // Validação dos dados da requisição
        $request->validate([
            'id_user' => 'required|exists:users,id',
            'bilhetes' => 'required|array',
            'bilhetes.*.bilhete_id' => 'required|exists:tickets,id',
            'bilhetes.*.quantidade' => 'required|integer|min:1',
            'payment_type' => 'required|string|in:MPESA,Deposito_Bancario,Transferencia_Movel,Cartao', 
            // Validação do tipo de pagamento sem acentuação e com underscore
        ]);
        
        $total = 0;
        
        // Criação da ordem
        $ordem = Ordens::create([
            'user_id' => $request->id_user,
            'total' => 0, // Será atualizado depois
            'status' => 'pendente', // Inicialmente 'pendente'
            'payment_type' => $request->payment_type, // Salvando o tipo de pagamento
        ]);
    
        // Processamento dos bilhetes
        foreach ($request->bilhetes as $bilhete) {
            $preco = Ticket::find($bilhete['bilhete_id'])->price;
            $subtotal = $preco * $bilhete['quantidade'];
            $total += $subtotal;
    
            Compras_bilhetes::create([
                'compra_id' => $ordem->id,
                'bilhete_id' => $bilhete['bilhete_id'],
                'quantidade' => $bilhete['quantidade'],
                'preco_unitario' => $preco,
                'subtotal' => $subtotal,
            ]);
        }
    
        // Atualizando o total da ordem
        $ordem->update(['total' => $total]);
    
        // Verificação do tipo de pagamento com if
        if ($request->payment_type == 'MPESA') {
            // Se o método for MPESA, o status da ordem é atualizado para 'pago'
            $ordem->update(['status' => 'pago']);
        } elseif ($request->payment_type == 'Cartao') {
            // Se o método for Cartão, o status da ordem é atualizado para 'pago'
            $ordem->update(['status' => 'pago']);
        } elseif ($request->payment_type == 'Deposito_Bancario') {
            // Se o método for Depósito Bancário, o status permanece 'pendente' (sem alteração)
        } elseif ($request->payment_type == 'Transferencia_Movel') {
            // Se o método for Transferência Móvel, o status permanece 'pendente' (sem alteração)
        }
        $this->gerarPdf($ordem);
        // Retornar resposta com os dados da ordem
        return response()->json($ordem, 200);
    }
    
    public function gerarPdf(Ordens $order)
    {
        // Obter os dados da ordem
        $tickets = $order->tickets; // Relacionamento com os bilhetes
        $total = $order->total;
        $paymentType = $order->payment_type;
        $orderId = $order->id;
        $user = User::find($order->user_id);
        $status = $order->status;
        $createdAt = $order->created_at;
        
        // Passar o nome do usuário para a view
        $userName = $user->name; // Obtendo o nome do usuário
        
        // Criando o conteúdo HTML para o PDF
        $html = view('pdf.order', compact('tickets', 'total', 'paymentType', 'orderId', 
        'status', 'createdAt', 'userName'))->render();
        
        // Gerar o PDF utilizando o DomPDF
        $pdf = PDF::loadHTML($html);
        
        // Caminho para salvar o PDF no storage público
        $filePath = 'pdf/orders/order_' . $orderId . '.pdf';
        
        // Salvar o PDF no storage público
        Storage::disk('public')->put($filePath, $pdf->output());
        
        // Retornar a URL pública do PDF para o frontend
        $pdfUrl = Storage::url($filePath);
        
        return response()->json(['pdf_url' => $pdfUrl]);
    }
    
    public function show($id)
    {
        if (!Ordens::where('id', $id)->exists()) {
            return response()->json(['message' => 'Ordem não encontrada.'], 404);
        }
        $ordem = Ordens::where("id",$id)->with('tickets')->first();
        return response()->json($ordem, 200);
    }

    public function update(Request $request, $id)
    {
        $ordem = Ordens::findOrFail($id);
        $ordem->update($request->only(['status']));
        return response()->json($ordem);
    }

    public function destroy($id)
    {
        $ordem = Ordens::findOrFail($id);
        $ordem->delete();
        return response()->json(['message' => 'Ordem deletada com sucesso.']);
    }

    public function downloadPDF($id)
    {
        // Caminho do arquivo PDF no armazenamento público
        $filePath = 'pdf/orders/order_' . $id . '.pdf';
    
        // Verificar se o arquivo existe
        if (!Storage::disk('public')->exists($filePath)) {
            return response()->json(['error' => 'PDF not found. Please generate it first.'], 404);
        }
    
        // Retornar o PDF para download
        return response()->download(storage_path('app/public/' . $filePath), 'order_' . $id . '.pdf');
    }    
}
