function preencherTabelaAlunos() {
    const tbody = document.querySelector('#alunosTable tbody');
    tbody.innerHTML = '';
    
    dados.alunos.forEach(aluno => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${aluno.cpf}</td>
            <td>${aluno.nome}</td>
            <td>${aluno.idade}</td>
            <td>${aluno.email}</td>
            <td>${aluno.senha}</td>
            <td class="buttons">
                <button onclick="alterarEmail('${aluno.cpf}')">Alterar Email</button>
                <button onclick="alterarSenha('${aluno.cpf}')">Alterar Senha</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

function preencherTabelaAssinaturas() {
    const tbody = document.querySelector('#assinaturasTable tbody');
    tbody.innerHTML = '';
    
    dados.assinaturas.forEach(assinatura => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${assinatura.id}</td>
            <td>${assinatura.aluno}</td>
            <td>${assinatura.plano}</td>
            <td>${assinatura.dataAssinatura}</td>
            <td>${assinatura.formaPagamento}</td>
            <td>${assinatura.vencimento}</td>
            <td class="buttons">
                <button onclick="renovarMensalidade('${assinatura.id}')">Renovar Mensalidade</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

function preencherTabelaPlanos() {
    const tbody = document.querySelector('#planosTable tbody');
    tbody.innerHTML = '';
    
    dados.planos.forEach(plano => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${plano.nome}</td>
            <td>${plano.valor}</td>
            <td>${plano.duracao}</td>
        `;
        tbody.appendChild(tr);
    });
}

function alterarEmail(cpf) {
    const novoEmail = prompt('Digite o novo email:');
    if (novoEmail) {
        const aluno = dados.alunos.find(a => a.cpf === cpf);
        if (aluno) {
            aluno.email = novoEmail;
            preencherTabelaAlunos();
        }
    }
}

function alterarSenha(cpf) {
    const novaSenha = prompt('Digite a nova senha:');
    if (novaSenha) {
        const aluno = dados.alunos.find(a => a.cpf === cpf);
        if (aluno) {
            aluno.senha = '********';
            preencherTabelaAlunos();
        }
    }
}

function renovarMensalidade(id) {
    const assinatura = dados.assinaturas.find(a => a.id === id);
    if (assinatura) {
        const dataAtual = new Date(assinatura.vencimento);
        dataAtual.setMonth(dataAtual.getMonth() + 1);
        assinatura.vencimento = dataAtual.toLocaleDateString();
        preencherTabelaAssinaturas();
    }
}

// Inicializar as tabelas quando a página carregar
window.onload = function() {
    preencherTabelaAlunos();
    preencherTabelaAssinaturas();
    preencherTabelaPlanos();
};

// Add at the beginning of script.js
function checkAuth() {
    if (!sessionStorage.getItem('currentUser')) {
        window.location.href = 'login.html';
    }
}

// Add logout function
function logout() {
    sessionStorage.removeItem('currentUser');
    window.location.href = 'login.html';
}

// Add to window.onload
window.onload = function() {
    checkAuth();
    preencherTabelaAlunos();
    preencherTabelaAssinaturas();
    preencherTabelaPlanos();
}