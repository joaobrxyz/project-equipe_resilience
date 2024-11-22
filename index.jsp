<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Equipe resilience</title>
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <link rel="stylesheet" href="style/style.css">
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>

<body>
  <header>
    <div class="logo" >
      <img data-aos="fade-down" src="img/logo.svg" alt="Logo">
    </div>
    <nav id="menu" data-aos="fade-down">
      <a href="#sobre">SOBRE</a>
      <a href="#aulas">AULAS</a>
      <a href="#planos">PLANOS</a>
      <a href="#localizacao">LOCALIZAÇÃO</a>
    </nav>
    <button data-aos="fade-down" id="portal_aluno">PORTAL DO ALUNO</button>
  </header>
  
  <main>
    <section class="principal" data-aos="zoom-out-left">
      <h1>Torne-se Imparável</h1>
      <p>Experimente nossos treinos de boxe e Jiu-jítsu de alta intensidade liderados pelos melhores treinadores.</p>
      <a href="sejaAluno.html" class="principal_btn">SEJA ALUNO</a>
      <a href="souAluno.jsp" class="principal_btn">JÁ SOU ALUNO</a>
    </section>
    
    <section id="sobre" class="content" data-aos="zoom-out-left" data-aos-delay="250">
      <div class="sobre-container">
        <img src="img/equipeResilience.jpg" alt="Sobre Nós">
        <div class="texto-sobre">
          <h2>Sobre Nós</h2>
          <p>Venha fazer parte da Equipe Resilience, nosso compromisso é com o seu conhecimento, queremos que nossos alunos tenham um excelente resultado nas artes marciais, atualmente temos aulas de segunda à sexta, de Boxe e Jiu Jitsu. A nossa estrutura e qualidade profissional são um ótimo custo-beneficio para você, estamos à disposição para melhor atendê-los.</p>
          <p>Horário de funcionamento: <strong>07:00 </strong> às <strong>12:00</strong></p>
        </div>
      </div>
    </section>

   <section id="aulas" class="content" data-aos="zoom-out-left" data-aos-delay="250">
        <h2>Aulas</h2>
        <div class="tables-container">
            <div class="table-container">
                <table class="aulas-table">
                    <thead>
                        <tr>
                            <th>Data/Horário</th>
                            <th>Segunda</th>
                            <th>Terça</th>
                            <th>Quarta</th>
                            <th>Quinta</th>
                            <th>Sexta</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>08:30-10:00</td>
                            <td>BOXE ADULTO</td>
                            <td>BOXE ADULTO</td>
                            <td>BOXE ADULTO</td>
                            <td>BOXE ADULTO</td>
                            <td>BOXE ADULTO</td>
                        </tr>
                        <tr>
                            <td>10:00-11:00</td>
                            <td>BOX INFANTIL</td>
                            <td></td>
                            <td>BOX INFANTIL</td>
                            <td></td>
                            <td>BOX INFANTIL</td>
                        </tr>
                        <tr>
                            <td>16:30-17:30</td>
                            <td></td>
                            <td>BOX INFANTIL</td>
                            <td></td>
                            <td>BOX INFANTIL</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>17:30-19:00</td>
                            <td>BOX ADULTO</td>
                            <td></td>
                            <td>BOX ADULTO</td>
                            <td></td>
                            <td>BOX ADULTO</td>
                        </tr>
                        <tr>
                            <td>19:00-20:30</td>
                            <td>BOX ADULTO</td>
                            <td>BOX ADULTO</td>
                            <td>BOX ADULTO</td>
                            <td>BOX ADULTO</td>
                            <td>BOX ADULTO</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table-container">
                <table class="aulas-table">
                    <thead>
                        <tr>
                            <th>Data/Horário</th>
                            <th>Segunda</th>
                            <th>Terça</th>
                            <th>Quarta</th>
                            <th>Quinta</th>
                            <th>Sexta</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>07:00-08:30</td>
                            <td>JIU-JITSU</td>
                            <td>NO GI</td>
                            <td>JIU-JITSU</td>
                            <td>QUEDAS & DEFESA PESSOAL</td>
                            <td>JIU-JITSU</td>
                        </tr>
                        <tr>
                            <td>16:30-17:30</td>
                            <td>JIU-JITSU INFANTIL</td>
                            <td></td>
                            <td>NO GI INFANTIL</td>
                            <td></td>
                            <td>JIU-JITSU INFANTIL</td>
                        </tr>
                        <tr>
                            <td>20:30-22:00</td>
                            <td>JIU-JITSU</td>
                            <td>NO GI</td>
                            <td>JIU-JITSU</td>
                            <td>QUEDAS & DEFESA PESSOAL</td>
                            <td>JIU-JITSU</td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    
    <div  id="planos" class="plans-section" data-aos="zoom-out-left" data-aos-delay="250">
      <h2 class="plans-title">Planos</h2>
      <div class="plans-container">
        <div class="plan">
          <h2>Plano Mensal</h2>
          <p>Por apenas</p>
          <div class="price">R$ 180,00</div>
          <p>*No dinheiro ou no pix</p>
        </div>
        <div class="plan">
          <h2>Plano Semestral</h2>
          <p>Por apenas</p>
          <div class="price">R$ 840,00</div>
          <p>*No dinheiro ou no pix</p>
        </div>
        <div class="plan">
          <h2>Plano Anual</h2>
          <p>Por apenas</p>
          <div class="price">R$ 1.200,00</div>
          <p>*No dinheiro ou no pix</p>
        </div>
      </div>
    </div>
    
    <section class="container-localizacao" data-aos="zoom-out-left" data-aos-delay="250">
      <h2 id="localizacao">Localização</h2>
      <p>Av. Otávio Braga de Mesquita, 1814 - 2°andar - Vila Florida, Guarulhos - SP, 07191-000</p>
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13249.85429283337!2d-46.53459323261719!3d-23.446342179573897!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce8b3d07303343%3A0x90294336a850dd7a!2sEquipe%20Resilience%20Boxe%20e%20Jiu%20Jitsu!5e1!3m2!1spt-BR!2sbr!4v1731261313543!5m2!1spt-BR!2sbr" 
        width="550" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </section>
    
  </main>
  <footer>
    <p>Copyright 2024 | Equipe Resilience - Todos os direitos reservados</p>
  </footer>

  <a class="btn-whatsapp" target="_blank" data-aos="zoom-in-up" data-aos-delay="400">
      <img src="img/whatssapp.svg" alt="botão whatssapp">
      <p class="tooltip-text">Esclareça suas dúvidas</p>
  </a>

  <script src="script/script.js"></script>
</body>
</html>