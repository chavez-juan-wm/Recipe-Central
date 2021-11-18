$( document ).ready(function() {
    $( "#rerollBtn" ).click(function() {
        $.get("RecipeRequestHandler.php",
            {type: "random"},
            function(data) {
                $("#randomRecipes").html(data);
            }
        );
    });
});
