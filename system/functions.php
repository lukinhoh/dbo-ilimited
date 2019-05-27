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

    function get_name($nick){
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

    // functions to insert
    function insert_new_char($nick, $account_id, $vocation, $health, $healthmax, $lookbody, $lookfeet, $lookhead, $looklegs, $looktype, $lookaddons, $mana, $manamax, $soul, $town_id, $cap, $sex, $save, $skull, $stamina, $direction, $loss_experience, $loss_mana, $loss_skills, $loss_containers, $loss_items){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO players (name, account_id, vocation, health, healthmax, lookbody, lookfeet, lookhead, looklegs, looktype, lookaddons, mana, manamax, soul, town_id, cap, sex, save, skull, stamina, direction, loss_experience, loss_mana, loss_skills, loss_containers, loss_items) VALUES('$nick', '$account_id', '$vocation', '$health', '$healthmax', '$lookbody', '$lookfeet', '$lookhead', '$looklegs', '$looktype', '$lookaddons', '$mana', '$manamax', '$soul', '$town_id', '$cap', '$sex', '$save', '$skull', '$stamina', '$direction', '$loss_experience', '$loss_mana', '$loss_skills', '$loss_containers', '$loss_items')");
    }

    function insert_notice($nickname, $titulo,$noticia){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO noticias (nickname, titulo, noticia) VALUES ('$nickname', '$titulo', '$noticia')");
    }

    // functions to delet
    function delet_notice($id){
        $db = new db();
       return mysqli_query($db->conecta_mysqli(), "DELETE FROM noticias WHERE id = '$id'");

    }

    function delet_by_id($id){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "DELETE FROM players WHERE name = '$id'");
    }
?>