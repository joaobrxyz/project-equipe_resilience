<%@ page contentType="text/html; charset=UTF-8" %>
<%
    if (session.getAttribute("admin") == null) {
        out.print("<script>");
        out.print("window.location.href = 'login.html';");
        out.print("</script>");
    } else {
%>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro de Aluno</title>
  <link rel="stylesheet" href="../style/cadastro.css">
</head>
<body>
  <a href="../admin/" class="btn-voltar">Voltar</a>
  
  <div class="container">
    <h1>Cadastro de Aluno</h1>
    <form action="grava_aluno.jsp" method="POST">
      <label for="cpf">CPF:</label>
      <input type="text" id="cpf" name="cpf" placeholder="000.000.000-00" required maxlength="11" minlength="11">

      <label for="name">Nome Completo:</label>
      <input type="text" id="name" name="name" required onkeypress="return /[A-Za-zÀ-ÖØ-öø-ÿ\s]/.test(event.key)" maxlength="50">

      <label for="age">Data de nascimento:</label>
      <input type="date" id="age" name="age" required>

      <label for="phone">Telefone:</label>
      <input type="tel" id="phone" name="phone" required
      autocomplete="tel" onkeypress="return event.charCode >= 48 && event.charCode <= 57" placeholder="(xx) xxxxx-xxxx" maxlength="15" minlength="10">

      <label for="email">E-mail:</label>
      <input type="email" id="email" name="email" inputmode="email" required maxlength="50" placeholder="email@gmail.com">

      <button type="submit" id="btn_cadastrar">Cadastrar</button>
    </form>
  </div>
</body>
</html>
<%
    }
%>