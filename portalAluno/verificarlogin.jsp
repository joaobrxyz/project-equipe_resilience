<%@ page language="java" import="java.sql.*" %>
<%

    //Variáveis pra pegar dados do form
    String vcpf = request.getParameter("cpf");
    String vsenha = request.getParameter("senha");

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

    // Comando para consultar no banco
    String sql = "SELECT * from alunos where cpf = ? and senha = ?";

    // Cria a variável do tipo PreparedStatement
    PreparedStatement stm = conexao.prepareStatement(sql); 
    stm.setString(1, vcpf);
    stm.setString(2, vsenha);

    // Cria a variável do tipo ResultSet para armazenar os dados que estão no banco
    ResultSet dados = stm.executeQuery();

    if (dados.next()) {
        // Login OK
        session.setAttribute("usuario", dados.getString("cpf"));
        response.sendRedirect("../portalAluno");
    } else {
        // Login INCORRETO
        out.print("<script>");
            out.print("alert('CPF ou senha incorretos!');");
            out.print("window.location.href = 'login.html';");
        out.print("</script>");
    }
%>