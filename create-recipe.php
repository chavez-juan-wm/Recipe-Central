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

    <section>
        <div class="container-fluid">
            <h3 class="text-center">Create a new recipe</h3><hr/>
        </div>
    </section>
    <!-- Recipe form -->
    <section>
        <div class="container">
            <form method="post" action="request-handler.php" class="form">
                <div class="form-group ">
                    <h3>Recipe name: </h3>
                    <input type="text" name="recipename" class="form-control" required>
                </div>

                <div class="form-group ">
                    <h3>Recipe type: </h3>
                    <input type="text" name="recipetype" class="form-control" required>
                </div>

                <div class="form-group ">
                    <h3>Image Link: </h3>
                    <input type="text" name="imagelink" class="form-control" required>
                </div>

                <div class="form-group ">
                    <h3>Ingredients:</h3>
                    <textarea class="form-control" name="ingredients" rows="6" placeholder="Please insert a list separated by ," required></textarea>
                </div>

                <div class="form-group ">
                    <h3>Protein: </h3>
                    <input type="text" name="protein" class="form-control" required>
                </div>

                <div class="form-group ">
                    <h3>Carbs: </h3>
                    <input type="text" name="carbs" class="form-control" required>
                </div>

                <div class="form-group ">
                    <h3>Fat: </h3>
                    <input type="text" name="fat" class="form-control" required>
                </div>

                <div class="form-group ">
                    <h3>Sugars: </h3>
                    <input type="text" name="sugars" class="form-control" required>
                </div>

                <div class="form-group">
                    <input type="submit" name="createRecipe" class="btn btn-primary btn-block" value="Create Recipe">
                </div>
                <label id="errLabel"></label><br>
            </form>
        </div>
    </section>
</body>
</html>
