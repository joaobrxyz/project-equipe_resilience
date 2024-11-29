<%@ page language="java" import="java.sql.*" %>

<%
    // Cria as variáveis e armazena as informações digitadas pelo usuário
    String vid = request.getParameter("duracao");
    String vnome = request.getParameter("name");
    String vvalor = request.getParameter("valor");
    int vduracao = Integer.parseInt(request.getParameter("duracao")) * 30;
    
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
    String sql = "INSERT INTO planos(id_plano, nome, valor, duracao) values(?,?,?,?)";

    // Cria a variável do tipo PreparedStatement
    PreparedStatement stm = conexao.prepareStatement(sql);

    stm.setString(1, vid);
    stm.setString(2, vnome);
    stm.setString(3, vvalor);
    stm.setInt(4, vduracao);

    stm.execute();
    stm.close();

    out.print("<h2>Dados gravados com sucesso!!!");
    out.print("<br>");
    out.print("<a href='../admin/'>Voltar</a>");
%>
