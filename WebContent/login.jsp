<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html PUBLIC>

<html lang="en">

<head>
    <meta charset="utf-8">

    <title>Enter your data</title>
    <meta name="description" content="Enter your data">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>


    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Material icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


</head>

<body>

    <div class="row container" style="margin-top: 100px;">
        <form class="col s12 m8 l4 offset-l4 offset-m2" action="login" method="post">
            <h5>Login</h5>

            <div class="row">
                <div class="input-field col s12" name="username">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="username" name="username" type="text" class="validate">
                    <label for="username">Username</label>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">lock</i>
                    <input id="password" name="password" type="password" class="validate">
                    <label for="password">Password</label>
                </div>
            </div>

            <button class="btn waves-effect waves-light right" type="submit" value="login">Login
            </button>

        </form>
    </div>





    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });

    </script>

</body>

</html>