<?php
    require 'config.php';
    $database = new Database();

    if(!isset($_SESSION['userid']) || empty($_SESSION['userid'])){
        http_response_code(401);
        die();
    }

    $database->query("SELECT userName, email, rating FROM Users WHERE userid=:userid;");
    $database->bind(':userid', $_SESSION['userid']);
    $userinfo = $database->results()[0];
?>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Recipe Central</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
</head>

<body>
    <!-- Navbar -->
    <div id="navbar">
        <?php echo getNav(); ?>
    </div>

    <!--  User profile info  -->
    <section style="padding-top: 5rem; padding-bottom: 2rem;">
        <div class="container-fluid">
            <div class="text-center">
                <h1><?php echo $userinfo['username'] ?></h1>
                <h3>Rating: <?php echo $userinfo['rating'] ?></h3><br><br>

                <div class="row">
                    <button class="col-2 mx-auto btn btn-info btn-block" data-toggle="modal" data-target="#editProfileModal">Edit Profile</button>
                </div>
            </div>
        </div>
    </section>

    <!-- User recipes -->
    <section class="bg-light" style="min-height: 67.5vh;">
        <div class="container-fluid">
            <div class="text-center">
                <h3>Your Recipes</h3> <hr/>
            </div>

            <div class="row">
                <?php
                    $database->query("SELECT Recipes.*, Users.userName FROM (Users INNER JOIN Recipes ON Users.userid = Recipes.chefID) WHERE Users.userid=:userid ORDER BY recipeID DESC;");
                    $database->bind(':userid', $_SESSION['userid']);
                    $results = $database->results();

                    if(count($results) == 0){
                        echo "<a class='h4 mx-auto' href='create-recipe.php'> Create your own recipe today! </a>";
                    }
                    else{
                        echo getRecipeCards($results);
                    }
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
                            <form method="post" id="updateForm" action="request-handler.php" class="form">
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
                                    <input type="password" id="newPassword" name="newPassword" class="form-control" placeholder="New Password">
                                </div>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i></span>
                                    </div>
                                    <input type="password" id="confirmNewPassword" name="confirmNewPassword" class="form-control" placeholder="Repeat New Password">
                                </div>
                                <label id="updateErrLabel" class="text-danger"></label><br>
                                <div class="form-group">
                                    <input type="submit" id="updateBtn" name="updateProfile" class="btn btn-primary btn-block" value="Update Profile">
                                </div>
                            </form>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Back to top button -->
    <button type="button" class="btn btn-primary btn-floating btn-lg" id="btn-back-to-top">
        <i class="fas fa-arrow-up"></i>
    </button>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="js/scroll-to-top.js"></script>
    <script src="js/ajax-requests.js"></script>

    <script>
        $('#updateForm').submit(function() {
            $('#updateErrLabel').empty();
            if($("#newPassword").val() != $("#confirmNewPassword").val()){
                $('#updateErrLabel').html("Passwords do not match");
                return false;
            }
            else{
                $('#updateBtn').addClass('disabled');
                return true;
            }
        });
    </script>
</body>
</html>
