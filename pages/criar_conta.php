<?php
    session_start();
    if(isset($_SESSION['logado'])){
        if($_SESSION['logado'] == true){
            session_destroy();
        }
    } else {
        $_SESSION['logado'] = false;
    }

    require_once "system/db.php";
    
    if($_SERVER["REQUEST_METHOD"] === 'POST'){
        $usuario = $_POST['usuario'];
        $email = $_POST['email'];
        $senha = sha1($_POST['senha']);
        $nickname = $_POST['nickname'];

        // Verifica se $usuario foi iniciado e se está vazia, caso esteja vazia retorna para a página de criar conta.
        if(isset($usuario) && empty($usuario)){
            echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o login!');window.location.href='/criar_conta';</script>";
            exit;
        }

        // Verifica se $email foi iniciado e se está vazia, caso esteja vazia retorna para a página de criar conta.
        if(isset($email) && empty($email)){
            echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o email!');window.location.href='/criar_conta';</script>";
            exit;
        }

        // Verifica se $senha foi iniciado e se está vazia, caso esteja vazia retorna para a página de criar conta.
        if(isset($senha) && empty($senha)){
            echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha a senha!');window.location.href='/criar_conta';</script>";
            exit;
        }   

        // Checagem se já existe usuario e email no banco de dados, caso não exista, cria a conta.
        if(mysqli_num_rows(get_user($usuario)) == 0){
            if(mysqli_num_rows(get_email($email)) == 0){
                // executar a query
                if(insert_new_account($usuario, $email, $senha, $nickname)){
                    echo"<script language='javascript' type='text/javascript'>alert('Conta criada com sucesso!');window.location.href='/acessar_conta';</script>";
                    exit();
                }
            } else{
                echo"<script language='javascript' type='text/javascript'>alert('Email já existe!');</script>";
            }
        } else {
            echo"<script language='javascript' type='text/javascript'>alert('Usuário já existe!');</script>";
        }
    }
    
?>
<div class="col-sm-7">
    <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Criar Conta</h1></div>
    <form method="post" action="">
        <div class="form-login">
        <div class="form-group">
            <label for="usuario" class="font-weight-bold">Usuário</label>
            <input type="text" class="form-control" id="usuario" name="usuario" required>
        </div>
        <div class="form-group">
            <label for="nickname" class="font-weight-bold">Seu Nome</label>
            <input type="text" class="form-control" id="nickname" name="nickname" required>
        </div>
        <div class="form-group">
            <label for="email" class="font-weight-bold">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="senha" class="font-weight-bold">Senha</label>
            <input type="password" class="form-control" id="senha" name="senha" required>
        </div>
        <label>Ao criar conta você estará aceitando os termos do serviço.</label>
        </div>
        <button type="submit" class="btn btn-outline-dark">Cadastrar</button>
    </form>
</div>