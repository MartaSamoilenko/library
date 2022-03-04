<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml" xmlns:form="http://www.w3.org/1999/html">
<head>
    <title>Книги</title>
    <link href="style/bootstrap.min.css"
          rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, text/html, charset=UTF-8">
    <style type="text/css">
        .body {
            margin: 0px;
        }

        .back {
            background: url("/images/books.jpg");
            background-size: cover;
            opacity: 0.5;
        }

        .linkRectangle {
            width: 150px;
            padding: 7px 1px;
            background: #fff8a5;
            font-family: arial;
            top: 10px;
            border-style: solid;
            border-color: #306a30;
        }

        .link {
            font-size: 89%;
            font-family: arial;
            padding: 26px;
            color: black;
            cursor: pointer;
        }

        .linkBackRectangle {
            width: 175px;
            height: 162px;
            background: #57a757;
            left: 15px;
            top: 15px;
            border-style: solid;
            border-color: #306a30;
        }

        .logout {
            height: 35px;
            font-family: arial;
            cursor: pointer;
            top: 5px;
            background: #fff8a5;
            border-style: solid;
            border-color: #306a30;
        }

        .tableBackRectangle {
            width: 825px;
            height: 665px;
            left: 5px;
            top: 15px;
            background-color: #57a757;
            border-style: solid;
            border-color: #306a30;

        }

        .rectangleTitle {
            width: 50%;
            height: 20px;
            background-color: #fff8a5;
        }

        .scroll {
            height: 400px;
            overflow: scroll;
            overflow-x: hidden;
        }

        .container {
            display: flex;
        }

        .col-1 {
            flex: 20%;
        }

        .col-2 {
            flex: 65%;
        }

        .label {
            font-size: 15px;
            font-family: arial;
            color: #fff8a5;
        }

        .input {
            font-size: 15px;
            font-family: arial;
            background-color: #fff8a5;
            color: #306a30;
        }

        .submit {
            margin-left: 20px;
            margin-top: 5px;
            background-color: #fff8a5;
            height: 30px;
            width: 80px;
            font-family: fantasy;
            font-size: 17px;
            border: none;
            cursor: pointer;
            border-style: solid;
            border-color: #306a30;
        }

        .table {
            padding-left: 18px;
        }

        .inputPartCriteria {
            background-color: #fff8a5;
        }

        .submitCriteria {
            height: 20px;
            background: #fff8a5;
            border: 0px;
            cursor: pointer;
        }

        .allBooks {
            height: 35px;
            background: #fff8a5;
            font-family: arial;
            cursor: pointer;
            border-style: solid;
            border-color: #306a30;
        }

    </style>
</head>

<body class="body">
<div style="position: absolute; width: 100%; height: 100%" class="back"></div>
<section class="container" style="position: relative">
    <div class="col-1">
        <div class="linkBackRectangle" style="position: relative">
            <center>
                <div class="linkRectangle" style="position: relative"><a href="/librarian/participants"
                                                                         style="text-decoration: none"
                                                                         class="link">Користувачі</a></div>
                <h2></h2>
                <div class="linkRectangle" style="position: relative"><a href="/librarian/partbooks"
                                                                         style="text-decoration: none" class="link">Книги
                        на
                        руках</a></div>
                <h2></h2>

                <form action="/librarian/books/logout" method="get">
                    <input type="submit" style="position: relative" name="delete" class="logout"
                           value="Вийти із системи">
                </form>

            </center>
        </div>
    </div>

    <div class="col-2" style="position: relative">
        <div style="position: relative" class="tableBackRectangle">
            <center>
                <h2 style="color: #fff8a5;font-family: arial; margin-top: 5px">Книги бібліотеки</h2>
                <form action="/librarian/books/showAll" method="get" style="margin-top: -15px">
                    <input type="submit" style="position: relative" class="allBooks" name="showAll"
                           value="Показати всі книги">
                </form>
                <form action="/librarian/books/byCriteria" method="post" style="margin-top: 5px">
                    <label id="bookCriteria" for="criteria"
                           style="position: relative;color: #fff8a5;font-family: arial;">Пошук: </label>
                    <input id="criteria" type="text" class="inputPartCriteria" name="criteria"
                           value="">
                    <input type="submit" style="position: relative" class="submitCriteria" name="showByCriteria"
                           value="Шукати">
                </form>
                <div class="scroll">
                    <table width="95%" height="120px">
                        <thead>
                        <tr>
                            <th class="rectangleTitle">Назва</th>
                            <th class="rectangleTitle">Автор</th>
                            <th></th>
                        </tr>
                        </thead>

                        <tbody>
                        <#list books as book>
                            <tr>
                                <td class="rectangleTitle"> ${book.name}</td>
                                <td class="rectangleTitle"> ${book.author}</td>
                                <td class="rectangleTitle"><a class="btn btn-sm btn-warning" style="text-decoration: none; color: black; background-color: #fff8a5; cursor: pointer" role="button"
                                                              href="/librarian/books/delete/${book.id}">Видалити</a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </center>


            <div style="position: relative">
                <form action="/librarian/books/create" class="form" method="post">
                    <table class="table">
                        <tbody>
                        <tr>
                            <label id="createBlock" class="table" style="color:#fff8a5 ">Введіть назву книги і автора. Натисніть
                                "Додати" щоб книга з’явилась
                                у
                                бібліотеці</label>
                        </tr>
                        <tr>
                            <td><label class="label" style="width: 200px" id="bookNameLabel" for="bookNameInput">Назва
                                    Книги: </label>
                            </td>
                            <td><input class="input" id="bookNameInput" type="text" name="name" value=""/></td>
                        </tr>
                        <tr>
                            <td><label class="label" style="width: 200px" id="bookAuthorLabel" for="bookAuthorInput">Автор: </label>
                            </td>
                            <td><input class="input" id="bookAuthorInput" type="text" name="author" value=""/></td>
                        </tr>
                        <tr>
                            <td><label class="label" style="width: 200px" id="bookValue"
                                       for="bookValueInput">Кількість: </label></td>
                            <td><input class="input" id="bookValueInput" type="text" name="value" value=""/></td>
                        </tr>
                        </tbody>
                    </table>
                    <input class="submit" type="submit" value="Додати">
                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>