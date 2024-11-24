<%@ page language="java" import="java.sql.*" %>

<%
    // Cria as variáveis e armazena as informações digitadas pelo usuário
    String vcpf = request.getParameter("cpf");
    int vplano = Integer.parseInt(request.getParameter("plano"));
    String vpagamento = request.getParameter("forma_pagamento");
    String vdata = request.getParameter("data_pagamento");

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
    String sql = "INSERT INTO pagamentos(cpf, id_plano, forma_pagamento, data_pagamento) values(?,?,?,?)";

    // Cria a variável do tipo PreparedStatement
    PreparedStatement stm = conexao.prepareStatement(sql);

    stm.setString(1, vcpf);
    stm.setInt(2, vplano);
    stm.setString(3, vpagamento);
    stm.setString(4, vdata);

    stm.execute();
    stm.close();

    out.print("<h2>Dados gravados com sucesso!!!");
    out.print("<br>");
    out.print("<a href='index.jsp'>Voltar</a>");
%>
