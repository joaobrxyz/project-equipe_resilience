<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal do Aluno - Academia de Boxe</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <div class="container">
            <h1>Portal do Aluno</h1>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Alunos</a></li>
                <li><a href="#">Assinaturas</a></li>
                <li><a href="#">Planos</a></li>
            </ul>
        </div>
    </header>
<%
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
    String sql_aluno = "SELECT * from alunos";
    String sql_pagamento = "Select * from pagamentos";
    String sql_plano = "SELECT * from planos ";  

    // Cria a variável do tipo PreparedStatement
    PreparedStatement stm_aluno = conexao.prepareStatement(sql_aluno); 
    PreparedStatement stm_pagamento = conexao.prepareStatement(sql_pagamento);
    PreparedStatement stm_plano = conexao.prepareStatement(sql_plano);


    // Cria a variável do tipo ResultSet para armazenar os dados que estão no banco
    ResultSet dados_aluno = stm_aluno.executeQuery();
    ResultSet dados_pagamento = stm_pagamento.executeQuery();
    ResultSet dados_plano = stm_plano.executeQuery();

    
    out.print("<div class='container'>");
    out.print("<div class='main-content'>");
        out.print("<div class='section'>");
            out.print("<h2>Aluno</h2>");
            out.print("<table id='alunosTable'>");
                out.print("<thead>");
                    out.print("<tr>");
                        out.print("<th>CPF</th>");
                        out.print("<th>Nome</th>");
                        out.print("<th>Idade</th>");
                        out.print("<th>Email</th>");
                        out.print("<th>Senha</th>");
                        out.print("<th>Ações</th>");
                    out.print("</tr>");
                out.print("</thead>");
                out.print("<tbody>");
                    out.print("<tr>");
                    while ( dados_aluno.next() ) {
                        out.print("<td>"+ dados_aluno.getString("cpf") + "</td>" );
                        out.print("<td>" + dados_aluno.getString("nome")+ "</td>");
                        out.print("<td>" + dados_aluno.getString("nasc")+ "</td>");
                        out.print("<td>" + dados_aluno.getString("email")+"</td>");
                        out.print("<td>" + dados_aluno.getString("senha")+ "</td>");
    }

                    out.print("<td class='buttons'>");
                        out.print("<button onclick='alterarEmail(\"123.456.789-00\")'>Alterar Email</button>");
                        out.print("<button onclick='alterarSenha(\"123.456.789-00\")'>Alterar Senha</button>");
                    out.print("</td>");
                    out.print("</tr>");
                out.print("</tbody>");
            out.print("</table>");
        out.print("</div>");
        

        out.print("<div class='section'>");
            out.print("<h2>Assinatura</h2>");
            out.print("<table id='assinaturasTable'>");
                out.print("<thead>");
                    out.print("<tr>");
                        out.print("<th>Assinatura</th>");
                        out.print("<th>Aluno</th>");
                        out.print("<th>Plano</th>");
                        out.print("<th>Data de Assinatura</th>" );
                        out.print("<th>Forma de Pagamento</th>" );
                        out.print("<th>Vencimento</th>");
                        out.print("<th>Ações</th>");
                    out.print("</tr>");
                out.print("</thead>");
                out.print("<tbody>");
                    out.print("<tr>");
                        while(dados_pagamento.next()) {
                        out.print("<td>" + dados_pagamento.getString("id_pagamento") + "</td>");
                        out.print("<td>" + dados_pagamento.getString("id_plano") + "</td>");
                        out.print("<td>" + dados_pagamento.getString("forma_pagamento") + "</td>");
                        out.print("<td>" + dados_pagamento.getString("data_pagamento") + "</td>");
                        
                        out.print("<td class='buttons'>");
                            out.print("<button onclick='renovarMensalidade(\"1\")'>Renovar</button>");
                            out.print("<button onclick='realizarPagamento(\"1\")'>Pagar</button>");
                        out.print("</td>");
                    out.print("</tr>");
                out.print("</tbody>");
            out.print("</table>");
                        }
        out.print("</div>");
    
        out.print("<div class='section'>");
            out.print("<h2>Plano</h2>");
            out.print("<table id='planosTable'>");
                out.print("<thead>");
                    out.print("<tr>");
                        out.print("<th>Plano </th>");
                        out.print("<th>Valor</th>" );
                        out.print("<th>Duração</th>");
                    out.print("</tr>");
                out.print("</thead>");
                out.print("<tbody></tbody>");
            out.print("</table>");
        out.print("</div>");
    out.print("</div>");
out.print("</div>");
%>%>
    <script src="script.js"></script>
</body>
</html>
