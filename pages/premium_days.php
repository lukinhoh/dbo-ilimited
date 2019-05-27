<?php 
    session_start(); 

    if($_SESSION['page_access'] != 5){
        header("location: inicio");
    } 

    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        if(!isset($_POST['account_name'])){
            echo"<script language='javascript' type='text/javascript'>alert('Algo deu errado!');</script>";
        }

        $name = $_POST['account_name'];
        $days = $_POST['number_days'];
        if(get_user($name)){
            if(isset($_POST['premium_days'])){
                if($_POST['premium_days'] == 'add'){
                    if(add_premium_days($name, $days)){
                        echo"<script language='javascript' type='text/javascript'>alert('Premium Days adicionados com sucesso!');</script>";
                    }
                }
                if($_POST['premium_days'] == 'remove'){
                    if(remove_premium_days($name, $days)){
                        echo"<script language='javascript' type='text/javascript'>alert('Premium Days removidos com sucesso!');</script>";
                    }
                }
                if($_POST['premium_days'] == 'add_all'){
                    if(add_all_premium_days($days)){
                        echo"<script language='javascript' type='text/javascript'>alert('Premium Days adicionados para todas as contas com sucesso!');</script>";
                    }
                }
                if($_POST['premium_days'] == 'remove_all'){
                    if(remove_all_premium_days()){
                        echo"<script language='javascript' type='text/javascript'>alert('Premium Days removidos de todas as contas com sucesso!');</script>";
                    }
                }
            }
        }
    }

?>
<div class="col-sm-7">
    <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Adicionar Premium Days</h1></div>
    <form method="post" action="">
        <div class="form-group">
            <label for="account_name" class="font-weight-bold">Nome da Conta</label>
            <input type="text" name="account_name" class="form-control" id="account_name">
        </div>
        <div class="form-group">
            <label for="number_points" class="font-weight-bold">Premium Days</label>
            <input type="number" name="number_days" class="form-control" id="number_points">
        </div>
        <div class="form-group">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="premium_days" id="adicionar" value="add" checked>
                <label class="form-check-label" for="adicionar">
                    Adicionar
                </label>
                
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="premium_days" id="remover" value="remove">
                <label class="form-check-label" for="remover">
                    Remover
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="premium_days" id="adicionar_all" value="add_all">
                <label class="form-check-label" for="adicionar_all">
                    Adicionar Para Todos
                </label>
                
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="premium_days" id="remover_all" value="remove_all">
                <label class="form-check-label" for="remover_all">
                    Remover De Todos
                </label>
            </div>
        </div>
        
        <div class="form-group">
            <button type="submit" class="btn btn-outline-dark">Confirmar</button>
        </div>
    </form>
</div>