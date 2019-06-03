<?php
    session();
    
    if(isset($_SESSION['logado'])){
        if($_SESSION['logado'] == true){
            session_destroy();
        }
    } else {
        $_SESSION['logado'] = false;
    }
    
    if($_SERVER["REQUEST_METHOD"] === 'POST'){
        $user = $_POST['usuario'];
        $email = $_POST['email'];
        $password = sha1($_POST['senha']);
        $nickname = $_POST['nickname'];

        // Verifica se $user foi iniciado e se está vazia, caso esteja vazia retorna para a página de criar conta.
        if(isset($user) && empty($user)){
            return alert('Preencha o campo usuário', 'criar_conta');
        }

        // Verifica se $email foi iniciado e se está vazia, caso esteja vazia retorna para a página de criar conta.
        if(isset($email) && empty($email)){
            return alert('Preencha o campo email', 'criar_conta');
        }

        // Verifica se $password foi iniciado e se está vazia, caso esteja vazia retorna para a página de criar conta.
        if(isset($password) && empty($password)){
            return alert('Preencha o campo senha', 'criar_conta');
        }   

        if(isset($nickname) && empty($nickname)){
            return alert('Preencha o campo nickname', 'criar_conta');
        }
        
        $new_account = new Account();
        $new_account->set_user($user);
        $new_account->set_password($password);
        $new_account->set_email($email);
        $new_account->set_nickname($nickname);
        $new_account->set_status();
        $new_account->set_ip();
        $new_account->create_account();

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
        <button type="submit" class="btn btn-outline-dark mt-3">Cadastrar</button>
    </form>
</div>