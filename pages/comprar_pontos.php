<?php
    session();
    
    if($_SESSION['logado'] == false){
        session_destroy();
        return alert('Você precisa estar logado', 'acessar_conta');
    }
?>
<div class="col-sm-7">
    <div class="text-center border-bottom border-top border-dark p-3 mb-5 bg-white rounded">
        <p class="font-weight-bold"><h2>OBSERVAÇÕES</h2><br><strong>Para comprar pontos é só clicar no botão doar logo abaixo.</strong><br>Ao fazer pagamento tirar print do comprovante.<br>Escolha uma das seguintes formas para enviar seu comprovante: <br>Enviar print via discord no meu privado -> Senky#6266<br>Enviar print via whatsapp: (79) 9 9961 6768</p>
    </div>
    <!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
    <form class="text-center mt-5" action="https://pagseguro.uol.com.br/checkout/v2/donation.html" target="_blank" method="post">
    <!-- NÃO EDITE OS COMANDOS DAS LINHAS ABAIXO -->
        <input type="hidden" name="currency" value="BRL" />
        <input type="hidden" name="receiverEmail" value="lucasdasilvaleite97@gmail.com" />
        <input type="hidden" name="iot" value="button" />
        <input type="image" src="https://stc.pagseguro.uol.com.br/public/img/botoes/doacoes/209x48-doar-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!"/>
    </form>
    <!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
</div>