<!DOCTYPE html>
<html lang="en">
<head>
    <title>Книги на руках</title>
    <link href="style/bootstrap.min.css"
          rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style type="text/css">
        .body {
            margin: 0px;
        }

        .container {
            display: flex;
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

        .logout {
            height: 35px;
            font-family: arial;
            cursor: pointer;
            top: 5px;
            background: #fff8a5;
            border-style: solid;
            border-color: #306a30;
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

        .col-1 {
            flex: 20%;
        }

        .col-2 {
            flex: 65%;
        }

        .tableBackRectangle {
            width: 700px;
            height: 675px;
            left: 5px;
            top: 15px;
            background-color: #57a757;
            border-style: solid;
            border-color: #306a30;
        }

        .allBooks {
            height: 35px;
            background: #fff8a5;
            font-family: arial;
            cursor: pointer;
            border-style: solid;
            border-color: #306a30;
            margin-top: 5px;
            margin-left: 5px;
        }

        .submitClass {
            height: 20px;
            background: #fff8a5;
            border: 0px;
            cursor: pointer;
            left: 5px;
        }

        .title {
            background-color: #fff8a5;
            width: 185px;
        }

        .scroll-1 {
            overflow: scroll;
            overflow-x: auto;
            height: 155px;
            margin-left: 2px;
            width: 690px;
            background-color: #fff8a5;
            border-style: solid;
            border-color: #306a30;
        }

        .scroll-2 {
            overflow: scroll;
            overflow-x: auto;
            height: 290px;
            margin-left: 2px;
            width: 690px;
            background-color: #fff8a5;
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
                <div class="linkRectangle" style="position: relative"><a href="/librarian/books"
                                                                         style="text-decoration: none"
                                                                         class="link">Книги</a></div>

                <h2></h2>
                <form action="/librarian/partbooks/logout" method="get">
                    <input style="position: relative" type="submit" name="delete" class="logout"
                           value="Вийти із системи">
                </form>
            </center>
        </div>
    </div>
    <div class="col-2">
        <div style="position: relative" class="tableBackRectangle">
            <div style="position: relative">
                <form action="/librarian/partbooks/showAll" method="get">
                    <input type="submit" class="allBooks" name="showAll" value="Показати всі книги на руках">
                </form>
            </div>
            <h2></h2>
            <div style="position: relative" class="booksByClass">
                <form action="/librarian/partbooks/selectClass" method="post">
                    <label id="participantClassLabel" for="participantClassInput"
                           style="position: relative; color: #fff8a5; left: 5px">Клас: </label>
                    <select style="background-color: #fff8a5; margin-left: 5px" name="classLnzId">
                        <#list classLnzs as classLnz>
                            <option name="classLnzid" value="${classLnz.id}">
                                ${classLnz.name}
                            </option>
                        </#list>
                    </select>
                    <input type="submit" class="submitClass" name="showByClass"
                           value="Показати користувачів за даним класом">
                </form>
            </div>
            <center>
                <h2 class="title">Книги на руках</h2>
            </center>
            <div class="scroll-1">
                <table class="table" border="1">
                    <tr>
                        <th>Прізвище</th>
                        <th>Ім'я</th>
                        <th>По-бфтькові</th>
                        <th>Клас</th>
                        <th>Назва книги</th>
                        <th>Автор книги</th>
                    </tr>

                    <#list partBooks as partbook>
                        <tr>
                            <form action="/librarian/partbooks/delete" method="get">
                                <td>${partbook.participant.lastName}</td>
                                <td>${partbook.participant.firstName}</td>
                                <td>${partbook.participant.thirdName}</td>
                                <td>${partbook.participant.classLnz.name}</td>
                                <td>${partbook.book.name}</td>
                                <td>${partbook.book.author}</td>
                                <input type="hidden" name="id" value="${partbook.id}">
                                <td><input type="submit"
                                           style="position: relative; background-color: #fff8a5; cursor: pointer"
                                           value="Видалити"></td>
                            </form>
                        </tr>
                    </#list>
                </table>
            </div>
            <center>
                <h2 class="title">Вільні книги</h2>
            </center>
            <div class="scroll-2">
                <table class="table" border="1">
                    <tr>
                        <th>Назва</th>
                        <th>Автор</th>
                        <th>Користувач</th>
                    </tr>

                    <#list books as book>
                        <tr>
                            <form action="/librarian/partbooks/create" method="post">
                                <td> ${book.name}</td>
                                <td> ${book.author}</td>
                                <td>
                                    <input type="hidden" name="bookid" value="${book.id}"/>
                                    <select name="participantid" style="background-color: #fff8a5; margin-left: 5px"
                                            id="booksSelect_${book.id}">
                                        <option value="Please, choose one from list">Обрати користувача</option>
                                        <#list participants as participant>
                                            <option id="participant_${participant.id}"
                                                    value="${participant.id}">
                                                ${participant.lastName} ${participant.firstName } ${participant.thirdName} ${participant.classLnz.name}
                                            </option>
                                        </#list>
                                    </select>
                                </td>
                                <td>
                                    <input type="submit"
                                           style="position: relative; background-color: #fff8a5; cursor: pointer"
                                           value="Додати користувача">
                                </td>
                            </form>
                        </tr>
                    </#list>
                </table>
            </div>
        </div>
    </div>
</section>
</body>
</html>