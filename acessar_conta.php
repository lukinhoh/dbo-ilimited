<?php
    
    require_once("system/db.php");
    session_start();

    if(!isset($_SESSION['logado'])){
        $_SESSION['logado'] = false;
    }

    $db = new db();
    $link = $db->conecta_mysqli();

    if($_SESSION['logado'] == false){

        if($_SERVER["REQUEST_METHOD"] === 'POST'){
            $usuario = $_POST['usuario'];
            $senha = sha1($_POST['senha']);

            // Verifica se $usuario foi iniciado e se está vazia, caso esteja vazia retorna para a página de login conta.
            if(isset($usuario) && empty($usuario)){
                echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o login!');window.location.href='/acessar_conta.php';</script>";
                exit;
            }

            // Verifica se $senha foi iniciado e se está vazia, caso esteja vazia retorna para a página de login conta.
            if(isset($senha) && empty($senha)){
                echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha a senha!');window.location.href='/acessar_conta.php';</script>";
                exit;
            }

            $checar_usuario_senha = mysqli_query($link, "SELECT id, name, nickname, page_access FROM accounts WHERE name = '$usuario' AND password = '$senha'");

            $nome = $checar_usuario_senha->fetch_array();

            if(mysqli_num_rows($checar_usuario_senha) == 1){
                // Logado
                echo"<script language='javascript' type='text/javascript'>alert('Logado com sucesso!');</script>";
                $_SESSION['logado'] = true;
                $_SESSION['nome'] = $nome['nickname'];
                $_SESSION['account_id'] = $nome['id'];
                $_SESSION['page_access'] = $nome['page_access'];
            } else {
                echo"<script language='javascript' type='text/javascript'>alert('Usuário ou senha incorreto!');</script>";
                session_destroy();
            }
        }
        //if(isset($_POST['usuario']) && isset($_POST['senha'])){
            
        //}
    }
    if($_SESSION['logado']){
        if(isset($_POST['sair'])){
            session_destroy();
            header("location: /acessar_conta.php");
        }
        if(isset($_POST['deletar'])){
            $id_delet = $_POST['id_deletar'];
            $del = "DELETE FROM players WHERE name = '$id_delet'";
            if(mysqli_query($link, $del)){
                echo"<script language='javascript' type='text/javascript'>alert('Character deletado!');</script>";
            }
        }

        $account_id = $_SESSION['account_id'];
        $checar_chars = mysqli_query($link, "SELECT name, vocation, level FROM players WHERE account_id = '$account_id'");
    }
?>

<!DOCTYPE html>
<html lang='pt-br'>
    <head>
        <meta charset='UTF-8'>
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='css/estilo.css'>
        <title>Acessar Conta</title>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg fixed-top">
            <ul class="navbar nav">
                <li class="nav-item"><a class="nav-link" href="index.php">Início</a></li>
                <li class="nav-item active"><a class="nav-link" href="acessar_conta.php">Acessar Conta</a></li>
                <li class="nav-item"><a class="nav-link" href="criar_conta.php">Criar Conta</a></li>
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
                            <?php if($_SESSION['logado'] == false) {?>
                                <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Acessar Conta</h1></div>
                                <form method="post">
                                    <div class="form-login">
                                        <div class="form-group">
                                            <label for="nome" class="font-weight-bold">Usuário</label>
                                            <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Digite seu usuário">
                                        </div>
                                        <div class="form-group">
                                            <label for="senha" class="font-weight-bold">Senha</label>
                                            <input type="password" class="form-control" id="senha" name="senha" placeholder="Digite sua senha">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-outline-dark">Entrar</button>
                                </form>
                                
                            <?php } elseif($_SESSION['logado'] == true) {?>
                                <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><?php echo "<h1 class='text-capitalize'>Seja Bem-Vindo, ".$_SESSION['nome']."! </h1>"; ?></div>
                                
                                <table class="table table-hover table-dark rounded">
                                    <div class="text-center font-weight-bold">Seus personagens</div>
                                    <thead>
                                        <tr>
                                        <th scope="col">Nome</th>
                                        <th scope="col">Vocation</th>
                                        <th scope="col">Level</th>
                                        <th scope="col">Editar</th>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <?php while($dado = $checar_chars->fetch_array()) {?>
                                            <tr>
                                                <td scope="col"><?php echo $dado['name']?></td>
                                                <?php
                                                    if($dado['vocation'] != 8){
                                                        $checar_chars2 = mysqli_query($link, "SELECT name, vocation FROM players WHERE account_id = 1 AND vocation = ".$dado['vocation']);
                                                        while($dado2 = $checar_chars2->fetch_array()){
                                                ?>
                                                <td scope="col"><?php echo explode(" ", $dado2['name'])[0]?></td>
                                                    <?php }} else { ?>
                                                        <td scope="col"><?php echo "ADMIN"?></td>
                                                    <?php } ?>
                                                <td scope="col"><?php echo $dado['level']?></td>
                                                <td scope="col">
                                                    <form method="post" action="">
                                                        <input type='hidden' name='id_deletar' value="<?php echo  $dado['name'] ?>">
                                                        <button type="submit" name="deletar" class="btn btn-primary p-0 mt-0">Deletar</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        <?php } ?>
                                    </thead>
                                </table>
                                <a href="criar_personagem.php" class="btn btn-outline-dark">Create Character</a>
                                <form method="post" action="">
                                    <button type="submit" name="sair" class="btn btn-outline-dark">Logout</button>
                                </form>
                            <?php } ?>
                        </div>
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </body>
</html