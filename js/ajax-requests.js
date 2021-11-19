$( document ).ready(function() {
    $( "#rerollBtn" ).click(function() {
        $.get("ajax-handler.php",
            {type: "random"},
            function(data) {
                $("#randomRecipes").html(data);
            }
        );
    });
});
