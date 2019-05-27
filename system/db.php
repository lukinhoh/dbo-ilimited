<?php
    class db{

        // host
        private $db_host = 'localhost';

        // usuario
        private $db_usuario = 'root';

        // senha
        private $db_senha = '9669174';

        // banco de dados
        private $db_database = 'dbz';

        public function conecta_mysqli(){

            // criar a conexao
            $con = mysqli_connect($this->db_host, $this->db_usuario, $this->db_senha, $this->db_database);
            
            // verificar se houve erro de conexao
            if(mysqli_connect_errno($con)){
                echo 'Erro ao tentar conectar com o banco de dados: '.mysqli_connect_error();
            }

            return $con;
        }

        public function checar_usuario_e_senha($user, $password){
            $db = new db();
            return mysqli_query($db->conecta_mysqli(), "SELECT id, name, nickname, page_access FROM accounts WHERE name = '$user' AND password = '$password'");
        }

        public function pegar_chars($account_id){
            $db = new db();
            return mysqli_query($db->conecta_mysqli(), "SELECT name, vocation, level FROM players WHERE account_id = '$account_id'");
        }

        public function pegar_name($nick){
            $db = new db();
            return mysqli_query($db->conecta_mysqli(), "SELECT name FROM players WHERE name = '$nick'");
        }

        public function pegar_noticias(){
            $db = new db();
            return mysqli_query($db->conecta_mysqli(), "SELECT id, nickname, titulo, noticia FROM noticias ORDER BY id DESC LIMIT 10");
        }   

        public function inserir_noticia($nickname, $titulo,$noticia){
            $db = new db();
            return mysqli_query($db->conecta_mysqli(), "INSERT INTO noticias (nickname, titulo, noticia) VALUES ('$nickname', '$titulo', '$noticia')");
        }

        public function deletar_noticia($id){
            $db = new db();
           return mysqli_query($db->conecta_mysqli(), "DELETE FROM noticias WHERE id = '$id'");

        }

    }
?>