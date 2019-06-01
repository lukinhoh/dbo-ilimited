<?php
    require_once("system/db.php");
    require_once("system/functions.php");

    // Include head
    include_once('inc/head.php');
    // Include nav
    include_once('inc/nav.php');
    // Include nav left
    include_once('inc/navleft.php');

    // Create database object
    $db = new db();
    // Include page
    if(isset($_GET['url'])){
        $explode = explode('/', $_GET['url']);
        $file = $explode[0].".php";
        if(is_file('pages/'.$file)){
            include_once('pages/'.$file);
        }else{
            include_once('pages/404.php');
        }
    }else{
        include_once('pages/inicio.php');
    }

    // Include nav right
    include_once('inc/navright.php');
    // Include scripts jquery, ajax, js etc...
    include_once('inc/scripts.php');
    // Include footer
    include_once('inc/footer.php');
?>