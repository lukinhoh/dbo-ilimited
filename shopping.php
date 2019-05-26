<?php
    session_start();
    if($_SESSION['logado'] == false){
        echo"<script language='javascript' type='text/javascript'>alert('Você precisa estar logado!');window.location.href='/acessar_conta.php';</script>";
        session_destroy();
        exit();
    }

    require_once "system/db.php";

    
?>

<!DOCTYPE html>
<html lang='pt-br'>
    <head>
        <meta charset='UTF-8'>
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='css/estilo.css'>
        <title>Criar Conta</title>
    </head>
    <body>
        <nav class="navbar fixed-top">
            <ul class="navbar nav">
                <li class="nav-item"><a class="nav-link" href="index.php">Início</a></li>
                <li class="nav-item"><a class="nav-link" href="acessar_conta.php">Acessar Conta</a></li>
                <li class="nav-item"><a class="nav-link" href="criar_conta.php">Criar Conta</a></li>
                <li class="nav-item"><a class="nav-link" href="downloads.php">Download</a></li>
                <li class="nav-item active"><a class="nav-link" href="shopping.php">Shopping</a></li>
            </ul>
        </nav>
        <div class="corpo">
            <main role="main" class="container">
                <div class="jumbotron">
                    <div class="row">
                        <div class="col-sm">
                        </div>
                        <div class="col-sm-6">
                            <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Shopping</h1></div>
                            <a href="donate.php" class="btn btn-outline-dark">Comprar Pontos</a></a>
                        </div>
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html