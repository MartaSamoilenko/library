<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        .body {
            margin: 0px;
        }

        .rectangle {
            text-decoration: none;
            width: 50%;
            height: 600px;
            left: 15px;
            padding-top: 15px;
            padding-bottom: 15px;
            background-color: #57a757;
            border-style: solid;
            border-color: #306a30;
        }

        .rectangleTitle {
            width: 50%;
            height: 20px;
            background-color: #fff8a5;
        }

        .back {
            background: url("/images/books.jpg");
            background-size: cover;
            opacity: 0.5;
        }

        .profileRectangle {
            width: 150px;
            top: -40px;
            left: 5px;
            padding: 5px 5px;
            background-color: #fff8a5;
            border-style: solid;
            border-color: #306a30;
        }

        .profile {
            font-size: 20px;
            font-family: arial;
            margin-left: 15%;
            margin-top: 10%;
            color: black;
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

        .name {
            font-size: 50px;
            font-family: Arial;
            margin-left: 15px;
        }

        .scroll{
            overflow: scroll;
            overflow-x: auto;
            height: 560px;
            top: 5px;
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
<div style="position: relative" class="name">Книги бібліотеки</div>
<div class="rectangle" style="position: relative">
    <form action="/user/books/showAll" method="get" style="margin-top: -10px; margin-left: 5px">
        <input type="submit" style="position: relative" class="allBooks" name="showAll"
               value="Показати всі книги">
    </form>
    <form action="/user/books/byCriteria" method="post" style="margin-top: 5px; margin-left: 5px">
        <label id="bookCriteria" for="criteria"
               style="position: relative;color: #fff8a5;font-family: arial;">Пошук: </label>
        <input id="criteria" type="text" class="inputPartCriteria" name="criteria"
               value="">
        <input type="submit" style="position: relative" class="submitCriteria" name="showByCriteria"
               value="Шукати">
    </form>
    <div class="scroll" style="position: relative">
        <table border="0" width="100%">
            <thead>
            <tr>
                <th class="rectangleTitle">Назва</th>
                <th class="rectangleTitle">Автор</th>
            </tr>
            </thead>

            <tbody>
            <#list books as book>
                <tr class="rectangleTitle">
                    <td> ${book.name}</td>
                    <td> ${book.author}</td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
    <div class="profileRectangle" style="position: relative">
        <a href="/user/myprofileuser" style="text-decoration: none" class="profile">Мій профіль</a>
    </div>
</div>
</body>
</html>