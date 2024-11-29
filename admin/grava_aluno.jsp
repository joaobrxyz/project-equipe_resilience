<%@ page language="java" import="java.sql.*" %>

<%
    // Cria as variáveis e armazena as informações digitadas pelo usuário
    String vcpf = request.getParameter("cpf");
    String vnome = request.getParameter("name");
    String vidade = request.getParameter("age");
    String vtelefone = request.getParameter("phone");
    String vemail = request.getParameter("email");
    String vsenha = request.getParameter("cpf");

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
    String sql = "INSERT INTO alunos(cpf, nome, nasc, telefone, email, senha) values(?,?,?,?,?,?)";

    // Cria a variável do tipo PreparedStatement
    PreparedStatement stm = conexao.prepareStatement(sql);

    stm.setString(1, vcpf);
    stm.setString(2, vnome);
    stm.setString(3, vidade);
    stm.setString(4, vtelefone);
    stm.setString(5, vemail);
    stm.setString(6, vsenha);

    stm.execute();
    stm.close();

    out.print("<h2>Dados gravados com sucesso!!!");
    out.print("<br>");
    out.print("<a href='../admin/'>Voltar</a>");
%>
