<%-- 
    Document   : login
    Created on : Nov 20, 2016, 7:29:26 PM
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML>
<html>
    <head>
        <title>Login</title>
        <!-- CSS -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    </head>
    <body class="page-login">
        <div class="center">
            <div class="card bordered z-depth-2" style="margin:0% auto; max-width:400px;">
                <div class="card-header blue">
                    <i class="material-icons medium white-text">perm_identity</i>
                </div>
                <form action="Login" method="POST">
                    <div class="card-content">
                        <!--form-->
                        <div class="input-field col s12">
                            <input id="username" name="username"type="text" class="validate">
                            <label for="username">Username</label>
                        </div>
                        <div class="input-field col s12">
                            <input id="password" name="password" type="password" class="validate">
                            <label for="password">Password</label>
                        </div>

                        <input type="checkbox" class="filled-in" id="filled-in-box">
                        <label for="filled-in-box">Remember me?</label>
                        <button type="submit" id="login" name="login_button" class="btn blue-grey right waves-effect waves-light white-text" value="Log In">Login</button>
                        <!--/form-->
                    </div>
                    <div class="card-content clearfix">
                        <div class="row">
                            <div class="col s6 text-p">
                                <a href="#forgotpass" class="blue-text tooltipped modal-trigger" data-position="top" data-delay="50" data-tooltip="Forgot your password?">Forgot your password?</a>
                            </div>
                            <div class="col s6 right-align text-p">
                                <a href="register.jsp" class="blue-text tooltipped" data-position="top" data-delay="50" data-tooltip="Register now!">Register now!</a>
                                <!-- Modal Structure -->
                                <div id="forgotpass" class="modal">
                                    <div class="modal-content">
                                        <h5 class="left-align">Forgot Password?</h5>
                                        <br>
                                        <div class="input-field col s12">
                                            <input placeholder="Email" id="forgot" type="email" class="validate">
                                            <label for="forgot">Enter your e-mail address below to reset your password.</label>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Submit</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
<!-- SCRIPTS -->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/materialize.min.js"></script>
<script>
    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal-trigger').leanModal();
    });
</script>
<script type="text/javascript">
    function valUser() {
        var usern, psswd, warning;
        usern = document.getElementById('username').value;
        psswd = document.getElementById('password').value;

        if (usern.length == 0 || psswd.length == 0) {
            if (usern.length == 0) {
                warning = "Username kosong. ";
            } else if (psswd.length == 0) {
                warning = "Password kosong. ";
            }
            alert(warning + "Tidak boleh ada yang kosong!");
        }
    }
</script>

