<?php
    session_start();
    if($_SESSION['logado'] == false){
        echo"<script language='javascript' type='text/javascript'>alert('Você precisa estar logado!');window.location.href='/acessar_conta';</script>";
        session_destroy();
        exit();
    }

    require_once "system/db.php";

    
?>
<div class="col-sm-7">
    <div class="text-center border-bottom border-top border-dark p-3 mb-5 bg-white rounded">
        <p class="font-weight-bold">Ao fazer pagamento tirar print do comprovante. <br> Mandar print via discord no meu privado -> Senky#6266</p>
    </div>
    <!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
    <form class="text-center mt-5" action="https://pagseguro.uol.com.br/checkout/v2/donation.html" method="post">
    <!-- NÃO EDITE OS COMANDOS DAS LINHAS ABAIXO -->
        <input type="hidden" name="currency" value="BRL" />
        <input type="hidden" name="receiverEmail" value="lucasdasilvaleite97@gmail.com" />
        <input type="hidden" name="iot" value="button" />
        <input type="image" src="https://stc.pagseguro.uol.com.br/public/img/botoes/doacoes/209x48-doar-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
    </form>
    <!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
</div>