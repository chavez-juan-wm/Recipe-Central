$(document).ready(function() {
    function errorPopup(target){
        $('[data-target=' + target + ']').popover({
            placement : 'top',
            html : true,
            title : 'Error <a role="button" class="close" data-dismiss="alert">&times;</a>',
            content : '<p>There was an issue. Please try again.</p>'
        }).popover('show');
    }

    $(document).on("click", ".popover .close", function(){
        $(this).parents(".popover").popover('hide');
    });

    $("#rerollBtn").click(function() {
        let ref = this
        $(ref).parents(".popover").popover('hide');
        $(ref).addClass('disabled');
        $(ref).prop("disabled", true);
        let target = $(ref).data("target");

        $.ajax({
            type: "GET",
            url: 'request-handler.php',
            data: {type: "randomRecipes"},
            dataType: 'json',
            success: function(response) {
                if(response.status == 'success'){
                    $("#randomRecipes").html(response.data);
                }
                else if(response.status == "error"){
                    errorPopup(target);
                }
            },
            error: function (response){
                errorPopup(target);
            },
            complete: function (data) {
                $(ref).removeClass('disabled');
                $(ref).prop("disabled", false);
            }
        });
    });
});
