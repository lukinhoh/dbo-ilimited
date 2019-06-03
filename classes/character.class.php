<?php
    class Character{
        
        private $name;
        private $group_id = 1;
        private $account_id;
        private $level = 1;
        private $vocation;
        private $health = 250;
        private $healthmax = 250;
        private $experience = 0;
        private $lookbody = 68;
        private $lookfeet = 76;
        private $lookhead = 78;
        private $looklegs = 39;
        private $looktype = 128;
        private $lookaddons = 0;
        private $maglevel = 0;
        private $mana = 250;
        private $manamax = 250;
        private $manaspent = 0;
        private $soul = 100;
        private $town_id = 1;
        private $cap = 400;
        private $sex = 1;
        private $save = 1;
        private $skull = 4;
        private $skulltime = 0;
        private $rank_id = 0;
        private $blessings = 0;
        private $balance = 0;
        private $stamina = 15120000;
        private $direction = 2;
        private $loss_experience = 150;
        private $loss_mana = 100;
        private $loss_skills = 100;
        private $loss_containers = 100;
        private $loss_items = 100;
        private $online = 0;
        private $marriage = 0;
        private $promotion = 0;
        private $deleted = 0;
        private $create_ip = 0;
        private $create_date = 0;
        private $hide_char = 0;
        private $cast = 0;
        private $castViewers = 0;

        // functions of setting
        public function set_name($name){
            return $this->name = $name;
        }

        public function set_account_id($account_id){
            return $this->account_id = $account_id;
        }

        public function set_vocation($vocation_id){
            return $this->vocation = $vocation_id;
        }

        public function set_ip(){
            return $this->create_ip = intval($_SERVER['REMOTE_ADDR']);
        }

        // functions of getting
        public function get_name(){
            return $this->name;
        }

        public function get_account_id(){
            return $this->account_id;
        }

        public function get_vocation(){
            return $this->vocation;
        }

        // function insert in database
        public function create_character(){
            $db = new db();
            return mysqli_query($db->conecta_mysqli(), "INSERT INTO players (name, group_id, account_id, level, vocation, health, healthmax, experience, lookbody, lookfeet, lookhead, looklegs, looktype, lookaddons, maglevel, mana, manamax, manaspent, soul, town_id, cap, sex, save, skull, skulltime, rank_id, blessings, balance, stamina, direction, loss_experience, loss_mana, loss_skills, loss_containers, loss_items, online, marriage, promotion, deleted, create_ip, create_date, hide_char, cast, castViewers) VALUES('$this->name', '$this->group_id', '$this->account_id', '$this->level', '$this->vocation', '$this->health', '$this->healthmax', '$this->experience', '$this->lookbody', '$this->lookfeet', '$this->lookhead', '$this->looklegs', '$this->looktype', '$this->lookaddons', '$this->maglevel', '$this->mana', '$this->manamax', '$this->manaspent', '$this->soul', '$this->town_id', '$this->cap', '$this->sex', '$this->save', '$this->skull', '$this->skulltime', '$this->rank_id', '$this->blessings', '$this->balance', '$this->stamina', '$this->direction', '$this->loss_experience', '$this->loss_mana', '$this->loss_skills', '$this->loss_containers', '$this->loss_items', '$this->online', '$this->marriage', '$this->promotion', '$this->deleted', '$this->create_ip', '$this->create_date', '$this->hide_char', '$this->cast', '$this->castViewers')");
            $db->close();
        }
    }
?>