<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>MyProfile</title>
    <style type="text/css">
        .back {
            background: url("/images/books.jpg");
            background-size: cover;
            opacity: 0.5;
        }

        .body {
            margin: 0px;
        }

        .rectangle {
            text-decoration: none;
            width: 70%;
            top: 10px;
            background-color: #57a757;
            border-style: solid;
            border-color: #306a30;
        }

        .rectangle_bgc {
            text-decoration: none;
            width: 70%;
            height: 300px;
            padding-top: 5px;
            background-color: #fff8a5;
            border-style: solid;
            border-color: #306a30;
        }

        .buttons {
            text-decoration: none;
            width: 70%;
            padding-top: 5px;
        }

        .symbol {
            background: url("/images/SymbolLnz.png");
            position: absolute;
            background-size: 200px;
        }

        .singleName {
            margin: 5px;
            padding-left: 5px;
            text-decoration: none;
            background-color: #fff8a5;
            border-style: solid;
            border-color: #306a30;
        }

        .singleNameLabel {
            margin: 5px;
            width: 30%;
            padding-left: 5px;
            background-color: #fff8a5;
            border-style: solid;
            border-color: #306a30;
        }

        .logout {
            height: 35px;
            background: #fff8a5;
            font-family: arial;
            cursor: pointer;
            border-color: #306a30;
            margin-left: -5px;
        }

        .booksRectangle {
            width: 150px;
            padding: 7px 1px;
            background: #fff8a5;
            border-style: solid;
            border-color: #306a30;
            margin-left: -5px;
        }

        .books {
            font-size: 90%;
            font-family: arial;
            color: black;
            cursor: pointer;
        }

        .width {
            width: 50px;
        }

        .scroll{
            overflow: scroll;
            overflow-x: auto;
            height: 300px;
        }
    </style>
</head>
<body class="body">
<div style="position: absolute; width: 100%; height: 100%" class="back"></div>
<div style="position: absolute; width: 12%; height:24%" class="symbol"></div>
<center>
    <form action="/user/myprofileuser" style="position: relative"></form>

    <div class="rectangle" style="position: relative">
        <table border="0" width="100%">
            <tr>
                <td width="2%"></td>
                <td valign="right">
                    <div class="singleNameLabel">Прізвище</div>
                </td>
                <td width="70%">
                    <div class="singleName">${participant.lastName}</div>
                </td>
                <td width="2%"></td>
            </tr>
            <tr>
                <td width="2%"></td>
                <td>
                    <div class="singleNameLabel">Ім'я</div>
                </td>
                <td>
                    <div class="singleName">${participant.firstName}</div>
                </td>
                <td width="2%"></td>
            </tr>
            <tr>
                <td width="2%"></td>
                <td>
                    <div class="singleNameLabel">По батькові</div>
                </td>
                <td>
                    <div class="singleName">${participant.thirdName}</div>
                </td>
                <td width="2%"></td>
            </tr>
            <tr>
                <td width="2%"></td>
                <td>
                    <div class="singleNameLabel">Клас</div>
                </td>
                <td>
                    <div class="singleName">${participant.classLnz.name}</div>
                </td>
                <td width="2%"></td>
            </tr>
        </table>
        <br class="width">
        <div class=" rectangle_bgc" style="position:relative;">
            <div style="position: relative" class="scroll">
                <table border="1" width="100%" height="120px">
                    <thead>
                    <tr>
                        <th>Назва</th>
                        <th>Автор</th>
                    </tr>
                    </thead>

                    <tbody>
                    <#list books as book>
                        <tr>
                            <td> ${book.name}</td>
                            <td> ${book.author}</td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="buttons" style="position: relative">
            <table border="0" width="117.5%" height="120px">
                <thead>
                <tr>
                    <th>
                        <div class="booksRectangle">
                            <a href="/user/books" style="text-decoration: none" class="books">Книги в
                                бібліотеці</a>
                        </div>
                    </th>
                    <th>
                        <div class="logoutRectangle">
                            <form action="/user/logout" method="post">
                                <input type="submit" class="logout" name="delete"
                                       value="Вийти із системи">
                            </form>
                        </div>
                    </th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</center>
</body>
</html>