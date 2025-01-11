@component('mail::message')
# Bem-vindo, {{ $user->name }}!

Sua conta foi criada com sucesso. Aqui estão seus detalhes de login:

- **E-mail:** {{ $user->email }}
- **Senha:** {{ $password }}

Clique no botão abaixo para acessar o sistema:

@component('mail::button', ['url' => url('/login')])
Acessar o Sistema
@endcomponent

Obrigado,<br>
{{ config('app.name') }}
@endcomponent
