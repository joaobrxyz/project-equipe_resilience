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
    <h1>Registrar pagamento</h1>
    <form action="grava_pagamento.jsp" method="POST">
      <label for="cpf">CPF do aluno:</label>
      <input type="text" id="cpf" name="cpf" placeholder="000.000.000-00" required maxlength="11" minlength="11">

      <label for="plano">Plano:</label>
      <select name="plano" id="plano">
        <option value="1">Mensal</option>
        <option value="6">Semestral</option>
        <option value="12">Anual</option>
      </select>

      <label for="forma_pagamento">Forma de pagamento:</label>
      <select name="forma_pagamento" id="forma_pagamento">
        <option value="pix">Pix</option>
        <option value="cartao">Cartão</option>
        <option value="dinheiro">Dinheiro</option>
      </select>

      <label for="data_pagamento">Data do pagamento:</label>
      <input type="date" id="data_pagamento" name="data_pagamento">

      <button type="submit" id="btn_cadastrar">Registrar pagamento</button>
    </form>
  </div>
</body>
</html>
<%
    }
%>