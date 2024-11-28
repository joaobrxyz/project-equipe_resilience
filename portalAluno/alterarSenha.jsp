<%@ page language="java" import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    if (session.getAttribute("usuario") == null) {
        out.print("<script>");
        out.print("window.location.href = 'login.html';");
        out.print("</script>");
    } else {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alterar Senha</title>
    <link rel="stylesheet" href="../style/cadastro.css">
</head>
<body>
    <a href="../portalAluno/" class="btn-voltar">Voltar</a>
    <div class="container">
    <h1>Alterar Senha</h1>
        <form action="atualizarSenha.jsp" method="post">
            <input type="hidden" name="cpf" value="<%= session.getAttribute("usuario") %>">

            <label for="senha">Senha Atual:</label>
            <input type="password" id="senhaAtual" name="senhaAtual" required>

            <label for="senha">Nova Senha:</label>
            <input type="password" id="senhaNova" name="senhaNova" required>

            <button type="submit">Alterar Senha</button>
        </form>
    </div>
</body>
</html>
<%
    }
%>
