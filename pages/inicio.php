<?php
    session();
    
    $pegar_noticias = get_notices();

    if(isset($_SESSION['page_access'])){
        if($_SESSION['page_access'] == 5){
            if(isset($_POST['titulo']) && isset($_POST['noticia'])){
                if(empty($_POST['titulo'])){
                    return alert('Preencha o campo título', 'inicio');
                }elseif(empty($_POST['noticia'])){
                    return alert('Preencha o campo notícia', 'inicio');
                }else{
                    return insert_notice($_SESSION['nome'], $_POST['titulo'], $_POST['noticia']) && alert('Postagem criada!', 'inicio');
                }

            }
            if(isset($_POST['btn_deletar_noticia'])){
                return delet_notice($_POST['id_deletar_noticia']) && alert('Postagem deletada!', 'inicio');
            }
        }
    }

?>
<div class="col-sm-7 meio">
    <div class="page-header">
        <h1 class="text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded">DBO</h1>
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
                <button type="submit" class="btn btn-dark mt-3 mb-3"><i class="	far fa-paper-plane"></i> Postar</button>
            </form>
    <?php } }?>
    <?php while($dado = $pegar_noticias->fetch_array()) {?>
        <table class="table table-hover table-dark mt-3 rounded">
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
                        <form method="post" action="noticia_edit">
                            <div class="form-group">
                                <input type='hidden' name='id_deletar_noticia' value="<?php echo  $dado['id'] ?>">
                                <button type="submit" name="btn_editar_noticia" class="btn btn-dark p-0 m-0 mr-2"><i class="far fa-edit fa-2x"></i></button> |
                                <button type="submit" name="btn_deletar_noticia" class="btn btn-dark p-0 m-0 ml-2"><i class="far fa-trash-alt fa-2x"></i></button>
                            </div>
                        </form>
                    </td>
                    <?php }} ?>
                </tr>
            </thead>
        </table>
    <?php } ?>
</div>