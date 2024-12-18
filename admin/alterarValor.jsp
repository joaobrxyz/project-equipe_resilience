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
    <h1>Alterar valor</h1>
    <form action="alterar_valor.jsp" method="POST">
        <label for="plano">Plano:</label>
        <select name="plano" id="plano">
          <option value="1">Mensal</option>
          <option value="6">Semestral</option>
          <option value="12">Anual</option>
        </select>

      <label for="valor">Novo valor:</label>
      <input type="text" id="valor" name="valor" required onkeypress="return event.charCode >= 48 && event.charCode <= 57" maxlength="5">

      <button type="submit" id="btn_cadastrar">Atualizar</button>
    </form>
  </div>
</body>
</html>
<%
    }
%>