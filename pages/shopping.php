<?php
    session_start();
    if($_SESSION['logado'] == false){
        echo"<script language='javascript' type='text/javascript'>alert('Você precisa estar logado!');window.location.href='/acessar_conta';</script>";
        session_destroy();
        exit();
    }

    require_once "system/db.php";

    
?>

<div class="col-sm-7">
    <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Shopping</h1></div>
    <h5 class="font-weight-bold">Você tem <?php $get_points = get_points($_SESSION['name']); echo $get_points['premium_points']; ?> Pontos</h><br><br>
    <a href="comprar_pontos" class="btn btn-outline-dark">Comprar Pontos</a><br><br>
    <table class="table table-bordered table-dark">
        <thead>
            <tr>
                <th>Item</th>
                <th>Descrição</th>
                <th colspan="2">Pontos</th>
            </tr>
        </thead>
        <thead>
            <?php $get_shop_items = get_shop_items(); ?>
            <?php while($dado = $get_shop_items->fetch_array()) {?>
                <tr>
                    <td scope="col"><?php echo $dado['offer_name']?></td>
                    <td scope="col"><?php echo $dado['offer_description']?></td>
                    <td scope="col"><?php echo $dado['points']?></td>
                    <td scope="col">
                        <form method="post" action="">
                            <input type='hidden' name='id_comprar' value="<?php echo  $dado['itemid'] ?>">
                            <button type="submit" name="comprar" class="btn btn-dark p-0 mt-0">Comprar</button>
                        </form>
                    </td>
                </tr>
            <?php } ?>
        </thead>
    </table>
</div>
