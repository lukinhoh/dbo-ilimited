<?php
    require_once("./system/db.php");
    $db = new db();

    class Character{
        
        
        public $health;
        public $healthmax;
        public $lookbody;
        public $lookfeet;
        public $lookhead;
        public $looklegs;
        public $looktype;
        public $lookaddons;
        public $mana;
        public $manamax;
        public $soul;
        public $town_id;
        public $cap;
        public $sex;
        public $save;
        public $skull;
        public $stamina;
        public $direction;
        public $loss_experience;
        public $loss_mana;
        public $loss_skills;
        public $loss_containers;
        public $loss_items;


    }
?>