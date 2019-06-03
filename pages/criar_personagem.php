<?php
    session_start();

    if(!isset($_SESSION['logado'])){
        $_SESSION['logado'] = false;
    }
    if($_SESSION['logado'] == false){
        session_destroy();
        return header("location: /acessar_conta");
    }

    // Checa se as informações foram iniciadas
    if($_SERVER["REQUEST_METHOD"] === 'POST'){
        $nick = $_POST['nick'];
        $vocation = $_POST['vocation'];
        $account_id = $_SESSION['account_id'];
        // Checa se o nickname está vazio
        //if(isset($nick) && empty($nick)){
        //    return alert('Por favor preencha o Nome!', 'criar_personagem');
        //}

        $new_char = new Character();
        $new_char->set_name($nick);
        $new_char->set_account_id($account_id);
        $new_char->set_vocation($vocation);
        
        $get_char = get_char_by_account_id($account_id);
        if(mysqli_num_rows($get_char) == 10){
            return alert('Limite de personagens criados esgotado!', 'acessar_conta');
        }
        // Checa se nickname existe
        if(mysqli_num_rows(get_player_name($nick)) == 0){
            if($new_char->create_character()){
                return alert('Character criado com sucesso!', 'acessar_conta');
            }
        } else {
            return alert('Nome já existe!','acessar_conta');
        }
    }
    
?>
<div class="col-sm-7">
    <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Create Character</h1></div>
    <form method="post" action="">
        <div class="form-login">
            <div class="form-group">
                <label for="nick" class="font-weight-bold">Nome</label>
                <input type="text" class="form-control" id="nick" name="nick" placeholder="Nome do character" required>
            </div>
            <div class="form-group">
                <label for="select" class="font-weight-bold">Vocação</label>
                <select id="select" name="vocation" class="form-control" required>
                    <option value="230">Bardock</option>
                    <option value="127">Brolly</option>
                    <option value="364">Bulma</option>
                    <option value="340">C16</option>
                    <option value="45">C17</option>
                    <option value="140">C18</option>
                    <option value="83">Cell</option>
                    <option value="192">Cooler</option>
                    <option value="206">Dende</option>
                    <option value="95">Freeza</option>
                    <option value="57">Gohan</option>
                    <option value="1">Goku</option>
                    <option value="292">Janemba</option>
                    <option value="316">Jenk</option>
                    <option value="268">Kaio</option>
                    <option value="244">Kuririn</option>
                    <option value="111">Majin Boo</option>
                    <option value="256">Pan</option>
                    <option value="32">Piccolo</option>
                    <option value="328">Raditz</option>
                    <option value="304">Tenshinhan</option>
                    <option value="352">Turles</option>
                    <option value="71">Trunks</option>
                    <option value="218">Tsuful</option>
                    <option value="152">Uub</option>
                    <option value="17">Vegeta</option>
                    <option value="280">Videl</option>
                </select>
            </div>
        </div>
        <button type="submit" class="btn btn-outline-dark mt-3">Criar</button>
    </form>
</div>