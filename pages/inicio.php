<?php
    session_start();
    
    $pegar_noticias = get_notices();

    if(!isset($_SESSION['logado'])){
        session_destroy();
    } else {
        if(isset($_SESSION['page_access'])){
            if($_SESSION['page_access'] == 5){
                if(isset($_POST['titulo']) && isset($_POST['noticia'])){
                    if(empty($_POST['titulo'])){
                        echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o campo título da postagem!');window.location.href='/inicio';</script>";
                        exit;
                    }
                    if(empty($_POST['noticia'])){
                        echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o campo notícia da postagem!');window.location.href='/inicio';</script>";
                        exit;
                    }

                    insert_notice($_SESSION['nome'], $_POST['titulo'], $_POST['noticia']);
                    echo"<script language='javascript' type='text/javascript'>alert('Postagem criada!');window.location.href='/inicio';</script>";
                    exit;

                }
                if(isset($_POST['btn_deletar_noticia'])){
                    delet_notice($_POST['id_deletar_noticia']);
                    echo"<script language='javascript' type='text/javascript'>alert('Postagem deletada!');window.location.href='/inicio';</script>";
                    exit;
                }
            }
        }
    }

?>
<div class="col-sm-7">
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
                <button type="submit" class="btn btn-outline-dark mt-3 mb-3">Postar</button>
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
                </tr>
            </thead>
            <thead>
                <tr>
                    <td scope="col"><?php echo "Por: ".$dado['nickname']?></td>
                    <?php if(isset($_SESSION['page_access'])){if($_SESSION['page_access'] == 5){ ?>
                    <td scope="col">
                        <form method="post" action="">
                            <div class="form-group">
                                <input type='hidden' name='id_deletar_noticia' value="<?php echo  $dado['id'] ?>">
                                <button type="submit" name="btn_deletar_noticia" class="btn btn-dark p-0 mt-0">Deletar</button>
                            </div>
                        </form>
                    </td>
                    <?php }} ?>
                </tr>
            </thead>
        </table>
    <?php } ?>
</div>