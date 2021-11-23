<?php

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
        // Find the type of the value if it isn't given
        // In our case we only need to check for int and string
        if(is_null($type)) {
            if(is_int($value)) {
                $type = PDO::PARAM_INT;
            }
            else if(is_string($value)){
                $type = PDO::PARAM_STR;
            }
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
        if(is_null($this->count())) {
            return null;
        }
        else if($this->count() > 1) {
            return $this->stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        else if ($this->count() == 1){
            return $this->stmt->fetch(PDO::FETCH_ASSOC);
        }

    }

    // Return the row count of the executed query
    public function count() {
        if($this->execute()) {
            return $this->stmt->rowCount();
        }

        return null;
    }
}
