<?php
session_start();

$nav = '
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="index.php">Recipe Central</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="advanced-search.php"> Advanced Search </a>
                </li>
            </ul>

            

';

$login = '
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" data-toggle="modal" data-target="#signUpModal" href="#"><span class="fas fa-user-plus"></span> Sign Up </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="modal" data-target="#logInModal" href="#"><span class="fas fa-sign-in-alt"></span> Login </a>
        </li>
        
    </ul>
';

$logout = '
        <li class="nav-item">
            <form method = "post" action="request-handler.php">
                <button type="submit" name="signout" class="btn-own"><span class="fas fa-sign-out-alt"></span> Logout </button>
            </form>
        </li>
';

if(isset($_SESSION['username'])) {
    $nav = $nav . "<ul class='navbar-nav ml-auto'> <li class='nav-item'> <a class='nav-link' href='#'> Create Recipe </a> </li> <li class='nav-item'> <a class='nav-link' href='#'> " . $_SESSION['username'] . "</a> </li>" . $logout . "</ul>";
}
else {
    $nav = $nav . $login;
}
$nav = $nav . "</div>
            </nav>";

$signUpModal = '
    <div class="modal" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="signUpModalLabel">Create an Account</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="card bg-light">
                        <article class="card-body mx-auto" style="max-width: 400px;">
                            <form method="post" action="request-handler.php" class="form"
                                oninput=\'confirmPassword.setCustomValidity(confirmPassword.value != password.value ? "Password does not match" : "")\'>
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                    </div>
                                    <input type="text" name="fullName" class="form-control" id="fullName" placeholder="Full name" required>
                                </div>
    
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                    </div>
                                    <input type="email" name="email" class="form-control" id="emailSignUp" placeholder="Email address" required>
                                </div>
    
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                    </div>
                                    <input type="password" name="password" class="form-control" id="password1" placeholder="Enter password" required>
                                </div>
    
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                    </div>
                                    <input type="password" class="form-control" name="confirmPassword" id="password2" placeholder="Repeat password" required>
                                </div>
    
                                <div class="form-group">
                                    <input id="signUp" type="submit" name="signup" class="btn btn-primary btn-block" value="Create Account">
                                </div>
                                <label id="errLabel"></label><br>
                                <p class="text-center">Already have an account? <a data-toggle="modal" data-target="#logInModal" data-dismiss="modal" href="#">Log In</a></p>
                            </form>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
';

$logInModal = '
    <div class="modal" id="logInModal" tabindex="-1" aria-labelledby="logInModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="logInModalLabel">Log In</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <div class="modal-body">
                    <div class="card bg-light">
                        <article class="card-body mx-auto" style="max-width: 400px;">
                            <form action="request-handler.php" method="post" class="form">
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                    </div>
                                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter email">
                                </div>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                    </div>
                                    <input type="password" name="password" class="form-control" id="login-password" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <input type="submit" name="login" class="btn btn-primary btn-block"value="Log in">
                                </div>
                                <p class="text-center">Don\'t have an account? <a data-toggle="modal" data-target="#signUpModal" data-dismiss="modal" href="#">Sign up</a> </p>
                            </form>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
';

echo $nav . $signUpModal . $logInModal;
