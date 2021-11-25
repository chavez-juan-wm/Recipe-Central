$(document).ready(function() {
    $("#rerollBtn").click(function() {
        $.get("request-handler.php",
            {type: "random"},
            function(data) {
                $("#randomRecipes").html(data);
            }
        );
    });
});
