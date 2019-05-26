<?php
    require_once("system/db.php");
    session_start();

    $db = new db();
    
    $pegar_noticias = $db->pegar_noticias();

    if(!isset($_SESSION['logado'])){
        session_destroy();
    } else {
        if(isset($_SESSION['page_access'])){
            if($_SESSION['page_access'] == 5){
                if(isset($_POST['titulo']) && isset($_POST['noticia'])){
                    if(empty($_POST['titulo'])){
                        echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o campo título da postagem!');window.location.href='/index.php';</script>";
                        exit;
                    }
                    if(empty($_POST['noticia'])){
                        echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o campo notícia da postagem!');window.location.href='/index.php';</script>";
                        exit;
                    }

                    $db->inserir_noticia($_SESSION['nome'], $_POST['titulo'], $_POST['noticia']);
                    echo"<script language='javascript' type='text/javascript'>alert('Postagem criada!');window.location.href='/index.php';</script>";
                    exit;

                }
                if(isset($_POST['btn_deletar_noticia'])){
                    $db->deletar_noticia($_POST['id_deletar_noticia']);
                    echo"<script language='javascript' type='text/javascript'>alert('Postagem deletada!');window.location.href='/index.php';</script>";
                    exit;
                }
            }
        }
    }

?>
<!DOCTYPE html>
<html lang='pt-br'>
    <head>
        <meta charset='UTF-8'>
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='css/estilo.css'>
        <title>Início</title>
    </head>
    <body>
        <nav class="navbar fixed-top">
            <ul class="navbar nav">
                <li class="nav-item active"><a class="nav-link" href="index.php">Início</a></li>
                <li class="nav-item"><a class="nav-link" href="acessar_conta.php">Acessar Conta</a></li>
                <li class="nav-item"><a class="nav-link" href="criar_conta.php">Criar Conta</a></li>
                <li class="nav-item"><a class="nav-link" href="downloads.php">Download</a></li>
                <li class="nav-item"><a class="nav-link" href="shopping.php">Shopping</a></li>
            </ul>
        </nav>
        <div class="corpo">
            <main role="main" class="container">
                <div class="jumbotron">
                    <div class="row">
                        <div class="col-sm">
                            <table class="table table-hover table-dark">
                                <thead>
                                    <th class="text-center" scope="col">Comunidade</th>
                                </thead>
                                <thead>
                                    <tr>
                                        <td><a class="link p-3" href="#">Buscar Jogador</a></td>
                                    </tr>
                                </thead>
                                <thead>
                                    <th class="text-center" scope="col">Eventos</th>
                                </thead>
                                <thead>
                                    <tr>
                                        <td><a class="link p-3" href="">Castle</a></td>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="col-sm-6">
                            <div class="page-header">
                                <h1 class="text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded">DBO Ilimited</h1>
                                <h1 class="text-center border-bottom border-top border-dark p-3 mb-5 bg-white rounded">Notícias</h1>
                            </div>
                            <?php if(isset($_SESSION['page_access'])) {?>
                                <?php if($_SESSION['page_access'] == 5) {?>
                                    <form method="post" action="">
                                        <div class="form-login">
                                            <div class="form-group">
                                                <label for="titulo" class="font-weight-bold">Título</label>
                                                <input type="text" class="form-control" id="titulo" name="titulo">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1" class="font-weight-bold">Notícia</label>
                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="noticia"></textarea>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-outline-dark">Postar</button>
                                    </form>
                            <?php } }?>
                            <?php while($dado = $pegar_noticias->fetch_array()) {?>
                                <table class="table table-hover table-dark rounded">
                                    <thead>
                                        <tr>
                                        <th scope="col" class="text-center"><?php echo $dado['titulo'] ?></th>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                        <td scope="col"><?php echo $dado['noticia'] ?></td>
                                        <?php if(isset($_SESSION['page_access'])){if($_SESSION['page_access'] == 5){ ?>
                                            <td>
                                                <form method="post" action="">
                                                    <div class="form-group">
                                                        <input type='hidden' name='id_deletar_noticia' value="<?php echo  $dado['id'] ?>">
                                                        <button type="submit" name="btn_deletar_noticia" class="btn btn-primary p-0 mt-0">Deletar</button>
                                                    </div>
                                                </form>
                                            </td>
                                        <?php }} ?>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <td><?php echo "Por: ".$dado['nickname']?></td>
                                        </tr>
                                    </thead>
                                </table>
                            <?php } ?>
                        </div>
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html