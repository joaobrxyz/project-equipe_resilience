<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro de Aluno</title>
  <link rel="stylesheet" href="style/sejaAluno.css">
</head>
<body>
  <a href="index.jsp" class="btn-voltar">Voltar</a>
  
  <div class="container">
    <h1>Cadastro de Aluno</h1>
    <form action="index.html" method="POST">
      <label for="name">Nome Completo:</label>
      <input type="text" id="name" name="name" required>

      <label for="age">Idade:</label>
      <input type="number" id="age" name="age" required>

      <label for="email">E-mail:</label>
      <input type="email" id="email" name="email" required>

      <label for="phone">Telefone:</label>
      <input type="tel" id="phone" name="phone" required>

      <button type="submit">Cadastrar</button>
    </form>
  </div>
</body>
</html>
