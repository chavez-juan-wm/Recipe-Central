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
    $database->query("INSERT INTO users (userName, email, password) VALUES (:userName, :email, md5(:password)) RETURNING userid;");
    $database->bind(':userName', $_POST['fullName'], PDO::PARAM_STR);
    $database->bind(':email', $_POST['email'], PDO::PARAM_STR);
    $database->bind(':password', $_POST['password'], PDO::PARAM_STR);
    if($database->execute()) {
        $_SESSION['userid'] = $database->results()['userid'];
        $_SESSION['username'] = $_POST['fullName'];
        header('Location: index.php');
    }
}
else if(isset($_POST['login'])) {
    $database->query("SELECT userId, userName FROM Users WHERE email=:email AND password=md5(:password)");
    $database->bind(':email', $_POST['email'], PDO::PARAM_STR);
    $database->bind(':password', $_POST['password'], PDO::PARAM_STR);
    $userinfo = $database->results();
    if(!is_null($userinfo)) {
        $_SESSION['username'] = $userinfo['username'];
        $_SESSION['userid'] = $userinfo['userid'];
        header('Location: index.php');
    }
}

else if(isset($_POST['updateProfile'])) {
    if(isset($_POST['updateName'])) {
        $database->query("UPDATE users SET username = :updatedname WHERE userid = :sessionid");
        $database->bind(':updatedname', $_POST['updateName'], PDO::PARAM_STR);
        $database->bind(':sessionid', $_SESSION['userid'], PDO::PARAM_STR);
        if($database->execute()) {
            $_SESSION['username'] = $_POST['updateName'];
        }
    }

    if(isset($_POST['updateEmail'])) {
        $database->query("UPDATE users SET email = :updatedemail WHERE userid = :sessionid");
        $database->bind(':updatedemail', $_POST['updateEmail'], PDO::PARAM_STR);
        $database->bind(':sessionid', $_SESSION['userid'], PDO::PARAM_STR);
        $database->execute();
    }

    if(isset($_POST['newPassword'])) {
        $database->query("UPDATE users SET password = md5(:updatedpassword) WHERE userid = :sessionid");
        $database->bind(':updatedpassword', $_POST['newPassword'], PDO::PARAM_STR);
        $database->bind(':sessionid', $_SESSION['userid'], PDO::PARAM_STR);
        $database->execute();
    }
    header('Location: profile.php');
}

else if(isset($_POST['createRecipe'])) {
    $_POST['ingredients'] = "this is a fake string please dont ever input this as a n ingredient, " . $_POST['ingredients'];
    $ingredientArray = explode(',', $_POST['ingredients']);
    
    $database->query("INSERT INTO recipes(chefID, recipeName, foodType, pictureUrl, protein, carbs, fat, sugars) VALUES (:chefid, :recipename, :foodtype, :pictureurl, :protein, :carbs, :fat, :sugars) RETURNING recipeid");
    $database->bind(':chefid', $_SESSION['userid'], PDO::PARAM_INT);
    $database->bind(':recipename', $_POST['recipename'], PDO::PARAM_STR);
    $database->bind(':foodtype', $_POST['recipetype'], PDO::PARAM_STR);
    $database->bind(':pictureurl', $_POST['imagelink'], PDO::PARAM_STR);
    $database->bind(':protein', $_POST['protein'], PDO::PARAM_STR);
    $database->bind(':carbs', $_POST['carbs'], PDO::PARAM_STR);
    $database->bind(':fat', $_POST['fat'], PDO::PARAM_STR);
    $database->bind(':sugars', $_POST['sugars'], PDO::PARAM_STR);
    $results = $database->results();
    

    if(!is_null($results)) {
        foreach($ingredientArray as $item) {
            $database->query("UPDATE recipes SET ingredients = ARRAY_APPEND(ingredients, :array) WHERE recipeid = :insertedid");
            $database->bind(':array', $item, PDO::PARAM_STR);
            $database->bind(':insertedid', $results['recipeid'], PDO::PARAM_STR);
            $database->execute();
        }
        $database->query("UPDATE recipes SET ingredients = ARRAY_REMOVE(ingredients, 'this is a fake string please dont ever input this as a n ingredient') WHERE recipeid = :insertedid");
        $database->bind(':insertedid', $results['recipeid'], PDO::PARAM_STR);
        $database->execute();
        header('Location: profile.php');
    }
}

else if(isset($_POST['signout'])) {
    unset($_SESSION['username']);
    header('Location: index.php');
}

