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
    }
?>