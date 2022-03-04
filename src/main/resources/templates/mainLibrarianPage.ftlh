<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style type="text/css">
        .body {
            margin: 0px;
        }

        .symbol {
            background: url("/images/SymbolLnz.png");
            position: absolute;
            background-size: 200px;
        }

        .back {
            background: url("/images/books.jpg");
            background-size: cover;
            opacity: 0.5;
        }

        .textRectangle {
            top: 10px;
            width: 200px;
            height: 30px;
            padding: 15px 15px;
            background: #fff8a5;
            font-family: arial;
            border-style: solid;
            border-color: #306a30;
            cursor: pointer;
        }

        .text {
            font-size: 150%;
            font-family: arial;
            color: black;
        }

        .logout {
            margin-top: 15px;
            height: 40px;
            margin-left: 1350px;
            font-size: 120%;
            background: #fff8a5;
            font-family: arial;
            border-style: solid;
            border-color: #306a30;
            cursor: pointer;
        }

        .logoutForm {
            height: 40px;
        }

        .rectangleBackground {
            width: 26.5%;
            top: 170px;
            padding-top: 1px;
            text-decoration: none;
            background-color: #57a757;
            border-style: solid;
            border-color: #306a30;
        }

    </style>
</head>
<body class="body">
<div style="position: absolute; width: 100%; height: 100%" class="back"></div>
<div style="position: absolute; width: 12%; height:24%" class="symbol"></div>
<div style="position: relative">

    <form action="/librarian/logout" class="logoutForm" style="width: 0px; height: 0px" method="get">
        <input type="submit" name="delete" class="logout" value="Вийти із системи">
    </form>
</div>
<center>
    <div class="rectangleBackground" style="position: relative;">
        <div class="textRectangle" style="position: relative"><a href="/librarian/participants"
                                                                 style="text-decoration: none" class="text">Всі
                користувачі</a></div>
        <h2></h2>
        <div class="textRectangle" style="position: relative"><a href="/librarian/partbooks"
                                                                 style="text-decoration: none"
                                                                 class="text">Книги на руках</a></div>
        <h2></h2>
        <div class="textRectangle" style="position: relative"><a href="/librarian/books" style="text-decoration: none"
                                                                 class="text">Книги</a></div>
        <h2></h2>
    </div>
</center>
</body>
</html>