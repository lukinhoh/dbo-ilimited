<?php
    class db{

        // host
        private $host = 'localhost';

        // usuario
        private $usuario = 'root';

        // senha
        private $senha = '9669174';

        // banco de dados
        private $database = 'dbz';

        public function conecta_mysqli(){

            // criar a conexao
            $con = mysqli_connect($this->host, $this->usuario, $this->senha, $this->database);
            
            // verificar se houve erro de conexao
            if(mysqli_connect_errno($con)){
                echo 'Erro ao tentar conectar com o banco de dados: '.mysqli_connect_error();
            }

            return $con;
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