<?php
    class Account{
        private $user;
        private $password;
        private $email;
        private $nickname;
        private $account_id;
        private $status; // 0 -> no exists, 1-> exists
        private $create_ip;

        function set_user($user){
            return $this->user = $user;
        }

        function set_password($password){
            return $this->password = $password;
        }

        function set_email($email){
            return $this->email = $email;
        }

        function set_nickname($nickname){
            return $this->nickname = $nickname;
        }

        function set_status(){
            $db = new db();
            if(mysqli_num_rows(mysqli_query($db->conecta_mysqli(), "SELECT name FROM accounts WHERE name = '$this->user'")) == 0){
                $this->status['user'] = 0;
            }else{
                $this->status['user'] = 1;
            }
            if(mysqli_num_rows(mysqli_query($db->conecta_mysqli(), "SELECT email FROM accounts WHERE email = '$this->email'")) == 0){
                $this->status['email'] = 0;
            }else{
                $this->status['email'] = 1;
            }
        }
        
        public function set_ip(){
            return $this->create_ip = $_SERVER['REMOTE_ADDR'];
        }

        function create_account(){
            $db = new db();
            if($this->status['user'] == 1){
                return alert('Usuário já existe!', 'criar_conta');
            }
            if($this->status['email'] == 1){
                return alert('Email já existe!', 'criar_conta');
            }
            if($this->status['user'] == 0 && $this->status['email'] == 0){
                return mysqli_query($db->conecta_mysqli(), "INSERT INTO accounts (name, email, password, nickname, create_ip) VALUES ('$this->user', '$this->email', '$this->password', '$this->nickname', '$this->create_ip')") && alert('Conta criada com sucesso!', 'acessar_conta');
            }
            $db->close();
        }
    }
?>