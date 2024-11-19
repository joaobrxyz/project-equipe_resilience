<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" href="style/souAluno.css">
</head>
<body>

  <a href="index.jsp" class="btn-voltar">Voltar</a>
  
  <div class="container">
    <h1>Login</h1>
    <form action="index.html" method="POST">
      <label for="email">E-mail:</label>
      <input type="email" id="email" name="email" required>

      <label for="password">Senha:</label>
      <input type="password" id="password" name="password" required>

      <button type="submit">Login</button>
    </form>
  </div>
</body>
</html>
