<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login</title>
    <style type="text/css">
        .login {
            background: url("images/lnz.jpg") no-repeat center;
            background-size: cover;
            opacity: 0.5;
        }

        .label {
            font-size: 35px;
            font-family: Arial;
            color: #fff8a5;
        }

        .input {
            font-size: 35px;
            font-family: Arial;
            background-color: #fff8a5;
            color: #306a30;
        }

        .symbol {
            background: url("images/SymbolLnz.png");
            position: absolute;
            background-size: 200px;
        }

        .body {
            margin: 0px;
        }

        .rectangleBackground {
            width: 480px;
            height: 270px;
            top: 200px;
            background-color: #57a757;
            border-style: solid;
            border-color: #306a30;
        }

        .submit{
            height: 35px;
            background: #fff8a5;
            font-family: Arial;
            font-size: large;
            border-style: solid;
            border-color: #306a30;
            cursor: pointer;
        }
    </style>
    <link src="style/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body class="body">
<form action="/login" method="post" enctype="multipart/form-data">
    <div style="position: absolute; width: 100%; height: 100%" class="login"></div>
    <div style="position: absolute; width: 12%; height:24%" class="symbol"></div>
    <center>
    <div class="rectangleBackground" style="position: relative">
                <br>
                <label class="label" id="loginLabel" for="loginInput"> Логін </label>
                <br>
                <input class="input" id="loginInput" type="text" name="login" value=""/>
                <br>
                <label class="label" id="passLabel" for="passInput"> Пароль </label>
                <br>
                <input class="input" id="passInput" type="password" name="password" value=""/>
                <h2></h2>
                <input class="submit" type="submit" value="Увійти в систему"/>
    </div>
    </center>
</form>
</body>
</html>