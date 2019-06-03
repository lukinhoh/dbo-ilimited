<?php
    session();

    if(isset($_SESSION['page_access'])){
        if($_SESSION['page_access'] == 0){
            header("location: 404");
        }
    }else{
        header("location: 404");
    }
?>

<div class="col-sm-7">
    <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Painel Admin</h1></div>
    <table class="table table-hover table-dark text-center rounded">
        <thead>
            <tr>
                <th><a class="btn btn-secondary" href="points">Premium Pontos</a></th>
                <th><a class="btn btn-secondary" href="premium_days">Premium Days</a></th>
                <th><a class="btn btn-secondary" href="item_shop">Item Shop</a></th>
            </tr>
        </thead>
    </table>

</div>

