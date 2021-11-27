$(document).ready(function() {
    function errorPopup(target){
        $(target).popover({
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
        let rerollBtn = $(this);
        $('.popover').popover('hide');
        rerollBtn.addClass('disabled');
        rerollBtn.prop("disabled", true);
        let target = '[data-target=' + rerollBtn.data("target") + ']';

        $.ajax({
            type: "GET",
            url: 'request-handler.php',
            data: {reroll: "true"},
            dataType: 'json',
            success: function(response) {
                if(response.status === 'success'){
                    $("#randomRecipes").html(response.data);
                }
                else if(response.status === "error"){
                    errorPopup(target);
                }
            },
            error: function (){
                errorPopup(target);
            },
            complete: function () {
                rerollBtn.removeClass('disabled');
                rerollBtn.prop("disabled", false);
            }
        });
    });

    $('#logInForm').on('submit', function (e) {
        e.preventDefault(); // Stop the form from submitting
        $('#logInErrLabel').empty();
        let logInBtn = $('#logInBtn');
        logInBtn.addClass('disabled');
        logInBtn.prop("disabled", true);

        $.ajax({
            type: "POST",
            url: 'request-handler.php',
            data: $("#logInForm").serialize()+ "&login=true",
            dataType: 'json',
            success: function(response) {
                if(response.status === 'success'){
                    location.reload(); // Reload the page
                }
                else if(response.status === "error"){
                    $('#logInErrLabel').html("Incorrect email/password.");
                }
            },
            error: function (){
                $('#logInErrLabel').html("Try again please.");
            },
            complete: function (){
                logInBtn.removeClass('disabled');
                logInBtn.prop("disabled", false);
            }
        });
    });

    $('#signUpForm').on('submit', function (e) {
        e.preventDefault(); // Stop the form from submitting
        $('#signUpErrLabel').empty();
        let signUpBtn = $('#signUpBtn');
        signUpBtn.addClass('disabled');
        signUpBtn.prop("disabled", true);

        $.ajax({
            type: "POST",
            url: 'request-handler.php',
            data: $("#signUpForm").serialize()+ "&signup=true",
            dataType: 'json',
            success: function(response) {
                if(response.status === 'success'){
                    location.reload(); // Reload the page
                }
                else if(response.status === "error"){
                    $('#signUpErrLabel').html("Email is already taken.");
                }
            },
            error: function (){
                $('#signUpErrLabel').html("Try again please.");
            },
            complete: function (){
                signUpBtn.removeClass('disabled');
                signUpBtn.prop("disabled", false);
            }
        });
    });

    $(document).on("click", ".login", function() {
        $('#logInModal').modal('show');
    });

    $(document).on("click", ".bookmark", function() {
        let bookmarkBtn = $(this);
        bookmarkBtn.parents(".popover").popover('hide');
        bookmarkBtn.addClass('disabled');
        bookmarkBtn.prop("disabled", true);
        let recipeid = bookmarkBtn.data("recipeid")
        let target = '[data-recipeid=' + recipeid + ']';
        let icon = bookmarkBtn.children('i').eq(0);

        if(icon.hasClass("far")){
            // The recipe is NOT bookmarked, so add it
            $.ajax({
                type: "POST",
                url: 'request-handler.php',
                data: {addbookmark: "true", recipe: recipeid},
                dataType: 'json',
                success: function(response) {
                    if(response.status === 'success'){
                        icon.removeClass('far').addClass('fas');
                    }
                    else if(response.status === "error"){
                        errorPopup(target);
                    }
                },
                error: function (){
                    errorPopup(target);
                },
                complete: function (){
                    bookmarkBtn.removeClass('disabled');
                    bookmarkBtn.prop("disabled", false);
                }
            });
        }
        else{
            // The recipe IS bookmarked, so remove it
        }
        
    });
});
