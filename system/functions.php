<?php
    function check_session(){
        if(session_status() !== PHP_SESSION_ACTIVE || session_status() === PHP_SESSION_NONE){
            return session_start();
        }
        if(session_status() === PHP_SESSION_DISABLED){
            return session_start();
        }
    }

    function alert($msg, $go = null){
        echo $go !== null ? "<script>alert('$msg');window.location.href='$go';</script>" : "<script>alert('$msg')</script>";
    }
    // functions to get

    function checar_usuario_e_senha($user, $password){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT id, name, nickname, page_access FROM accounts WHERE name = '$user' AND password = '$password'");
        $db->close();
    }

    function pegar_chars_on(){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT COUNT(online) AS all_online FROM players WHERE online > 0")->fetch_array();
        $db->close();
    }

    function get_char_by_account_id($id){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT name, vocation, level FROM players WHERE account_id = '$id'");
        $db->close();
    }
    
    function get_attributes($id){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT health, healthmax, lookbody, lookfeet, lookhead, looklegs, looktype, lookaddons, mana, manamax, soul, town_id, cap, sex, save, skull, stamina, direction, loss_experience, loss_mana, loss_skills, loss_containers, loss_items FROM players WHERE vocation = ".$id);
        $db->close();
    }

    function get_player_name($nick){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT name FROM players WHERE name = '$nick'");
        $db->close();
    }

    function get_char_by_vocation($voc){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT name, vocation FROM players WHERE account_id = 1 AND vocation = ".$voc);
        $db->close();
    }

    function get_notices(){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT id, nickname, titulo, noticia FROM noticias ORDER BY id DESC LIMIT 10");
        $db->close();
    }   

    function get_user($usuario){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT name FROM accounts WHERE name = '$usuario'");
        $db->close();
    }

    function get_email($email){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT email FROM accounts WHERE email = '$email'");
        $db->close();
    }

    function get_points($name){
        $db = new db();
        return mysqli_fetch_assoc(mysqli_query($db->conecta_mysqli(), "SELECT premium_points FROM accounts WHERE name = '$name'"));
        $db->close();
    }

    function get_shop_items(){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "SELECT id, points, itemid, count, offer_type, offer_description, offer_name FROM z_shop_offer ORDER BY offer_name ASC");
        $db->close();
    }

    function get_shop_items_images($itemid){
        $db = new db();
        return mysqli_fetch_assoc(mysqli_query($db->conecta_mysqli(), "SELECT id, img_name, img_item_id, img_url FROM z_shop_images WHERE img_item_id = '$itemid'"));
        $db->close();
    }

    function get_premium_days($name){
        $db = new db();
        return mysqli_fetch_assoc(mysqli_query($db->conecta_mysqli(), "SELECT premdays FROM accounts WHERE name = '$name'"));
        $db->close();
    }

    function get_item_by_id($itemid){
        $db = new db();
        return mysqli_fetch_assoc(mysqli_query($db->conecta_mysqli(), "SELECT * FROM z_shop_offer WHERE itemid = '$itemid'"));
        $db->close();
    }

    function get_post_action($name){
        $params = func_get_args();

        foreach ($params as $name) {
            if (isset($_POST[$name])) {
                return $name;
            }
        }
    }

    // functions to insert

    function insert_item_comunication($player_name, $item_type, $item_id, $item_name, $item_count){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO z_ots_comunication (player_name, item_type, item_id, item_name, item_count) VALUES ('$player_name', '$item_type', '$item_id', '$item_name', '$item_count')");
        $db->close();
    }
    
    function insert_points($name, $points){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premium_points = premium_points + '$points' WHERE name = '$name'");
        $db->close();
    }

    function insert_new_account($usuario, $email, $senha, $nickname){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO accounts (name, email, password, nickname) VALUES ('$usuario', '$email', '$senha', '$nickname')");
        $db->close();
    }

    function insert_new_char($nick, $account_id, $vocation, $health, $healthmax, $lookbody, $lookfeet, $lookhead, $looklegs, $looktype, $lookaddons, $mana, $manamax, $soul, $town_id, $cap, $sex, $save, $skull, $stamina, $direction, $loss_experience, $loss_mana, $loss_skills, $loss_containers, $loss_items, $create_date){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO players (name, account_id, vocation, health, healthmax, lookbody, lookfeet, lookhead, looklegs, looktype, lookaddons, mana, manamax, soul, town_id, cap, sex, save, skull, stamina, direction, loss_experience, loss_mana, loss_skills, loss_containers, loss_items, create_date) VALUES('$nick', '$account_id', '$vocation', '$health', '$healthmax', '$lookbody', '$lookfeet', '$lookhead', '$looklegs', '$looktype', '$lookaddons', '$mana', '$manamax', '$soul', '$town_id', '$cap', '$sex', '$save', '$skull', '$stamina', '$direction', '$loss_experience', '$loss_mana', '$loss_skills', '$loss_containers', '$loss_items', '$create_date')");
        $db->close();
    }

    function insert_notice($nickname, $titulo,$noticia){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO noticias (nickname, titulo, noticia) VALUES ('$nickname', '$titulo', '$noticia')");
        $db->close();
    }

    function add_premium_days($name, $days){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premdays = premdays + '$days' WHERE name = '$name'");
        $db->close();
    }

    function add_all_premium_days($days){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premdays = premdays + '$days'");
        $db->close();
    }

    function insert_item_shop($offer_name, $offer_description, $offer_type, $itemid, $count, $points){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO z_shop_offer (offer_name, offer_description, offer_type, itemid, count, points) VALUES ('$offer_name', '$offer_description', '$offer_type', '$itemid', '$count', '$points')");
        $db->close();
    }

    function insert_img_item_shop($offer_name, $img_url, $itemid){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "INSERT INTO z_shop_images (img_name, img_url, img_item_id) VALUES ('$offer_name', '$itemid', '$img_url')");
        $db->close();
    }

    // functions to delet / remove
    
    function remove_points($name, $points){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premium_points = premium_points - '$points' WHERE name = '$name'");
        $db->close();
    }

    function remove_premium_days($name, $days){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premdays = premdays - '$days' WHERE name = '$name'");
        $db->close();
    }

    function remove_all_premium_days(){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "UPDATE accounts SET premdays = 0");
        $db->close();
    }

    function delet_notice($id){
        $db = new db();
       return mysqli_query($db->conecta_mysqli(), "DELETE FROM noticias WHERE id = '$id'");
       $db->close();
    }

    function delet_by_id($id){
        $db = new db();
        return mysqli_query($db->conecta_mysqli(), "DELETE FROM players WHERE name = '$id'");
        $db->close();
    }

    function delet_item_shop_by_id($itemid){
        $db = new db();
       return mysqli_query($db->conecta_mysqli(), "DELETE FROM z_shop_offer WHERE itemid = '$itemid'");
       $db->close();
    }
?>