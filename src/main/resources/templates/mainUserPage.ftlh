<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        .back{
            background: url("/images/books.jpg");
            background-size: cover;
            opacity: 0.5;
        }

        .body{
            margin: 0px;
        }

        .books{
            top: 305px;
            font-size: 35px;
            font-family: arial;
            width: 400px;
            color: #fff8a5;
        }

        .myProfile{
            top: 335px;
            font-size: 35px;
            font-family: arial;
            color: #fff8a5;
        }
        .rectangleBackBooks{
            width: 400px;
            height: 45px;
            top: 300px;
            left: 565px;
            background-color: #57a757;
            border-style: solid;
            border-color: #306a30;
        }

        .rectangleBackProfile{
            width: 400px;
            height: 45px;
            top: 370px;
            left: 565px;
            background-color: #57a757;
            border-style: solid;
            border-color: #306a30;
        }

        .symbol {
            background: url("images/SymbolLnz.png");
            position: absolute;
            background-size: 200px;
        }

    </style>
</head>
<body class="body">
<div style="position: absolute; width: 100%; height: 100%"  class="back"></div>
<div style="position: absolute; width: 12%; height:24%" class="symbol"></div>
<center>
    <div class="rectangleBackBooks" style="position: absolute"></div>
    <div class="rectangleBackProfile" style="position: absolute"></div>
    <a href="/user/books" class="books" style="position: relative; text-decoration: none">Книги в бібліотеці</a>
    <br>
    <a href="/user/myprofileuser" class="myProfile" style="position:relative; text-decoration: none">Мій профіль</a>
</center>
</body>
</html>