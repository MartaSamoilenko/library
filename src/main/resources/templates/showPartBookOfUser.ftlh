<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" http-equiv="Content-Type">
    <title>Title</title>
    <style type="text/css">
        .body {
            margin: 0px;
        }

        .back {
            background: url("/images/books.jpg");
            background-size: cover;
            opacity: 0.5;
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

        .linkRectangle {
            width: 250px;
            padding: 7px 1px;
            background: #fff8a5;
            top: 10px;
            left: 5px;
            border-style: solid;
            border-color: #306a30;
        }

        .tableBackRectangle {
            width: 825px;
            height: 500px;
            left: 5px;
            top: 10px;
            background-color: #57a757;
            border-style: solid;
            border-color: #306a30;
        }

        .link {
            font-size: 90%;
            font-family: arial;
            padding: 26px;
            color: black;
            cursor: pointer;
        }

        .scroll {
            overflow: scroll;
            overflow-x: auto;
            height: 400px;
            margin-left: 5px;
            width: 815px;
            background-color: #fff8a5;
            border-style: solid;
            border-color: #306a30;
        }

        .title {
            background-color: #fff8a5;
            width: 485px;
        }

        .table {
            background-color: #fff8a5;
            border-radius: 2px;
            column-width: 300px;
            margin-top: 3px;
        }

        .btn {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body class="body">
<div style="position: absolute; width: 100%; height: 100%" class="back"></div>
<section class="container" style="position: relative">
    <div class="col-1">
        <div class="linkRectangle" style="position: relative">
            <center><a href="/librarian/participants" style="text-decoration: none" class="link">Повернутися до
                    користувачів</a></center>
        </div>
    </div>
    <div class="col-2" style="position: relative">
        <div style="position: relative" class="tableBackRectangle">
            <center>
                <div class="title"><h2>Книжки користувача ${participant.firstName} ${participant.lastName}</h2></div>
            </center>
            <center>
                <div class="scroll" style="position: relative">
                    <form action="/librarian/showBooksOfUser" method="post">

                        <table class="table" border="1">
                            <thead>
                            <tr>
                                <th>Назва</th>
                                <th>Автор</th>
                            </tr>
                            </thead>

                            <tbody>
                            <#list booksOfUser as bookOfUser>
                                <tr>
                                    <td style="width: 250px"> ${bookOfUser.name}</td>
                                    <td style="width: 250px"> ${bookOfUser.author}</td>
                                    <td style="width: 250px;position: relative;background-color: #fff8a5;cursor: pointer;"><a class="btn btn-sm btn-warning" role="button"
                                           href="/librarian/showBooksOfUser/${participant.id}/deleteBookOfUser/${bookOfUser.id}">Видалити</a>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>

                    </form>
                </div>
            </center>
        </div>
    </div>
</section>
</body>
</html>