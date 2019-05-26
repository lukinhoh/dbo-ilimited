<?php
    session_start();
    if($_SESSION['logado'] == true){
        session_destroy();
    }

    require_once "system/db.php";
    
    if($_SERVER["REQUEST_METHOD"] === 'POST'){
        $usuario = $_POST['usuario'];
        $email = $_POST['email'];
        $senha = sha1($_POST['senha']);
        $nickname = $_POST['nickname'];

        // Verifica se $usuario foi iniciado e se está vazia, caso esteja vazia retorna para a página de criar conta.
        if(isset($usuario) && empty($usuario)){
            echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o login!');window.location.href='/criar_conta.php';</script>";
            exit;
        }

        // Verifica se $email foi iniciado e se está vazia, caso esteja vazia retorna para a página de criar conta.
        if(isset($email) && empty($email)){
            echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o email!');window.location.href='/criar_conta.php';</script>";
            exit;
        }

        // Verifica se $senha foi iniciado e se está vazia, caso esteja vazia retorna para a página de criar conta.
        if(isset($senha) && empty($senha)){
            echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha a senha!');window.location.href='/criar_conta.php';</script>";
            exit;
        }   

        $database = new db();
        $link = $database->conecta_mysqli();
        
        $checar_usuario = mysqli_query($link, "SELECT name FROM accounts WHERE name = '$usuario'");

        $checar_email = mysqli_query($link, "SELECT email FROM accounts WHERE email = '$email'");

        $criar = "INSERT INTO accounts (name, email, password, nickname) VALUES ('$usuario', '$email', '$senha', '$nickname')";
        // Checagem se já existe usuario e email no banco de dados, caso não exista, cria a conta.
        if(mysqli_num_rows($checar_usuario) == 0){
            if(mysqli_num_rows($checar_email) == 0){
                // executar a query
                if(mysqli_query($link, $criar)){
                    echo"<script language='javascript' type='text/javascript'>alert('Conta criada com sucesso!');window.location.href='/acessar_conta.php';</script>";
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

<!DOCTYPE html>
<html lang='pt-br'>
    <head>
        <meta charset='UTF-8'>
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='css/estilo.css'>
        <title>Criar Conta</title>
    </head>
    <body>
        <nav class="navbar fixed-top">
            <ul class="navbar nav">
                <li class="nav-item"><a class="nav-link" href="index.php">Início</a></li>
                <li class="nav-item"><a class="nav-link" href="acessar_conta.php">Acessar Conta</a></li>
                <li class="nav-item active"><a class="nav-link" href="criar_conta.php">Criar Conta</a></li>
                <li class="nav-item"><a class="nav-link" href="downloads.php">Download</a></li>
                <li class="nav-item"><a class="nav-link" href="shopping.php">Shopping</a></li>
            </ul>
        </nav>
        <div class="corpo">
            <main role="main" class="container">
                <div class="jumbotron">
                    <div class="row">
                        <div class="col-sm">
                        </div>
                        <div class="col-sm-6">
                            <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Criar Conta</h1></div>
                            <form method="post" action="">
                                <div class="form-login">
                                <div class="form-group">
                                    <label for="usuario" class="font-weight-bold">Usuário</label>
                                    <input type="text" class="form-control" id="usuario" name="usuario">
                                </div>
                                <div class="form-group">
                                    <label for="nickname" class="font-weight-bold">Seu Nome</label>
                                    <input type="text" class="form-control" id="nickname" name="nickname">
                                </div>
                                <div class="form-group">
                                    <label for="email" class="font-weight-bold">Email</label>
                                    <input type="email" class="form-control" id="email" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="senha" class="font-weight-bold">Senha</label>
                                    <input type="password" class="form-control" id="senha" name="senha">
                                </div>
                                <label>Ao criar você estará aceitando os termos do serviço.</label>
                                </div>
                                <button type="submit" class="btn btn-outline-dark">Cadastrar</button>
                            </form>
                        </div>
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html