<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.Period" %>
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
    <title>Portal do Aluno - Equipe resilience</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
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
        String sql_aluno = "SELECT * from alunos where cpf = ?";
        String sql_pagamento = "SELECT p.*, pl.nome AS nome_plano, pl.valor AS valor_plano FROM pagamentos p INNER JOIN planos pl ON p.id_plano = pl.id_plano WHERE p.cpf = ? order by p.data_pagamento desc";
        String sql_plano = "SELECT * from planos";  

        // Cria a variável do tipo PreparedStatement
        PreparedStatement stm_aluno = conexao.prepareStatement(sql_aluno);
        stm_aluno.setString(1, (String) session.getAttribute("usuario"));
        PreparedStatement stm_pagamento = conexao.prepareStatement(sql_pagamento);
        stm_pagamento.setString(1, (String) session.getAttribute("usuario"));
        PreparedStatement stm_plano = conexao.prepareStatement(sql_plano);

        // Cria a variável do tipo ResultSet para armazenar os dados que estão no banco
        ResultSet dados_aluno = stm_aluno.executeQuery();
        ResultSet dados_pagamento = stm_pagamento.executeQuery();
        ResultSet dados_plano = stm_plano.executeQuery();
    
        out.print("<header>");
            out.print("<div class='container'>");
                if (dados_aluno.next()) {
                    out.print("<h1>Bem vindo, " + dados_aluno.getString("nome") + "!</h1>");
                }
                dados_aluno.beforeFirst();
            out.print("</div>");
            out.print("<a id='link_sair' href='logout.jsp'>Sair</a>");
        out.print("</header>");
    
        out.print("<div class='container'>");
            out.print("<div class='main-content'>");
                out.print("<div class='section'>");
                    out.print("<h2>Aluno</h2>");
                    out.print("<table id='alunosTable'>");
                        out.print("<thead>");
                            out.print("<tr>");
                                out.print("<th>CPF</th>");
                                out.print("<th>Idade</th>");
                                out.print("<th>Email</th>");
                                out.print("<th>Situação</th>");
                                out.print("<th>Ações</th>");
                            out.print("</tr>");
                        out.print("</thead>");
                        out.print("<tbody>");
                            out.print("<tr>");
                                while ( dados_aluno.next() ) {
                                    String cpf = dados_aluno.getString("cpf");
                                    String cpfFormatado = cpf.substring(0, 3) + "." + cpf.substring(3, 6) + "." + cpf.substring(6, 9) + "-" + cpf.substring(9, 11);

                                    String dataNascimentoStr = dados_aluno.getString("nasc");
                                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
                                    LocalDate dataNascimento = LocalDate.parse(dataNascimentoStr, formatter);
                                    LocalDate hoje = LocalDate.now();
                                    Period periodo = Period.between(dataNascimento, hoje);
                                    int idade = periodo.getYears();

                                    String sql_ultimo_pagamento = "SELECT p.data_pagamento, pl.duracao FROM pagamentos p INNER JOIN planos pl ON p.id_plano = pl.id_plano WHERE p.cpf = ? ORDER BY p.data_pagamento DESC LIMIT 1";
                                    PreparedStatement stm_ultimo_pagamento = conexao.prepareStatement(sql_ultimo_pagamento);
                                    stm_ultimo_pagamento.setString(1, cpf);
                                    ResultSet dados_ultimo_pagamento = stm_ultimo_pagamento.executeQuery();
                                    
                                    out.print("<td>"+ cpfFormatado + "</td>" );
                                    out.print("<td>" + idade + "</td>");
                                    out.print("<td>" + dados_aluno.getString("email")+"</td>");
                                    if (dados_ultimo_pagamento.next()) {
                                        LocalDate dataPagamento = dados_ultimo_pagamento.getDate("data_pagamento").toLocalDate();
                                        int duracaoPlano = dados_ultimo_pagamento.getInt("duracao");
                                        LocalDate vencimento = dataPagamento.plusDays(duracaoPlano);
                                        String situacao = vencimento.isBefore(hoje) ? "Vencido desde " : "Ativo até ";
                                        out.print("<td>"+ situacao + vencimento.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) +"</td>");
                                    } else {
                                        out.print("<td><strong>Situação: </strong>Sem pagamentos registrados</td>");
                                    }
                                }

                                out.print("<td class='buttons'>");
                                    out.print("<a href='alterarEmail.jsp'><button>Alterar Email</button></a>");
                                    out.print("<a href='alterarSenha.jsp'><button>Alterar Senha</button></a>");
                                    out.print("<a href='https://api.whatsapp.com/send?phone=5511964870847&text=Olá, gostaria de renovar meu plano!' target='_blank'><button>Renovar</button></a>");
                                out.print("</td>");
                            out.print("</tr>");
                        out.print("</tbody>");
                    out.print("</table>");
                out.print("</div>");

                out.print("<div class='section'>");
                    out.print("<h2>Pagamentos</h2>");
                    out.print("<table id='assinaturasTable'>");
                        out.print("<thead>");
                            out.print("<tr>");
                                out.print("<th>Data do Pagamento</th>");
                                out.print("<th>Plano</th>");
                                out.print("<th>Forma de Pagamento</th>");
                                out.print("<th>Valor</th>" );
                            out.print("</tr>");
                        out.print("</thead>");
                        out.print("<tbody>");
                            while(dados_pagamento.next()) {
                                out.print("<tr>");
                                    LocalDate data_pagamento = dados_pagamento.getDate("data_pagamento").toLocalDate();
                                    out.print("<td>" + data_pagamento.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) + "</td>");
                                    out.print("<td>" + dados_pagamento.getString("nome_plano") + "</td>");
                                    out.print("<td>" + dados_pagamento.getString("forma_pagamento") + "</td>");
                                    out.print("<td>R$" + dados_pagamento.getString("valor_plano") + "</td>");
                                out.print("</tr>");
                            }
                        out.print("</tbody>");
                    out.print("</table>");
                out.print("</div>");

                out.print("<div class='section'>");
                    out.print("<h2>Planos</h2>");
                    out.print("<table id='planosTable'>");
                        out.print("<thead>");
                            out.print("<tr>");
                                out.print("<th>Plano </th>");
                                out.print("<th>Valor</th>" );
                                out.print("<th>Duração</th>");
                            out.print("</tr>");
                        out.print("</thead>");
                        out.print("<tbody>");
                            while (dados_plano.next()) {
                                out.print("<tr>");
                                    out.print("<td>"+ dados_plano.getString("nome") +"</td>");
                                    out.print("<td>R$"+ dados_plano.getString("valor") +"</td>");
                                    out.print("<td>"+ dados_plano.getString("duracao") +" dias</td>");
                                out.print("</tr>");
                            }
                        out.print("</tbody>");
                    out.print("</table>");
                out.print("</div>");
            out.print("</div>");
        out.print("</div>");
    %>
<script src="script.js"></script>
</body>
</html>
<%
    }
%>