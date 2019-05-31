<?php
    function checar_usuario_e_senha($user, $password){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT id, name, nickname, page_access FROM accounts WHERE name = '$user' AND password = '$password'");
    }

    function pegar_chars_on(){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT COUNT(online) AS all_online FROM players WHERE online > 0")->fetch_array();
    }

    function get_char_by_account_id($id){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT name, vocation, level FROM players WHERE account_id = '$id'");
    }

    // functions to get
    function get_attributes($id){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT health, healthmax, lookbody, lookfeet, lookhead, looklegs, looktype, lookaddons, mana, manamax, soul, town_id, cap, sex, save, skull, stamina, direction, loss_experience, loss_mana, loss_skills, loss_containers, loss_items FROM players WHERE vocation = ".$id);
    }

    function get_player_name($nick){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT name FROM players WHERE name = '$nick'");
    }

    function get_char_by_vocation($voc){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT name, vocation FROM players WHERE account_id = 1 AND vocation = ".$voc);
    }

    function get_notices(){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT id, nickname, titulo, noticia FROM noticias ORDER BY id DESC LIMIT 10");
    }   

    function get_user($usuario){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT name FROM accounts WHERE name = '$usuario'");
    }

    function get_email($email){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT email FROM accounts WHERE email = '$email'");
    }

    function get_points($name){
        $db = new db();
        return mysqli_fetch_assoc(mysqli_query($db->conecta_mysqli(), "SELECT premium_points FROM accounts WHERE name = '$name'"));
    }

    function get_shop_items(){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT id, points, itemid, count, offer_type, offer_description, offer_name FROM z_shop_offer");
    }

    function get_premium_days($name){
        $db = new db();
        return mysqli_fetch_assoc(mysqli_query($db->conecta_mysqli(), "SELECT premdays FROM accounts WHERE name = '$name'"));
    }

    function get_item_by_id($itemid){
        $db = new db();
        return mysqli_fetch_assoc(mysqli_query($db->conecta_mysqli(), "SELECT * FROM z_shop_offer WHERE itemid = '$itemid'"));
    }

    // functions to insert
    function insert_item_comunication($player_name, $item_type, $item_id, $item_name, $item_count){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO z_ots_comunication (player_name, item_type, item_id, item_name, item_count) VALUES ('$player_name', '$item_type', '$item_id', '$item_name', '$item_count')");
    }
    
    function insert_points($name, $points){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premium_points = premium_points + '$points' WHERE name = '$name'");
    }

    function insert_new_account($usuario, $email, $senha, $nickname){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO accounts (name, email, password, nickname) VALUES ('$usuario', '$email', '$senha', '$nickname')");
    }

    function insert_new_char($nick, $account_id, $vocation, $health, $healthmax, $lookbody, $lookfeet, $lookhead, $looklegs, $looktype, $lookaddons, $mana, $manamax, $soul, $town_id, $cap, $sex, $save, $skull, $stamina, $direction, $loss_experience, $loss_mana, $loss_skills, $loss_containers, $loss_items, $create_date){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO players (name, account_id, vocation, health, healthmax, lookbody, lookfeet, lookhead, looklegs, looktype, lookaddons, mana, manamax, soul, town_id, cap, sex, save, skull, stamina, direction, loss_experience, loss_mana, loss_skills, loss_containers, loss_items, create_date) VALUES('$nick', '$account_id', '$vocation', '$health', '$healthmax', '$lookbody', '$lookfeet', '$lookhead', '$looklegs', '$looktype', '$lookaddons', '$mana', '$manamax', '$soul', '$town_id', '$cap', '$sex', '$save', '$skull', '$stamina', '$direction', '$loss_experience', '$loss_mana', '$loss_skills', '$loss_containers', '$loss_items', '$create_date')");
    }

    function insert_notice($nickname, $titulo,$noticia){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO noticias (nickname, titulo, noticia) VALUES ('$nickname', '$titulo', '$noticia')");
    }

    function add_premium_days($name, $days){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premdays = premdays + '$days' WHERE name = '$name'");
    }

    function add_all_premium_days($days){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premdays = premdays + '$days'");
    }

    // functions to delet / remove
    function remove_points($name, $points){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premium_points = premium_points - '$points' WHERE name = '$name'");
    }

    function remove_premium_days($name, $days){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premdays = premdays - '$days' WHERE name = '$name'");
    }

    function remove_all_premium_days(){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premdays = 0");
    }

    function delet_notice($id){
        $db = new db();
       return mysqli_query($db->conecta_mysqli(), "DELETE FROM noticias WHERE id = '$id'");

    }

    function delet_by_id($id){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "DELETE FROM players WHERE name = '$id'");
    }
?>