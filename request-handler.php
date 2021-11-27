<?php
require 'config.php';
$database = new Database();

header('Content-type: application/json');
$response['status'] = 'error';

if (isset($_GET['reroll'])){
    $database->query("SELECT Recipes.*, Users.userName FROM (Users INNER JOIN Recipes ON Users.userID = Recipes.chefID) ORDER BY RANDOM() DESC LIMIT 6;");
    $recipes = $database->results();

    if(isset($recipes)){
        $response['status'] = 'success';
        $response['data'] = getRecipeCards($database, $recipes);
    }

    echo json_encode($response);
}
elseif(isset($_POST['addbookmark'])){
    $database->query("INSERT INTO Bookmarks(userID, recipeID) Values(:userID, :recipeID);");
    $database->bind(':userID', $_SESSION['userid']);
    $database->bind(':recipeID', $_POST['recipe']);

    if($database->execute()) {
        $response['status'] = 'success';
    }

    echo json_encode($response);
}
else if(isset($_POST['signup'])) {
    $database->query("INSERT INTO users (userName, email, password) VALUES (:userName, :email, md5(:password)) RETURNING userid;");
    $database->bind(':userName', $_POST['fullName']);
    $database->bind(':email', $_POST['email']);
    $database->bind(':password', $_POST['password']);

    $userinfo = $database->results();
    if(isset($userinfo[0])) {
        $response['status'] = 'success';
        $_SESSION['userid'] = $userinfo[0]['userid'];
        $_SESSION['username'] = $_POST['fullName'];
    }

    echo json_encode($response);
}
else if(isset($_POST['login'])) {
    $database->query("SELECT userId, userName FROM Users WHERE email=:email AND password=md5(:password)");
    $database->bind(':email', $_POST['email']);
    $database->bind(':password', $_POST['password']);

    $userinfo = $database->results();
    if(isset($userinfo[0])) {
        $response['status'] = 'success';
        $_SESSION['userid'] = $userinfo[0]['userid'];
        $_SESSION['username'] = $userinfo[0]['username'];
    }

    echo json_encode($response);
}
else if(isset($_POST['signout'])) {
    unset($_SESSION['userid']);
    unset($_SESSION['username']);

    header('Location: index.php');
}
else if(isset($_POST['updateProfile'])) {
    if(!empty($_POST['updateName'])) {
        $database->query("UPDATE users SET username = :updatedname WHERE userid = :sessionid");
        $database->bind(':updatedname', $_POST['updateName']);
        $database->bind(':sessionid', $_SESSION['userid']);
        if($database->execute()) {
            $_SESSION['username'] = $_POST['updateName'];
        }
    }

    if(!empty($_POST['updateEmail'])) {
        $database->query("UPDATE users SET email = :updatedemail WHERE userid = :sessionid");
        $database->bind(':updatedemail', $_POST['updateEmail']);
        $database->bind(':sessionid', $_SESSION['userid']);
        $database->execute();
    }

    if(!empty($_POST['newPassword'])) {
        $database->query("UPDATE users SET password = md5(:updatedpassword) WHERE userid = :sessionid");
        $database->bind(':updatedpassword', $_POST['newPassword']);
        $database->bind(':sessionid', $_SESSION['userid']);
        $database->execute();
    }

    header('Location: profile.php');
}
else if(isset($_POST['createRecipe'])) {
    $_POST['ingredients'] = "this is a fake string please dont ever input this as a n ingredient, " . $_POST['ingredients'];
    $ingredientArray = explode(',', $_POST['ingredients']);
    
    $database->query("INSERT INTO recipes(chefID, recipeName, foodType, pictureUrl, protein, carbs, fat, sugars) VALUES (:chefid, :recipename, :foodtype, :pictureurl, :protein, :carbs, :fat, :sugars) RETURNING recipeid");
    $database->bind(':chefid', $_SESSION['userid'], PDO::PARAM_INT);
    $database->bind(':recipename', $_POST['recipename']);
    $database->bind(':foodtype', $_POST['recipetype']);
    $database->bind(':pictureurl', $_POST['imagelink']);
    $database->bind(':protein', $_POST['protein']);
    $database->bind(':carbs', $_POST['carbs']);
    $database->bind(':fat', $_POST['fat']);
    $database->bind(':sugars', $_POST['sugars']);
    $results = $database->results();

    if(isset($results)) {
        foreach($ingredientArray as $item) {
            $database->query("UPDATE recipes SET ingredients = ARRAY_APPEND(ingredients, :array) WHERE recipeid = :insertedid");
            $database->bind(':array', $item);
            $database->bind(':insertedid', $results[0]['recipeid']);
            $database->execute();
        }
        $database->query("UPDATE recipes SET ingredients = ARRAY_REMOVE(ingredients, 'this is a fake string please dont ever input this as a n ingredient') WHERE recipeid = :insertedid");
        $database->bind(':insertedid', $results[0]['recipeid']);
        $database->execute();

        header('Location: profile.php');
    }
}
