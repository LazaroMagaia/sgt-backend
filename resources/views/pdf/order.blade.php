<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .order-details {
            margin-bottom: 20px;
        }
        .ticket-list {
            margin-top: 10px;
        }
        .ticket-list th, .ticket-list td {
            padding: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h2>Detalhes da Ordem #{{ $orderId }}</h2>
    <p><strong>Nome do Usuário:</strong> {{ $userName }}</p> <!-- Nome do Usuário -->
    <p><strong>Data da Ordem:</strong> {{ $createdAt }}</p>
    <p><strong>Status:</strong> {{ $status }}</p>
    <p><strong>Total:</strong> {{ $total }} MZN</p>
    <p><strong>Forma de Pagamento:</strong> {{ $paymentType }}</p>

    <h3>Bilhetes Comprados:</h3>
    <table class="ticket-list" border="1">
        <thead>
            <tr>
                <th>Viagem</th>
                <th>Data</th>
                <th>Preço Unitário</th>
                <th>Quantidade</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($tickets as $ticket)
                <tr>
                    <td>{{ $ticket->description }} ({{ $ticket->from }} - {{ $ticket->to }})</td>
                    <td>{{ $ticket->data }} {{ $ticket->hour }}</td>
                    <td>{{ $ticket->price }} MZN</td>
                    <td>{{ $ticket->pivot->quantidade }}</td>
                    <td>{{ $ticket->pivot->subtotal }} MZN</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
