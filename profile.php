<?php
require 'config.php';
require 'recipe-card.php';
$database = new Database();
?>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Recipe Central</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/scroll-to-top.js"></script>
    <script src="js/ajax-requests.js"></script>
</head>

<body>
    <!-- Navbar -->
    <?php
    require 'navbar.php';
    ?>
    <!-- User recipes -->
    <section>
        <div class="container-fluid">
            <h3 class="text-center">Your Recipes</h3> <a class="btn btn-primary btn-block" data-toggle="modal" data-target="#editProfileModal" href="#">Edit Profile</a><hr/>
            <div class="row">
                <?php
                $database->query("SELECT Recipes.*, Users.userName FROM (Users INNER JOIN Recipes ON Users.userID = :userid AND Users.userid = Recipes.chefID) ORDER BY recipeID;");
                $database->bind(':userid', $_SESSION['userid'], PDO::PARAM_STR);
                displayRecipeCards($database->results());
                ?>
            </div>
        </div>
    </section>
    <div class="modal" id="editProfileModal" aria-labelledby="editProfileModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editProfileLabel">Edit Profile</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="card bg-light">
                            <article class="card-body mx-auto" style="max-width: 400px">
                                <form method="post" action="request-handler.php" class="form">
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-user"></i></span>
                                        </div>
                                        <input type="text" name="updateName" class="form-control" placeholder="Update Name">
                                    </div>
                                    
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-envelope"></i></span>
                                        </div>
                                        <input type="email" name="updateEmail" class="form-control" placeholder="Update Email">
                                    </div>

                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-lock"></i></span>
                                        </div>
                                        <input type="password" name="oldPassword" class="form-control" placeholder="Old Password">
                                    </div>
                                    
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-lock"></i></span>
                                        </div>
                                        <input type="password" name="newPassword" class="form-control" placeholder="New Password">
                                    </div>

                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-lock"></i></span>
                                        </div>
                                        <input type="password" name="confirmNewPassword" class="form-control" placeholder="Repeat New Password">
                                    </div>

                                    <div class="form-group">
                                        <input type="submit" name="updateProfile" class="btn btn-primary btn-block" value="Update Profile">
                                    </div>
                                    <label id="errLabel"></label><br>
                                </form>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</head>