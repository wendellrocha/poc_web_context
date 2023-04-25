# poc_web_context

PoC para mostrar como é possível levar o usuário de volta para a página que ele estava visualizando após um refresh da página (F5, CTRL + F5).
Estou utilizando um `RouteGuard` para realizar o auto login do usuário, outro para sempre manter o "contexto" salvo e outro para validar se o usuário está autenticado antes de acessar a rota. Este último caso evita que ele não esteja logado e insira a rota manualmente pela barra de endereços.

Por sempre manter o contexto salvo, entende-se que toda vez que o usuário acessar uma rota nova, será persistido o path atual e os argumentos (se houver). Com isso o a aplicação conseguirá mandar ele de volta para a tela que ele estava passando os parâmetros/query/argumentos da rota.

A PoC será desenvolvida utilizando o [dummyJSON](https://dummyjson.com) para agilizar e facilitar a demonstração da solução proposta. 

Para realizar o login, insira o `username` e a `password` de qualquer um dos usuários listados no endpoint de [usuários](https://dummyjson.com/users).