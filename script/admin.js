function mostrarMais(cpf) {
    const id_div = document.getElementById(cpf);
    const btn = document.getElementById("btn_" + cpf)
    console.log(btn)
    if (id_div.style.display === "none") {
        id_div.style.display = "block";
        btn.value = "Mostrar menos"
    } else {
        id_div.style.display = "none"; 
        btn.value = "Mostrar mais"
    }
}
function confirmarExclusao(cpf) {
    if (confirm("Você realmente deseja excluir este aluno?")) {
        window.location.href = "?excluir_cpf=" + cpf;
    }
}
function excluirPagamento(idPagamento) {
    if (confirm("Tem certeza que deseja excluir este pagamento?")) {
        // Redireciona para a página com o ID do pagamento a ser excluído
        window.location.href = "?excluir_id_pagamento=" + idPagamento;
    }
}
function resetarSenha(cpf) {
    if (confirm("Tem certeza que deseja resetar a senha deste aluno?")) {
        window.location.href = "?resetar_cpf=" + cpf;
    }
}
document.addEventListener('DOMContentLoaded', function() {
    // Verificar se a URL contém o parâmetro 'scroll'
    const urlParams = new URLSearchParams(window.location.search);
    const scrollTarget = urlParams.get('scroll');

    if (scrollTarget) {
        // Procurar a div correspondente ao ID
        const targetDiv = document.getElementById(scrollTarget);
        if (targetDiv) {
            // Rolagem suave até a div
            targetDiv.scrollIntoView({ behavior: 'smooth' });
        }
    }
});