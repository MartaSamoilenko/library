<!DOCTYPE html>
<html>
<head>
    <title>Учні</title>
    <link href="style/bootstrap.min.css"
          rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" http-equiv="Content-Type">
    <style type="text/css">
        .body {
            margin: 0px;
        }

        .back {
            background: url("/images/books.jpg");
            background-size: cover;
            opacity: 0.5;
        }

        .col-1 {
            flex: 20%;
        }

        .col-2 {
            flex: 65%;
        }

        .container {
            display: flex;
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

        .tableBackRectangle {
            width: 825px;
            height: 580px;
            left: 5px;
            top: 15px;
            background-color: #57a757;
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

        .allParticipants {
            height: 35px;
            background: #fff8a5;
            font-family: arial;
            cursor: pointer;
            top: 5px;
            left: 5px;
            border-style: solid;
            border-color: #306a30;
        }

        .submitClass {
            height: 20px;
            background: #fff8a5;
            border: 0px;
            left: 5px;
        }

        .submitCriteria {
            height: 20px;
            background: #fff8a5;
            border: 0px;
            cursor: pointer;
            left: 5px;
        }

        .title {
            background-color: #fff8a5;
            width: 140px;
        }

        .tablePart {
            background-color: #fff8a5;
        }

        .scroll {
            overflow: scroll;
            overflow-x: auto;
            height: 155px;
            margin-left: 3px;
            width: 815px;
            background-color: #fff8a5;
            border-style: solid;
            border-color: #306a30;
        }

        .btn {
            text-decoration: none;
            color: black;
            cursor: pointer;
            background-color: #fff8a5;
        }

        .newPart {
            margin-left: 5px;
        }

        .inputPart {
            background-color: #fff8a5;
        }

        .inputPartCriteria {
            background-color: #fff8a5;
            margin-top: 5px;
            margin-left: 5px;
        }

        .label {
            color: #fff8a5;
        }

        .addSub {
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
    </style>
</head>
<body class="body">
<div style="position: absolute; width: 100%; height: 100%" class="back"></div>
<section class="container" style="position: relative">
    <div class="col-1">
        <div class="linkBackRectangle" style="position: relative">
            <center>
                <div class="linkRectangle" style="position: relative"><a href="/librarian/partbooks"
                                                                         style="text-decoration: none" class="link">Книги
                        на руках</a>
                </div>
                <h2></h2>
                <div class="linkRectangle" style="position: relative"><a href="/librarian/books"
                                                                         style="text-decoration: none" class="link">Книги</a>
                </div>
                <h2></h2>
                <form action="/librarian/participants/logout" method="get">
                    <input type="submit" style="position: relative" name="delete" class="logout"
                           value="Вийти із системи">
                </form>
            </center>
        </div>
    </div>
    <div class="col-2" style="position: relative">
        <div style="position: relative" class="tableBackRectangle">
            <div style="position: relative">
                <form action="/librarian/participants/showAll" method="get">
                    <input type="submit" style="position: relative" class="allParticipants" name="showAll"
                           value="Показати всіх користувачів">
                </form>
            </div>
            <h2></h2>
            <div style="position: relative" class="participantsBy">
                <form action="/librarian/participants/selectClass" method="post">
                    <label id="participantClassLabel" for="participantClassInput"
                           style="position: relative; font-family: arial;
    position: relative;
    color: #fff8a5;
    left: 5px">Клас: </label>
                    <select style=" background-color: #fff8a5; margin-left: 5px" name="classLnzId">
                    <#list classLnzs as classLnz>
                        <option name="classLnzid" value="${classLnz.id}">
                            ${classLnz.name}
                        </option>
                    </#list>
                    </select>
                    <input type="submit" class="submitClass"
                           style="position: relative; background-color: #fff8a5;cursor: pointer;" name="showByClass"
                           value="Показати користувачів за даним класом">
                </form>
                <form action="/librarian/participants/byCriteria" method="post">
                    <label id="participantCriteria" for="criteria"
                           style="position: relative;
    color: #fff8a5;
    font-family: arial;
    left: 5px;">Пошук: </label>
                    <input id="criteria" type="text" class="inputPartCriteria" name="criteria"
                           value="">
                    <input type="submit" style="position: relative" class="submitCriteria" name="showByCriteria"
                           value="Шукати">
                </form>
            </div>
            <center>
                <div class="title"><h2>Користувачі</h2></div>
            </center>
            <div class="scroll">
                <table class="tablePart" border="1">
                    <thead>
                    <tr>
                        <th>Прізвище</th>
                        <th>Ім'я</th>
                        <th>По-батькові</th>
                        <th>Логін</th>
                        <#--                        <th>Пароль</th>-->
                        <th>Роль</th>
                        <td>Клас</td>
                    </tr>
                    </thead>
                    <tbody>
                    <#list participants as participant>
                        <tr>
                            <td> ${participant.lastName}</td>
                            <td> ${participant.firstName}</td>
                            <td> ${participant.thirdName}</td>
                            <td> ${participant.login}</td>
                            <#--                            <td> ${participant.password}</td>-->
                            <td> ${participant.participantType.name}</td>
                            <td> ${participant.classLnz.name}</td>
                            <td><a class="btn btn-sm btn-warning" role="button"
                                   href="/librarian/showBooksOfUser/${participant.id}">Книжки користувача</a></td>
                            <td><a class="btn btn-sm btn-warning" role="button"
                                   href="/librarian/participants/delete/${participant.id}">Видалити</a></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>

            <h2></h2>
            <div class="newPart">
                <form action="/librarian/participants/create" method="post">
                    <label id="createBlock" class="label"> Введіть ім'я, прізвище та роль учасника. Натисніть "Додати"
                        щоб учасник
                        з’явився
                        у
                        бібліотеці</label>
                    <table class="table">
                        <tbody>
                        <tr>
                            <td><label class="label" id="participantSurnameLabel" for="participantSurnameInput">Прізвище: </label>
                            </td>
                            <td><input id="participantSurnameInput" type="text" class="inputPart" name="lastName"
                                       value=""/></td>
                        </tr>
                        <tr>
                            <td><label class="label" style="width: 200px" id="participantNameLabel"
                                       for="participantNameInput">Ім'я: </label>
                            </td>
                            <td><input id="participantNameInput" type="text" class="inputPart" name="firstName"
                                       value=""/></td>
                        </tr>
                        <tr>
                            <td><label class="label" style="width: 200px" id="participantThirdNameLabel"
                                       for="participantThirdNameInput">По-батькові: </label></td>
                            <td><input id="participantThirdNameInput" type="text" class="inputPart" name="thirdName"
                                       value=""/></td>
                        </tr>
                        <tr>
                            <td><label class="label" style="width: 200px" id="participantLoginLabel"
                                       for="participantLoginInput">Логін: </label>
                            </td>
                            <td><input id="participantLoginInput" type="text" class="inputPart" name="login" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <td><label class="label" style="width: 200px" id="participantPasswordLabel"
                                       for="participantPasswordInput">Пароль: </label></td>
                            <td><input id="participantPasswordInput" type="text" class="inputPart" name="password"
                                       value=""/></td>
                        </tr>
                        <tr>
                            <td><label class="label" id="participantClassLabel"
                                       for="participantClassInput">Клас: </label></td>
                            <td>
                                <select name="classLnzId" class="inputPart">
                                    <#list classLnzs as classLnz>
                                        <option name="classlnzid" value="${classLnz.id}">
                                            ${classLnz.name}
                                        </option>
                                    </#list>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label class="label" id="participantTypeLabel" for="participantTypeInput">Роль: </label>
                            </td>
                            <td>
                                <select name="participantTypeId" class="inputPart">
                                    <#list participantTypes as participantType>
                                        <option name="participanttypeid" value="${participantType.id}">
                                            ${participantType.name}
                                        </option>
                                    </#list>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="submit" class="addSub" value="Додати">
                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>