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