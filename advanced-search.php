<?php
    require 'config.php';
    $database = new Database();
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

    <section style="padding-top: 5rem; padding-bottom: 2rem;">
        <div class="container-fluid">
            <form id="searchForm" class="col-6 mx-auto form" >
                <div class="form-group input-group">
                    <input type="text" name="searchText" class="form-control" placeholder="Enter Search">
                </div>
                <div class="row mx-auto">
                    <div>
                        <select name="searchType" class="btn btn-light">
                            <option value="recipename">Recipe Name</option>
                            <option value="username">Chef</option>
                        </select>
                        <select name="recipetype" class="btn btn-light">
                            <option selected="true" value="">All Recipes</option>
                            <option value="Appetizers and Snacks">Appetizers and Snacks</option>
                            <option value="Main Dishes">Main Dishes</option>
                            <option value="World Cuisine">World Cuisine</option>
                            <option value="Fruits and Vegetables">Fruits and Vegetables</option>
                            <option value="Soups, Stews and Chili Recipes">Soups, Stews and Chili Recipes</option>
                            <option value="Side Dish">Side Dish</option>
                            <option value="Meat and Poultry">Meat and Poultry</option>
                        </select>
                    </div>
                    <div class="col-2 form-group ml-auto">
                        <input type="submit" id="searchSubmit" name="searchBtn" class="btn btn-primary btn-block" value="Search" data-target="searchButton">
                    </div>
                <div>
            </form>
        </div>
    </section>

    <section>
        <div class="container-fluid">
            <div class="row" id="results">
                
            </div>
        </div>
    </section>

    <!-- Back to top button -->
    <button type="button" class="btn btn-primary btn-floating btn-lg" id="btn-back-to-top">
        <i class="fas fa-arrow-up"></i>
    </button>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="js/scroll-to-top.js"></script>
    <script src="js/ajax-requests.js"></script>
</body>
</html>
