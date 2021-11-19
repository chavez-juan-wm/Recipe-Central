<?php
require 'config.php';
require 'recipe-card.php';
$database = Database::getInstance();

// Get the type parameter from the URL
$type = $_REQUEST["type"];

if ($type == "random"){
    $database->query("SELECT Recipes.*, Users.userName FROM (Users INNER JOIN Recipes ON Users.userID = Recipes.chefID) ORDER BY RANDOM() DESC LIMIT 6;");
    displayRecipeCards($database->results());
}
