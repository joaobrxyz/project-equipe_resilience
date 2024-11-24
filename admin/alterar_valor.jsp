<%@ page language="java" import="java.sql.*" %>

<%
    // Cria as variáveis e armazena as informações digitadas pelo usuário
    String vnome = request.getParameter("plano");
    String vvalor = request.getParameter("valor");
    
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
    String sql = "UPDATE planos SET valor = ? WHERE id_plano = ?";

    // Cria a variável do tipo PreparedStatement
    PreparedStatement stm = conexao.prepareStatement(sql);

    stm.setString(1, vvalor);
    stm.setString(2, vnome);

    stm.execute();
    stm.close();

    out.print("<h2>Valor do plano atualizado com sucesso!!!");
    out.print("<br>");
    out.print("<a href='index.jsp'>Voltar</a>");
%>
