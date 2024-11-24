<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.Period" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página do administrador</title>
    <link rel="stylesheet" href="../style/painel_control.css">
</head>
<body>
    <header>
        <h1>Painel de controle</h1>
    </header>
    <main>
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

            out.print("<div id='aluno' class='painel_control'>");
                out.print("<h2>Alunos</h2>");
                out.print("<a class='btn_add' href='sejaAluno.html'>Cadastrar novo aluno</a>");

                // Comando para consultar no banco
                String sql_aluno = "SELECT * from alunos order by nome";
                String sql_pagamento = "SELECT p.id_pagamento, p.cpf, a.nome AS nome_aluno, pl.nome AS nome_plano, pl.duracao AS duracao_plano, p.forma_pagamento, p.data_pagamento FROM pagamentos p INNER JOIN alunos a ON p.cpf = a.cpf INNER JOIN planos pl ON p.id_plano = pl.id_plano ORDER BY p.data_pagamento DESC";
                String sql_plano = "SELECT nome, valor from planos";

                // Cria a variável do tipo PreparedStatement
                PreparedStatement stm_aluno = conexao.prepareStatement(sql_aluno); 
                PreparedStatement stm_pagamento = conexao.prepareStatement(sql_pagamento);
                PreparedStatement stm_plano = conexao.prepareStatement(sql_plano);

                // Cria a variável do tipo ResultSet para armazenar os dados que estão no banco
                ResultSet dados_aluno = stm_aluno.executeQuery();
                ResultSet dados_pagamento = stm_pagamento.executeQuery();
                ResultSet dados_planos = stm_plano.executeQuery();
                
                while ( dados_aluno.next() ) {
                    out.print("<div class='aluno dados'>");
                        out.print("<div id='dados_aluno'>");
                            String cpf = dados_aluno.getString("cpf");
                            String cpfFormatado = cpf.substring(0, 3) + "." + cpf.substring(3, 6) + "." + cpf.substring(6, 9) + "-" + cpf.substring(9, 11);
                            out.print("<p><strong>CPF: </strong>"+ cpfFormatado+"</p>");
                            out.print("<p><strong>Nome: </strong>"+ dados_aluno.getString("nome")+"</p>");
                            String sql_ultimo_pagamento = "SELECT p.data_pagamento, pl.duracao FROM pagamentos p INNER JOIN planos pl ON p.id_plano = pl.id_plano WHERE p.cpf = ? ORDER BY p.data_pagamento DESC LIMIT 1";
                            PreparedStatement stm_ultimo_pagamento = conexao.prepareStatement(sql_ultimo_pagamento);
                            stm_ultimo_pagamento.setString(1, cpf);
                            ResultSet dados_ultimo_pagamento = stm_ultimo_pagamento.executeQuery();
                            if (dados_ultimo_pagamento.next()) {
                                LocalDate dataPagamento = dados_ultimo_pagamento.getDate("data_pagamento").toLocalDate();
                                int duracaoPlano = dados_ultimo_pagamento.getInt("duracao");
                                LocalDate vencimento = dataPagamento.plusDays(duracaoPlano);
                                LocalDate hoje = LocalDate.now();
                                String situacao = vencimento.isBefore(hoje) ? "Vencido desde " : "Ativo até ";
                                out.print("<p><strong>Situação: </strong>"+ situacao + vencimento.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) +"</p>");
                            } else {
                                out.print("<p><strong>Situação: </strong>Sem pagamentos registrados</p>");
                            }
                            out.print("<div class='mostrar_mais_aluno' id='"+dados_aluno.getString("cpf")+"' style = 'display:none;'>");
                                String dataNascimentoStr = dados_aluno.getString("nasc");
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
                                LocalDate dataNascimento = LocalDate.parse(dataNascimentoStr, formatter);
                                LocalDate hoje = LocalDate.now();
                                Period periodo = Period.between(dataNascimento, hoje);
                                int idade = periodo.getYears();
                                out.print("<p><strong>Idade: </strong>"+ idade+"</p>");
                                out.print("<p><strong>Telefone: </strong>"+ dados_aluno.getString("telefone")+"</p>");
                                out.print("<p><strong>Email: </strong>"+ dados_aluno.getString("email")+"</p>");
                                out.print("<p><strong>Senha: </strong>"+ dados_aluno.getString("senha")+"</p>");
                            out.print("</div>");
                        out.print("</div>");
                        out.print("<div>");
                            out.print("<input class='btn' type='button' value='Excluir aluno' onclick=confirmarExclusao('"+ cpf +"')>");
                            String cpfParaExcluir = request.getParameter("excluir_cpf");
                            if (cpfParaExcluir != null) {
                                // Excluir pagamentos do aluno
                                String sqlExcluirPagamentos = "DELETE FROM pagamentos WHERE cpf = ?";
                                PreparedStatement stmExcluirPagamentos = conexao.prepareStatement(sqlExcluirPagamentos);
                                stmExcluirPagamentos.setString(1, cpfParaExcluir);
                                stmExcluirPagamentos.executeUpdate();
                                // Excluir o aluno
                                String sqlExcluirAluno = "DELETE FROM alunos WHERE cpf = ?";
                                PreparedStatement stmExcluirAluno = conexao.prepareStatement(sqlExcluirAluno);
                                stmExcluirAluno.setString(1, cpfParaExcluir);
                                stmExcluirAluno.executeUpdate();
                                response.sendRedirect("index.jsp");
                                return;
                            }
                            out.print("<input class='btn' id='btn_"+ dados_aluno.getString("cpf")+"' type='button' value='Mostrar mais' onclick='mostrarMais(\""+ dados_aluno.getString("cpf")+"\")'>");
                        out.print("</div>");
                    out.print("</div>");
                }
            out.print("</div>");
            out.print("<div id='pagamentos' class='painel_control'>");
                out.print("<h2>Pagamentos</h2>");
                out.print("<a class='btn_add' href='newPayment.html'>Registrar pagamento</a>");
                while ( dados_pagamento.next() ) {
                LocalDate data_pagamento = dados_pagamento.getDate("data_pagamento").toLocalDate();
                String cpf = dados_pagamento.getString("cpf");
                String cpfFormatado = cpf.substring(0, 3) + "." + cpf.substring(3, 6) + "." + cpf.substring(6, 9) + "-" + cpf.substring(9, 11);
                out.print("<div class='pagamento dados'>");
                    out.print("<div>");
                        out.print("<p><strong>CPF: </strong>"+ cpfFormatado+"</p>");
                        out.print("<p><strong>Nome: </strong>"+ dados_pagamento.getString("nome_aluno")+"</p>");
                        out.print("<p><strong>Plano: </strong>"+ dados_pagamento.getString("nome_plano")+ "</p>");
                        out.print("<p><strong>Forma de pagamento: </strong>"+ dados_pagamento.getString("forma_pagamento")+ "</p>");
                        out.print("<p><strong>Data: </strong>"+ data_pagamento.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))+ "</p>");
                    out.print("</div>");
                    out.print("<div>");
                    out.print("<input class='btn' type='button' value='Excluir pagamento' onclick=excluirPagamento('"+ dados_pagamento.getString("id_pagamento") +"')>");
                    String idPagamentoParaExcluir = request.getParameter("excluir_id_pagamento");
                    if (idPagamentoParaExcluir != null) {
                        String sqlExcluirPagamento = "DELETE FROM pagamentos WHERE id_pagamento = ?";
                        PreparedStatement stmExcluirPagamento = conexao.prepareStatement(sqlExcluirPagamento);
                        stmExcluirPagamento.setString(1, idPagamentoParaExcluir);
                        stmExcluirPagamento.executeUpdate();
                        response.sendRedirect("index.jsp");
                        return;
                    }
                    out.print("</div>");
                out.print("</div>");
                }
            out.print("</div>");
            out.print("</div>");
            out.print("<div id='planos' class='painel_control'>");
                out.print("<h2>Planos</h2>");
                out.print("<a class='btn_add' href='newPlan.html'>Adicionar um plano</a>");
                while ( dados_planos.next() ) {
                    out.print("<div class='plano dados'>");
                        out.print("<p>"+ dados_planos.getString("nome")+ ": R$"+ dados_planos.getString("valor")+ "</p>");
                        out.print("<a href='alterarValor.html'><input class='btn' type='button' value='Alterar valor'></a>");
                    out.print("</div>");
                }
            out.print("</div>");
        %>
    </main>
    <script src="../script/admin.js"></script>
</body>
</html>