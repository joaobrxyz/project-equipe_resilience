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
    <title>Alterar Email</title>
    <link rel="stylesheet" href="../style/cadastro.css">
</head>
<body>
    <a href="../portalAluno/" class="btn-voltar">Voltar</a>
    <div class="container">
    <h1>Alterar Email</h1>
        <form action="atualizarEmail.jsp" method="post">
            <input type="hidden" name="cpf" value="<%= session.getAttribute("usuario") %>">

            <label for="novoEmail">Novo Email:</label>
            <input type="email" id="novoEmail" name="novoEmail" required>

            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha" required>

            <button type="submit">Alterar Email</button>
        </form>
    </div>
</body>
</html>
<%
    }
%>
