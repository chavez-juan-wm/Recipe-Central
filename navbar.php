<?php

$nav = '
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="index.php">Recipe Central</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="collapsibleNavbar">
<!--            <ul class="navbar-nav">-->
<!--                <li class="nav-item"><a class="nav-link" href="bookmarks.php"> Bookmarks </a></li>-->
<!--            </ul>-->

            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#signUpModal"><span class="fas fa-user-plus"></span> Sign Up </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#logInModal"><span class="fas fa-sign-in-alt"></span> Login </a>
                </li>
            </ul>
        </div>
    </nav>
';

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
                            <div class="form">
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                    </div>
                                    <input type="text" class="form-control" id="fullName" placeholder="Full name">
                                </div>
    
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                    </div>
                                    <input type="email" class="form-control" id="emailSignUp" placeholder="Email address">
                                </div>
    
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                    </div>
                                    <input type="password" class="form-control" id="password1" placeholder="Enter password">
                                </div>
    
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                    </div>
                                    <input type="password" class="form-control" id="password2" placeholder="Repeat password">
                                </div>
    
                                <div class="form-group">
                                    <button id="signUp" type="submit" class="btn btn-primary btn-block">Create Account</button>
                                </div>
    
                                <p class="text-center">Already have an account? <a data-toggle="modal" data-target="#logInModal" data-dismiss="modal" href="#">Log In</a></p>
                            </div>
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
                            <div class="form">
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                    </div>
                                    <input type="email" class="form-control" id="email" placeholder="Enter email">
                                </div>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                    </div>
                                    <input type="password" class="form-control" id="password" placeholder="Password">
                                </div>

                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="staySignedIn">
                                    <label class="form-check-label" for="staySignedIn">Stay signed in</label>
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block">Log In</button>
                                </div>
                                <p class="text-center">Don\'t have an account? <a data-toggle="modal" data-target="#signUpModal" data-dismiss="modal" href="#">Sign up</a> </p>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
';

echo $nav . $signUpModal . $logInModal;
