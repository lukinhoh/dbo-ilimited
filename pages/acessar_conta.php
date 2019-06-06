<?php
    // checar o status da sessão, se for disabled ou none, inicia uma nova sessão, se variavel logado não for true volta pra pagina de login
    session();
    
    if($_SESSION['logado'] === false){

        if($_SERVER["REQUEST_METHOD"] === 'POST'){
            $usuario = $_POST['usuario'];
            $senha = sha1($_POST['senha']);

            // Verifica se $usuario foi iniciado e se está vazia, caso esteja vazia retorna para a página de login conta.
            if(isset($usuario) && empty($usuario)){
                echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o login!');window.location.href='/acessar_conta';</script>";
                exit;
            }

            // Verifica se $senha foi iniciado e se está vazia, caso esteja vazia retorna para a página de login conta.
            if(isset($senha) && empty($senha)){
                echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha a senha!');window.location.href='/acessar_conta';</script>";
                exit;
            }

            $checar_usuario_e_senha = checar_usuario_e_senha($usuario, $senha);

            if(mysqli_num_rows($checar_usuario_e_senha) == 1){
                $dados_usuario = $checar_usuario_e_senha->fetch_array();
                // Logado
                $_SESSION['logado'] = true;
                $_SESSION['nome'] = $dados_usuario['nickname'];
                $_SESSION['name'] = $dados_usuario['name'];
                $_SESSION['account_id'] = $dados_usuario['id'];
                $_SESSION['page_access'] = $dados_usuario['page_access'];
            } else {
                //echo"<script language='javascript' type='text/javascript'>alert('Usuário ou senha incorreto!');</script>";
                $erro = 1;
                session_destroy();
            }
        }
        //if(isset($_POST['usuario']) && isset($_POST['senha'])){
            
        //}
    }
    if($_SESSION['logado']){
        if(isset($_POST['sair'])){
            return session_destroy() && header("location: /acessar_conta");
        }
        if(isset($_POST['deletar'])){
            $id_delet = $_POST['id_deletar'];
            if(delet_by_id($id_delet)){
                return alert('Character deletado!', 'acessar_conta');
            }
        }

        $account_id = $_SESSION['account_id'];
    }
?>
<div class="col-sm-7">
    <?php if($_SESSION['logado'] == false) {?>
        <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 text-white opacidade rounded"><h1>Acessar Conta</h1></div>
        <form method="post" class="w-50 mx-auto text-center">
            <div class="form-login text-white opacidade p-3">
                <div class="form-group">
                    <label for="campo_usuario" class="font-weight-bold">Usuário</label>
                    <input type="text" class="form-control" id="campo_usuario" name="usuario" placeholder="Digite seu usuário" required>
                </div>
                <div class="form-group">
                    <label for="campo_senha" class="font-weight-bold">Senha</label>
                    <input type="password" class="form-control" id="campo_senha" name="senha" placeholder="Digite sua senha" required>
                </div>
                <button type="submit" class="btn btn-primary btn-lg btn-block" id="btn_entrar"><i class="fas fa-unlock-alt"></i> Entrar</button>
            </div>
        </form>
        <?php 
            if(isset($erro) && $erro == 1){
                echo "<br><font color='#FF0000'>Usuário ou senha inválido(s)</font>" ;
            }
        ?>
    <?php } elseif($_SESSION['logado'] == true) {?>
        <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 rounded opacidade text-white"><?php echo "<h1 class='text-capitalize'>Seja Bem-Vindo, ".$_SESSION['nome']."! </h1>"; ?></div>
        <!-- Aqui começa a exibição de informações -->
        <div class="border border-dark shadow-sm p-3 mb-3 text-white opacidade rounded">
            <h3 class="text-center font-weight-bold border-bottom mb-3">Suas informações</h3>
            <h5 class="font-weight-bold">Nome: <?php echo $_SESSION['nome']; ?></h>
            <h5 class="font-weight-bold">Premium Days: <?php $get_points = get_premium_days($_SESSION['name']); echo $get_points['premdays']; ?></h>
            <h5 class="font-weight-bold">Premium Points: <?php $get_points = get_points($_SESSION['name']); echo $get_points['premium_points']; ?></h>
        </div>
        <!-- Aqui termina exibição de informações -->
        <!-- Exibi os botões -->
        <form method="post" action="">
            <div class="form-group"></div>
            
            <div class="form-group"></div>
        </form>
        <div class="btn-group mb-3">
            <a href="criar_personagem" class="btn btn-success mr-3 rounded"><i class="fas fa-user-plus"></i> Create Character</a>
            <?php if($_SESSION['page_access'] == 5){ ?>
                <a href="painel_admin" class="btn btn-light mr-3 rounded"><i class="fas fa-wrench"></i> Painel Admin</a>
            <?php } ?>
            <form action="" method="post"><button type="submit" name="sair" class="btn btn-danger mr-3"><i class="fas fa-sign-in-alt"></i> Logout</button></form>
        </div>
        <!-- Termina parte dos botões -->
        <!-- Aqui começa exibição de personagens -->
        <table class="table text-white opacidade rounded">
            <h3 class="text-center font-weight-bold text-white opacidade mb-0">Seus Personagens</h3>
            <thead>
                <tr>
                    <th scope="col">Nome</th>
                    <th scope="col">Vocation</th>
                    <th scope="col">Level</th>
                    <th scope="col">Editar</th>
                </tr>
            </thead>
            <thead>
                <?php $get_char = get_char_by_account_id($account_id); ?>
                <?php while($dado = $get_char->fetch_array()) {?>
                    <tr>
                        <td scope="col"><?php echo $dado['name']?></td>
                        <?php
                            if($dado['vocation'] != 8){
                                $voc = get_char_by_vocation($dado['vocation']);
                                while($dado2 = $voc->fetch_array()){
                        ?>
                        <td scope="col"><?php echo explode(" ", $dado2['name'])[0]?></td>
                            <?php }} elseif($dado['vocation'] == 8) { ?>
                                <td scope="col"><?php echo "Admin"?></td>
                            <?php } ?>
                        <td scope="col"><?php echo $dado['level']?></td>
                        <td scope="col">
                            <form method="post" action="">
                                <input type='hidden' name='id_deletar' value="<?php echo  $dado['name'] ?>">
                                <button type="submit" name="deletar" class="btn p-0 mt-0"><i class="fas fa-trash text-white bg-transparent" style="font-size:24px;"></i></button>
                            </form>
                        </td>
                    </tr>
                <?php } ?>
            </thead>
        </table>
        <!-- Aqui termina a exibição de personagens -->
    <?php } ?>

</div>
