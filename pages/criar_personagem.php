<?php
    require_once("system/db.php");
    session_start();

    if(!isset($_SESSION['logado'])){
        $_SESSION['logado'] = false;
    }
    if($_SESSION['logado'] == false){
        session_destroy();
        header("location: /acessar_conta");
    }

    // Checa se as informações foram iniciadas
    if($_SERVER["REQUEST_METHOD"] === 'POST'){
        $nick = $_POST['nick'];
        $vocation = $_POST['vocation'];
        $account_id = $_SESSION['account_id'];
        // Checa se o nickname está vazio
        if(isset($nick) && empty($nick)){
            echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o Nome!');window.location.href='/criar_personagem';</script>";
            exit;
        }

        $pegar_dados = get_attributes($vocation);

        $dados = $pegar_dados->fetch_array();

        $health = $dados['health'];
        $healthmax = $dados['healthmax'];
        $lookbody = $dados['lookbody'];
        $lookfeet = $dados['lookfeet'];
        $lookhead = $dados['lookhead'];
        $looklegs = $dados['looklegs'];
        $looktype = $dados['looktype'];
        $lookaddons = $dados['lookaddons'];
        $mana = $dados['mana'];
        $manamax = $dados['manamax'];
        $soul = $dados['soul'];
        $town_id = $dados['town_id'];
        $cap = $dados['cap'];
        $sex = $dados['sex'];
        $save = $dados['save'];
        $skull = $dados['skull'];
        $stamina = $dados['stamina'];
        $direction = $dados['direction'];
        $loss_experience = $dados['loss_experience'];
        $loss_mana = $dados['loss_mana'];
        $loss_skills = $dados['loss_skills'];
        $loss_containers = $dados['loss_containers'];
        $loss_items = $dados['loss_items'];
        $create_date = date('d/m/y');

        $get_char = get_char_by_account_id($account_id);
        if(mysqli_num_rows($get_char) == 10){
            echo"<script language='javascript' type='text/javascript'>alert('Limite de personagens criados esgotado!');window.location.href='/acessar_conta';</script>";
            exit();
        }
        // Checa se nickname existe
        if(mysqli_num_rows(get_player_name($nick)) == 0){
            if(insert_new_char($nick, $account_id, $vocation, $health, $healthmax, $lookbody, $lookfeet, $lookhead, $looklegs, $looktype, $lookaddons, $mana, $manamax, $soul, $town_id, $cap, $sex, $save, $skull, $stamina, $direction, $loss_experience, $loss_mana, $loss_skills, $loss_containers, $loss_items, $create_date)){
                echo"<script language='javascript' type='text/javascript'>alert('Character criado com sucesso!');window.location.href='/acessar_conta';</script>";
                exit();
            }
        } else {
            echo"<script language='javascript' type='text/javascript'>alert('Nome já existe!');</script>";
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
        <button type="submit" class="btn btn-outline-dark">Criar</button>
    </form>
</div>