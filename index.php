<?php
    require_once("system/db.php");
    require_once("system/functions.php");
    // Include head
    include_once('inc/head.php');
    // Include menu
    include_once('inc/nav.php');
    // Include menu da esquerda
    include_once('inc/navleft.php');

    // Teste
    $db = new db();
    // Conteúdo da página
    if(isset($_GET['url'])){
        $explode = explode('/', $_GET['url']);
        $file = $explode[0].".php";
        if(is_file('pages/'.$file)){
            include_once('pages/'.$file);
        }else{
            echo"<script language='javascript' type='text/javascript'>alert('Essa página não existe! Você será redirecionado para página inicial.');window.location.href='/inicio'</script>";
            exit;
        }
    }else{
        include_once('pages/inicio.php');
    }

    // Include menu da direita
    include_once('inc/navright.php');
    // Include scripts jquery, ajax, js etc...
    include_once('inc/scripts.php');
    // Include footer
    include_once('inc/footer.php');
?>