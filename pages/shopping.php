<?php
    session_start();
    if($_SESSION['logado'] == false){
        echo"<script language='javascript' type='text/javascript'>alert('Você precisa estar logado!');window.location.href='/acessar_conta';</script>";
        session_destroy();
        exit();
    }

    require_once "system/db.php";

    
?>

                <div class="col-sm-6">
                    <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Shopping</h1></div>
                    <a href="donate.php" class="btn btn-outline-dark">Comprar Pontos</a></a>
                </div>
