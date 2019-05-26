<?php
    require_once("system/db.php");
    session_start();

    if(!isset($_SESSION['logado'])){
        $_SESSION['logado'] = false;
    }
    if($_SESSION['logado'] == false){
        session_destroy();
        header("location: /acessar_conta.php");
    }

    $db = new db();
    $link = $db->conecta_mysqli();

    // Checa se as informações foram iniciadas
    if($_SERVER["REQUEST_METHOD"] === 'POST'){
        $nick = $_POST['nick'];
        $vocation = $_POST['vocation'];
        $account_id = $_SESSION['account_id'];
        // Checa se o nickname está vazio
        if(isset($nick) && empty($nick)){
            echo"<script language='javascript' type='text/javascript'>alert('Porfavor preencha o Nome!');window.location.href='/criar_personagem.php';</script>";
            exit;
        }

        $buscar_nick = $db->pegar_name($link, $nick);

        $pegar_dados = mysqli_query($link, "SELECT health, healthmax, lookbody, lookfeet, lookhead, looklegs, looktype, lookaddons, mana, manamax, soul, town_id, cap, sex, save, skull, stamina, direction, loss_experience, loss_mana, loss_skills, loss_containers, loss_items FROM players WHERE vocation = '$vocation'");

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

        $inserir_dados = "INSERT INTO players (name, account_id, vocation, health, healthmax, lookbody, lookfeet, lookhead, looklegs, looktype, lookaddons, mana, manamax, soul, town_id, cap, sex, save, skull, stamina, direction, loss_experience, loss_mana, loss_skills, loss_containers, loss_items) VALUES('$nick', '$account_id', '$vocation', '$health', '$healthmax', '$lookbody', '$lookfeet', '$lookhead', '$looklegs', '$looktype', '$lookaddons', '$mana', '$manamax', '$soul', '$town_id', '$cap', '$sex', '$save', '$skull', '$stamina', '$direction', '$loss_experience', '$loss_mana', '$loss_skills', '$loss_containers', '$loss_items')";

        // Checa se nickname existe
        if(mysqli_num_rows($buscar_nick) == 0){
            if(mysqli_query($link, $inserir_dados)){
                echo"<script language='javascript' type='text/javascript'>alert('Character criado com sucesso!');window.location.href='/acessar_conta.php';</script>";
                exit();
            }
        } else {
            echo"<script language='javascript' type='text/javascript'>alert('Nome já existe!');</script>";
        }
    }
    
    

    
?>

<!DOCTYPE html>
<html lang='pt-br'>
    <head>
        <meta charset='UTF-8'>
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='css/estilo.css'>
        <title>Create Character</title>
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
                            <div class="page-header text-center border border-dark shadow-sm p-3 mb-5 bg-white rounded"><h1>Create Character</h1></div>
                            <form method="post" action="">
                                <div class="form-login">
                                    <div class="form-group">
                                        <label for="nick" class="font-weight-bold">Nome</label>
                                        <input type="text" class="form-control" id="nick" name="nick" placeholder="Nome do character">
                                    </div>
                                    <div class="form-group">
                                        <label for="select" class="font-weight-bold">Vocação</label>
                                        <select id="select" name="vocation" class="form-control">
                                            <option value="230">Bardock</option>
                                            <option value="127">Brolly</option>
                                            <option value="364">Bulma</option>
                                            <option value="340">C16</option>
                                            <option value="45">C17</option>
                                            <option value="140">C18</option>
                                            <option value="83">Cell</option>
                                            <option value="178">Chibi Trunks</option>
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
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html