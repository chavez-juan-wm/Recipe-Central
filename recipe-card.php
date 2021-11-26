<?php
    function getRecipeCards($rows){
        $response = "";
        foreach ($rows as $row){
            $card =
            '<div class="col-sm-6 col-md-4 col-lg-3 col-xl-2 pt-5 pb-5 d-flex">
                <div class="card border-info" style="width: 25rem;">
                    <div class="embed-responsive embed-responsive-4by3 border">
                        <img alt="Recipe Image Preview" class="card-img-top embed-responsive-item" src="' . $row['pictureurl'] .'" />
                    </div>
                    <div class="card-img-overlay">
                        <button class="btn btn-info btn-md">
                            <i class="far fa-bookmark"></i>
                            <!-- far is filled in; far is outline   -->                                   
                        </button>
                    </div>
                    
                    <div class="card-body d-flex flex-column">
                        <div style="transform: rotate(0);">
                            <a href="#" class="h5 card-title stretched-link" style="color: black">' . $row['recipename'] .'</a><br><br>
                            <p class="card-subtitle text-muted">Chef: ' . $row['username'] .'</p>
                        </div>
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
                                $card = $card . "<li>" . $ingredientArray[$x] . '</li>';
                            }
                            $card = $card . '</ul>
                        </div>
                        
                        <h6 class="card-title">Nutrition Facts</h6>
                        <div class="card-text">' .
                            '<ul><li>Protein: ' . $row['protein']  . 'g</li>' .
                            '<li>Carbs: ' . $row['carbs']  . 'g</li></ul>' .
                        '</div>
                        <div class="card-footer bg-transparent mt-auto" style="transform: rotate(0);">
                            <a href="#" class="card-link stretched-link">View Full Recipe</a>
                        </div>
                    </div>
                </div>
            </div>';

            $response = $response . $card;
        }

        return $response;
    }
