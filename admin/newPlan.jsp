<%@ page contentType="text/html; charset=UTF-8" %>
<%
    if (session.getAttribute("usuario") == null) {
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
    <h1>Adicionar um novo plano</h1>
    <form action="grava_plano.jsp" method="POST">
        <label for="name">Nome do plano:</label>
        <input type="text" id="name" name="name" required onkeypress="return /[A-Za-zÀ-ÖØ-öø-ÿ\s]/.test(event.key)" maxlength="20">

        <label for="duracao">Duração em meses:</label>
        <input type="text" id="duracao" name="duracao" required onkeypress="return event.charCode >= 48 && event.charCode <= 57" maxlength="3">

        <label for="valor">Valor:</label>
        <input type="text" id="valor" name="valor" required onkeypress="return event.charCode >= 48 && event.charCode <= 57" maxlength="5">

      <button type="submit" id="btn_cadastrar">Adicionar plano</button>
    </form>
  </div>
</body>
</html>
<%
    }
%>