<?php 
    session_start(); 

    if($_SESSION['page_access'] != 5){
        header("location: 404");
    } 

    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        if(isset($_POST['account_name']) && empty($_POST['account_name'])){
            echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o campo Nome da Conta!');</script>";
        }
        if(isset($_POST['number_points']) && empty($_POST['number_points'])){
            echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha a quantidade de pontos!');</script>";
        }

        $name = $_POST['account_name'];
        $points = $_POST['number_points'];
        if(get_user($name)){
            if(isset($_POST['points'])){
                if($_POST['points'] == 'add'){
                    if(insert_points($name, $points)){
                        echo"<script language='javascript' type='text/javascript'>alert('Pontos adicionados com sucesso!');</script>";
                    }
                }
                if($_POST['points'] == 'remove'){
                    if(remove_points($name, $points)){
                        echo"<script language='javascript' type='text/javascript'>alert('Pontos removidos com sucesso!');</script>";
                    }
                }
            }
        }
    }

?>
<div class="col-sm-7">
    <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Adicionar Pontos</h1></div>
    <form method="post" action="">
        <div class="form-group">
            <label for="account_name" class="font-weight-bold">Nome da Conta</label>
            <input type="text" name="account_name" class="form-control" id="account_name">
        </div>
        <div class="form-group">
            <label for="number_points" class="font-weight-bold">Pontos</label>
            <input type="number" name="number_points" class="form-control" id="number_points">
        </div>
        <div class="form-group">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="points" id="adicionar" value="add" checked>
                <label class="form-check-label" for="adicionar">
                    Adicionar
                </label>
                
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="points" id="remover" value="remove">
                <label class="form-check-label" for="remover">
                    Remover
                </label>
            </div>
        </div>
        
        <div class="form-group">
            <button type="submit" class="btn btn-outline-dark">Confirmar</button>
        </div>
    </form>
</div>

