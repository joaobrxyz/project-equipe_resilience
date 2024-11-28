<%@ page language="java" import="java.sql.*" %>

<%
    // Cria as variáveis e armazena as informações digitadas pelo usuário
    String vcpf = request.getParameter("cpf");
    String vsenhaAtual = request.getParameter("senhaAtual");
    String vsenhaNova = request.getParameter("senhaNova");

    // Variáveis para acessar o banco de dados
    String database = "resiliencedb";
    String enderecoBD = "jdbc:mysql://localhost:3306/" + database;
    String usuarioBD = "root";
    String senhaBD = "";

    // Driver
    String driver = "com.mysql.jdbc.Driver"; // Certifique-se de que o driver está na biblioteca do projeto

    // Carregar o driver na memória
    Class.forName(driver);

    // Cria uma variável para conexão com o banco de dados
    Connection conexao;

    // Abrir a conexão com o banco de dados
    conexao = DriverManager.getConnection(enderecoBD, usuarioBD, senhaBD);

    // Comando para inserir no banco
    String sql = "UPDATE alunos SET senha = ? WHERE cpf = ? AND senha = ?";

    // Cria a variável do tipo PreparedStatement
    PreparedStatement stm = conexao.prepareStatement(sql);

    stm.setString(1, vsenhaNova);
    stm.setString(2, vcpf);
    stm.setString(3, vsenhaAtual);

    int linhasAfetadas = stm.executeUpdate();

    if (linhasAfetadas > 0) {
        // Senha OK
        out.print("<script>");
            out.print("alert('Senha alterada com sucesso!');");
            out.print("window.location.href = '../portalAluno';");
        out.print("</script>");
    } else {
        // Login INCORRETO
        out.print("<script>");
            out.print("alert('Senha atual incorreta!');");
            out.print("window.location.href = '../portalAluno/alterarSenha.jsp';");
        out.print("</script>");
    }
    stm.close();
    conexao.close();
%>
