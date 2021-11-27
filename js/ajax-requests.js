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
            data: {reroll: "true"},
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

    $('#logInForm').on('submit', function (e) {
        e.preventDefault(); // Stop the form from submitting
        $('#logInErrLabel').empty();
        $('#logInBtn').addClass('disabled');
        $('#logInBtn').prop("disabled", true);

        $.ajax({
            type: "POST",
            url: 'request-handler.php',
            data: $("#logInForm").serialize()+ "&login=true",
            dataType: 'json',
            success: function(response) {
                if(response.status == 'success'){
                    location.reload(); // Reload the page
                }
                else if(response.status == "error"){
                    $('#logInErrLabel').html("Incorrect email/password.");
                }
            },
            error: function (response){
                $('#logInErrLabel').html("Try again please.");
            },
            complete: function (data){
                $('#logInBtn').removeClass('disabled');
                $('#logInBtn').prop("disabled", false);
            }
        });
    });

    $('#signUpForm').on('submit', function (e) {
        e.preventDefault(); // Stop the form from submitting
        $('#signUpErrLabel').empty();
        $('#signUpBtn').addClass('disabled');
        $('#signUpBtn').prop("disabled", true);

        $.ajax({
            type: "POST",
            url: 'request-handler.php',
            data: $("#signUpForm").serialize()+ "&signup=true",
            dataType: 'json',
            success: function(response) {
                if(response.status == 'success'){
                    location.reload(); // Reload the page
                }
                else if(response.status == "error"){
                    $('#signUpErrLabel').html("Email is already taken.");
                }
            },
            error: function (response){
                $('#signUpErrLabel').html("Try again please.");
            },
            complete: function (data){
                $('#signUpBtn').removeClass('disabled');
                $('#signUpBtn').prop("disabled", false);
            }
        });
    });
});
