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
    <div class="text-center border border-dark shadow-sm p-3 mb-5 text-white rounded opacidade"><h1>Painel Admin</h1></div>
    <table class="table table-hover table-dark text-center rounded opacidade">
        <thead>
            <tr>
                <th>Site</th>
                <th>Accounts</th>
                <th>Shop</th>
            </tr>
        </thead>
        <thead>
            <tr>
                <td>
                    <div class="btn-group-vertical" role="group" aria-label="Basic example">
                        <a type="button" class="btn btn-secondary mb-2" href="points">Img Background</a>
                    </div>
                </td>
                <td>
                    <div class="btn-group-vertical" role="group" aria-label="Basic example">
                        <a type="button" class="btn btn-secondary mb-2" href="points">Premium Pontos</a>
                        <a type="button" class="btn btn-secondary mb-2" href="premium_days">Premium Days</a>
                    </div>
                </td>
                <td>
                    <div class="btn-group-vertical">
                        <a type="button" class="btn btn-secondary mb-2" href="item_shop">Item Shop</a>              
                    </div>
                </td>
            </tr>
        </thead>
    </table>

</div>

