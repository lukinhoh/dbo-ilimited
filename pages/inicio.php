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
                    return insert_notice($_SESSION['nome'], $_POST['titulo'], $_POST['noticia']) && header('location: inicio');
                }

            }
            if(isset($_POST['btn_deletar_noticia'])){
                return delet_notice($_POST['id_noticia']) && header('location: inicio');
            }
        }
    }

?>
<div class="col-sm-7 meio">
    <div class="page-header opacidade">
        <h1 class="text-center border border-dark shadow-sm p-3 mb-5 text-white rounded">Notícias</h1>
    </div>
    <?php if(isset($_SESSION['page_access'])) {?>
        <?php if($_SESSION['page_access'] == 5) {?>
            <form method="post" action="">
                <div class="opacidade p-3">
                    <div class="form-group">
                        <label for="titulo" class="text-white font-weight-bold">Título</label>
                        <input type="text" class="form-control opacidade text-white" id="titulo" name="titulo">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1" class="text-white font-weight-bold">Notícia</label>
                        <textarea class="form-control opacidade text-white" id="exampleFormControlTextarea1" rows="3" name="noticia"></textarea>
                    </div>
                    <button type="submit" class="btn btn-success mt-3 mb-3"><i class="far fa-paper-plane"></i> Postar</button>
                </div>
            </form>
    <?php } }?>
    <?php while($dado = $pegar_noticias->fetch_array()) {?>
        <table class="table table-dark opacidade mt-3 mb-3">
            <thead>
                <tr>
                <th scope="col" class="text-center text-break"><?php echo $dado['titulo'] ?></th>
                </tr>
            </thead>
            <thead>
                <tr>
                <td scope="col" class="pl-5 text-break"><?php echo nl2br($dado['noticia']); ?></td>
                </tr>
            </thead>
            <thead>
                <tr>
                    <td scope="col"><?php echo "Por: ".$dado['nickname']; if(isset($_SESSION['page_access'])){if($_SESSION['page_access'] == 5){ ?>
                        <div class="btn-group ml-5">
                            <form method="post" action="noticia_edit">
                                <div class="form-group">
                                    <input type='hidden' name='id_noticia' value="<?php echo  $dado['id'] ?>">
                                    <button type="submit" name="btn_editar_noticia" class="btn p-0 m-0 mr-2 text-white"><i class="far fa-edit" style="font-size:24px;"></i></button>
                                </div>
                            </form>
                            |
                            <form method="post" action="">
                                <input type='hidden' name='id_noticia' value="<?php echo  $dado['id'] ?>">
                                <button type="submit" name="btn_deletar_noticia" class="btn p-0 m-0 ml-2 text-white"><i class="far fa-trash-alt" style="font-size:24px;"></i></button>
                            </form>
                        </div>
                    <?php }} ?>
                    </td>
                </tr>
            </thead>
        </table>
    <?php } ?>
</div>