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
    <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Comprar Pontos</h1></div>
    <form method="post" action="">
        <div class="form-group">
            <label for="pontos" class="font-weight-bold">Quantidade de pontos</label>
            <input type="number" class="form-control" id="pontos" placeholder="Ex: 1 ponto = R$1,00">
        </div>
        <div class="form-group">
            <button class="btn btn-outline-dark">Comprar</button>
        </div>
    </form>
</div>