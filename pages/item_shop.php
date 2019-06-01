<?php 
    // checar o status da sessão, se for disabled ou none, inicia uma nova sessão, se variavel logado não for true volta pra pagina de login
    if(check_session()){
        if(!isset($_SESSION['logado']) || $_SESSION['logado'] === false){
            return session_destroy() && alert('Você precisa estar logado!', 'acessar_conta');
        }
        if(isset($_SESSION['page_access']) && $_SESSION['page_access'] != 5){
            return header('location: 404');
        }
    }

    require_once("system/db.php");

    if(isset($_POST['deletar_item_shop'])){
        $item_shop_id = $_POST['item_shop_id'];
        return delet_item_shop_by_id($item_shop_id);
    }

    if(isset($_POST['add_item_shop']) && !empty($_POST['offer_name'])){
        $formatos_permitidos = array("png", "jpeg", "jpg", "gif");
        $extensao = pathinfo($_FILES['img']['name'], PATHINFO_EXTENSION);
        
        $offer_name = $_POST['offer_name'];
        $offer_description = $_POST['offer_description'];
        $itemid = $_POST['itemid'];
        $points = $_POST['points'];
        $count = $_POST['count'];
        $offer_type = $_POST['offer_type'];

        if(in_array($extensao, $formatos_permitidos)){
            $img_url = "imagens/icons/";
            $temp = $_FILES['img']['tmp_name'];
            $img_name = $offer_name.".$extensao";
            //$img_name = $_FILES['img']['name'];
            //$novo_nome = uniqid().".$extensao";
            if(move_uploaded_file($temp, $img_url.$img_name)){
                if(insert_item_shop($offer_name, $offer_description, $offer_type, $itemid, $count, $points) && insert_img_item_shop($img_name, $itemid, $img_url)){
                    alert('Item adicionado com sucesso.');
                }
            }
        } else {
            return alert('Extensão de imagem invalida', 'painel_admin');
        }

        
    } elseif(isset($_POST['add_item_shop']) && empty($_POST['offer_name'])) {
        return alert('Preencha o campo name');
    }

    $get_points = get_points($_SESSION['name']);
    $get_shop_items = get_shop_items();
    

?>

<div class="col-sm-7">
    <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Items Shop</h1></div>
    <!-- Fim do grupo de botões -->
    <!-- Inicio do formulário de adicionar item ao shop -->
    <form method="post" action="" enctype="multipart/form-data">
        <div class="form-login font-weight-bold">
            <div class="form-group">
                <label for="item_name">Item name</label>
                <input type="text" class="form-control" id="item_name" name="offer_name">
            </div>
            <div class="form-group">
                <label for="item_description">Item description</label>
                <input type="text" class="form-control" id="item_description" name="offer_description">
            </div>
            <div class="form-group">
                <label for="itemid">Item ID</label>
                <input type="text" class="form-control" id="itemid" name="itemid">
            </div>
            <div class="form-group">
                <label for="points">Points</label>
                <input type="number" class="form-control" id="points" name="points">
            </div>
            <div class="form-group">
                <label for="count">Count</label>
                <input type="number" class="form-control" id="count" name="count">
            </div>
            <div class="form-group">
                <label for="img">Icon Image</label>
                <input type="file" class="form-control-file" id="img" name="img">
            </div>
            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="offer_type" id="item" value="item" checked>
                    <label class="form-check-label" for="item">
                        item
                    </label>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-dark mt-3 mb-3" name="add_item_shop"><i class="far fa-paper-plane"></i> Adicionar Item</button>
    </form>
    <!-- fim do formulário de adicionar item ao shop -->
    <!-- inicio da listagem de items do shop com botão de deletar -->
    <table class="table table-bordered table-dark">
        <thead>
            <tr>
                <th>Item</th>
                <th>Descrição</th>
                <th colspan="2">Pontos</th>
            </tr>
        </thead>
        <thead>
            <?php while($dado = $get_shop_items->fetch_array()) {?>
                <tr>
                    <?php $get_shop_images = get_shop_items_images($dado['itemid']); $img_nome = $get_shop_images['img_name']?>
                    <td scope="col"><?php  echo "<img src='imagens/icons/$img_nome'"; ?></td>
                    <td scope="col"><?php echo "<strong>".$dado['offer_name']."</strong><br>".$dado['offer_description'];?></td>
                    <td scope="col"><?php echo $dado['points']?></td>
                    <td scope="col">
                        <form method="post" action="">
                            <input type='hidden' name='item_shop_id' value="<?php echo  $dado['itemid']; ?>">
                            <button type="submit" id="deletar_item_shop" name="deletar_item_shop" class="btn btn-dark p-0 mt-0"><i class="far fa-trash-alt"></i></button>
                        </form>
                    </td>
                </tr>
            <?php } ?>
        </thead>
    </table>
    <!-- fim da listagem de items -->
</div>
