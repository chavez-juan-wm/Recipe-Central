<?php
    session_start();
    require 'navbar.php';
    require 'recipe-card.php';

    class Database
    {
        private $host = 'localhost';
        private $dbuser = 'postgres';
        private $dbpass = '';          // Update the password with your postgresql password
        private $dbname='postgres';
        private $dbh;
        private $stmt;
        private $isExecuted;

        public function __construct() {
            // Create new PDO
            try {
                $this->dbh = new PDO("pgsql:host=$this->host;dbname=$this->dbname", $this->dbuser, $this->dbpass, array(PDO::ATTR_PERSISTENT => true));
            }
            catch (PDOException $e){
                echo "Error: " . $e->getMessage() . "<br/>";
                echo "<br/>Please check your postgresql server.<br/>";
                die();
            }
        }

        public function query($query) {
            // Create a prepared statement
            $this->stmt = $this->dbh->prepare($query);
            $this->isExecuted = false;
        }

        // In order to prepare our SQL queries, we need to bind the placeholders with values
        public function bind($placeholder, $value, $type = null) {
            if(is_null($type)) {
                $type = PDO::PARAM_STR;
            }

            $this->stmt->bindValue($placeholder, $value, $type);
        }

        // Execute the prepared query
        public function execute() {
            try {
                if(!$this->isExecuted) {
                    $this->isExecuted = $this->stmt->execute();
                }
            }
            catch (Exception $e) {
                $this->isExecuted = false;
            }
            finally {
                return $this->isExecuted;
            }
        }

        // Return all the tuples of the executed query
        public function results() {
            if($this->execute()) {
                return $this->stmt->fetchAll(PDO::FETCH_ASSOC);
            }
            else {
                return null;
            }
        }
    }
