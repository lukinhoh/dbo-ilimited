<?php 
    // checar o status da sessão, se for disabled ou none, inicia uma nova sessão, se variavel logado não for true volta pra pagina de login
    if(check_session()){
        if(!isset($_SESSION['logado']) || $_SESSION['logado'] === false){
            return session_destroy() && alert('Você precisa estar logado!', 'acessar_conta');
        }
    }

    require_once("system/db.php");
   
    $account_id = $_SESSION['account_id'];
    $itemid = $_POST['id_comprar'];
    $item = get_item_by_id($itemid);

    $name = $_SESSION['name'];
    $get_points = get_points($name);
    $get_shop_items = get_shop_items();


    if(isset($_POST['finalizar_compra'])){
        $points = $get_points['premium_points'];
        $item_price = $item['points'];
        if($points < $item_price){
            return alert('Você não tem premium points suficientes', 'shopping');
        }
        $player_name = $_POST['player_name'];
        $item_id = $item['itemid'];
        $item_count = $item['count'];
        $item_type = $item['offer_type'];
        $item_name = $item['offer_name'];

        if($item_type == 'item'){
            if(insert_item_comunication($player_name, $item_type, $item_id, $item_name, $item_count) && remove_points($name, $item['points'])){
                return alert('Seu item será enviado para o seu inventário em alguns segundos!', 'shopping');
            }
        }
    }
    
?>

<div class="col-sm-7">
    <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Finalizar Compra</h1></div>

    <table class="table table-bordered table-dark">
        <form method="post" action="" id="form_finalizar_compra">
            <?php if($item['offer_type'] == 'item') {?>
                <div class="form-group text-center">
                    <label for="select_char" class="border-bottom border-top border-dark p-3 mb-3 bg-white rounded">Escolha o char que vai receber o item <strong><?php echo $item['offer_name']; ?></strong></label><br>
                    <select class="form-control" name="player_name" id="select_char">
                        <?php $get_char = get_char_by_account_id($account_id); ?>
                        <?php while($dado = $get_char->fetch_array()) {?>
                            <option value="<?php echo $dado['name'] ?>"><?php echo $dado['name'] ?></option>
                        <?php } ?>
                    </select>
                </div>
            <?php } ?>
            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group mr-4" role="group" aria-label="First group">
                    <input type='hidden' name='id_comprar' value="<?php echo  $item['itemid'] ?>">
                    <button type="submit" class="btn btn-dark" name="finalizar_compra">Finalizar Compra</button>
                </div>
                <div class="btn-group mr-2" role="group" aria-label="Second group">
                    <a type="submit" class="btn btn-dark" href="shopping">Cancelar</a>
                </div>
            </div>
        </form>
    </table>
</div>
