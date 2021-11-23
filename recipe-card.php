<?php

function displayRecipeCards($rows){
    foreach ($rows as $row){
        echo
        '<div class="col-sm-6 col-md-4 col-lg-3 col-xl-2 pt-5 pb-5 d-flex">
            <div class="card border-info" style="width: 25rem;">
                <img class="card-img-top img-fluid" alt="Recipe Image Preview" src="' . $row['pictureurl'] .'">
                <div class="card-img-overlay">
                    <button class="btn btn-info btn-md">
                        <i class="far fa-bookmark"></i>
                        <!-- far is filled in; far is outline   -->                                   
                    </button>
                </div>
                
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">' . $row['recipename'] .'</h5>
                    <p class="card-subtitle text-muted">Chef: ' . $row['username'] .'</p>
                    <hr />
                    <h6 class="card-title">Ingredients</h6>
                    <div class="card-text">
                        <ul>';
                        $ingredientArray = json_decode(str_replace(['{', '}'], ['[', ']'], $row['ingredients']));
                        $size = count($ingredientArray);

                        // Limit the number of ingredients printed
                        if($size > 2){
                            $size = 2;
                        }
                        for ($x = 0; $x < $size; $x++) {
                            echo "<li>" . $ingredientArray[$x] . '</li>';
                        }
                        echo '</ul>
                    </div>
                    
                    <h6 class="card-title">Nutrition Facts</h6>
                    <div class="card-text">' .
                        '<ul><li>Protein: ' . $row['protein']  . 'g</li>' .
                        '<li>Carbs: ' . $row['carbs']  . 'g</li></ul>' .
                    '</div>
                    <div class="mt-auto">
                        <a href="#" class="card-link">View Full Recipe</a>
                    </div>
                </div>
            </div>
        </div>';
    }
}
