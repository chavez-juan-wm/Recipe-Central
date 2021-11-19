<?php
require 'config.php';
require 'recipe-card.php';
$database = Database::getInstance();
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



    <!-- Header -->
    <header class="masthead text-white text-center">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-xl-9 mx-auto">
                    <h1 class="mb-5">Start finding new recipes today!</h1>
                </div>
                <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">

                <!-- Search recipe form -->
                <div class="form-row">
                    <div class="col-12 col-md-9 mb-2 mb-md-0">
                        <input ID="recipe" class="form-control form-control-lg" type="search" placeholder="Enter a recipe name">
                    </div>
                    <div class="col-12 col-md-3">
                        <button ID="search" class="btn btn-block btn-lg btn-primary" OnClick="search_Click">Search</button>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Icons Grid -->
    <section class="features-icons bg-light text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                        <div class="features-icons-icon d-flex">
                            <i class="fas fa-heart m-auto text-primary"></i>
                        </div>
                        <h3>Nutrition Facts</h3>
                        <p class="lead mb-0">View calories, protein, carbs, etc.</p>
                    </div>
                </div>

                <div class="col-lg-6 col-sm-6">
                    <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                        <div class="features-icons-icon d-flex">
                            <i class="fas fa-bookmark m-auto text-primary"></i>
                        </div>
                        <h3>Bookmark</h3>
                        <p class="lead mb-0">Save recipes to view later</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Newest Recipes Section   -->
    <section>
        <div class="container-lg">
            <h3 class="text-center">Newest Recipes</h3><hr/>
            <div class="row">
                <?php
                $database->query("SELECT Recipes.*, Users.userName FROM (Users INNER JOIN Recipes ON Users.userID = Recipes.chefID) ORDER BY recipeID DESC LIMIT 6;");
                displayRecipeCards($database->results());
                ?>
            </div>
        </div>
    </section>

    <!-- Random Recipes Section   -->
    <section class="bg-light">
        <div class="container-lg">
            <div class="text-center">
                <h3>Random Recipes</h3><hr/>
                <div class="row">
                    <button id="rerollBtn" class="col-4 mx-auto btn btn-info btn-block">Reroll</button>
                </div>
            </div>

            <div id="randomRecipes" class="row">
                <?php
                $database->query("SELECT Recipes.*, Users.userName FROM (Users INNER JOIN Recipes ON Users.userID = Recipes.chefID) ORDER BY RANDOM() DESC LIMIT 6;");
                displayRecipeCards($database->results());
                ?>
            </div>
        </div>
    </section>

    <!-- Back to top button -->
    <button type="button" class="btn btn-primary btn-floating btn-lg" id="btn-back-to-top">
        <i class="fas fa-arrow-up"></i>
    </button>
</body>
</html>
