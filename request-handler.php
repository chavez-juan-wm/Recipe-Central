<?php
session_start();
require 'config.php';
require 'recipe-card.php';
$database = new Database();

//Get the type parameter from the URL
$type = $_REQUEST["type"];

if ($_GET['type'] == "random"){
    $database->query("SELECT Recipes.*, Users.userName FROM (Users INNER JOIN Recipes ON Users.userID = Recipes.chefID) ORDER BY RANDOM() DESC LIMIT 6;");
    displayRecipeCards($database->results());
}

if(isset($_POST['signup'])) {
    $database->query("INSERT INTO users (userName, email, password) VALUES (:userName, :email, md5(:password));");
    $database->bind(':userName', $_POST['fullName'], PDO::PARAM_STR);
    $database->bind(':email', $_POST['email'], PDO::PARAM_STR);
    $database->bind(':password', $_POST['password'], PDO::PARAM_STR);
    if($database->execute()) {
        $_SESSION['username'] = $_POST['fullName'];
        header('Location: index.php');
    }
    else {

    }
}
else if(isset($_POST['login'])) {
    $database->query("SELECT userId, userName FROM Users WHERE email=:email AND password=md5(:password)");
    $database->bind(':email', $_POST['email'], PDO::PARAM_STR);
    $database->bind(':password', $_POST['password'], PDO::PARAM_STR);
    $userinfo = $database->results();
    if(!is_null($userinfo)) {
        $_SESSION['username'] = $userinfo['username'];
        header('Location: index.php');
    }
}

else if (isset($_POST['signout'])) {
    unset($_SESSION['username']);
    header('Location: index.php');
}