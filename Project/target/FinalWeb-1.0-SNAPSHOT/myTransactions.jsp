<%--
  Created by IntelliJ IDEA.
  User: Vivianaramirez
  Date: 11/06/2021
  Time: 08:16 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <title>Mis Transacciones</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="css/transactions.css">
    <script src="js/logOff.js"></script>
</head>
<body>
<div class="d-flex flex-row">
    <div class="col-sm-2">
        <div class="title">
            <img src="assets/img/logo.png" alt="logo" height="65" width="65"/>
        </div>
        <div class="sideLeftBanner">
            <a href="/FinalWeb_war_exploded/usuario">
                <button type="button" class="item" id="btnGoUsers">
                    <span class="iconify" data-icon="bi:people-fill" data-inline="false"></span>
                    <p class="itemText">Usuarios</p>
                </button>
            </a>
            <a href="/FinalWeb_war_exploded/books">
                <button type="button" class="item" id="btnGoBooks">
                    <span class="iconify" data-icon="bi:book-half" data-inline="false"></span>
                    <p class="itemText">Libros</p>
                </button>
            </a>
            <a href="/FinalWeb_war_exploded/MyExchange">
                <button type="button" class="selectedItem" id="btnGoTranscP">
                    <span class="iconify" data-icon="vaadin:handshake" data-inline="false"></span>
                    <p class="itemText">Transacciones</p>
                </button>
            </a>
            <a href="/FinalWeb_war_exploded/Exchange">
                <button type="button" class="item" id="btnGoTranscG">
                    <span class="iconify" data-icon="ant-design:global-outlined" data-inline="false"></span>
                    <p class="itemText">Transacciones Globales</p>
                </button>
            </a>
            <a href="/FinalWeb_war_exploded/index.jsp">
                <button type="button" class="item" id="btnOff">
                    <span class="iconify" data-icon="bi:x-circle-fill" data-inline="false"></span>
                    <p class="itemText">Cerrar Sesion</p>
                </button>
            </a>
        </div>
    </div>

    <div class="col-sm-10">
        <nav class="navbar sticky-top navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="#">Mis Transacciones</a>
            </div>
        </nav>

        <div class="card shadow-sm p-3 mb-5 bg-white" style="margin-top: 1%; margin-left: 5%; margin-right: 5%; padding: 1%;">
            <div class="input-group">
                <span class="input-group-text" style="background-color: white; border: white;"><i class="bi bi-search"></i></span>
                <input type="email" class="form-control" id="search" aria-describedby="emailHelp" placeholder="Search a transaction" style="border-color: rgba(0, 0, 0, 0);">
            </div>
        </div>


        <div class="card shadow-sm p-3 mb-5 bg-white" style="margin-top: 1%; margin-left: 5%; margin-right: 5%; padding: 1%;">
        <table>
            <div class="container">
            <thead>
            <tr>
                <th>#Transaccion</th>
                <th>Usuario Dueño</th>
                <th>Nuevo dueño</th>
                <th>Fecha de intercambio</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${bookExchangeList}" var="exchange">
                <tr>
                    <td>${exchange.idExchange}</td>
                    <td>${exchange.idBookOwner}</td>
                    <td>${exchange.idBookReceiver}</td>
                    <td>${exchange.exchangeDate}</td>
                </tr>
            </c:forEach>
            </tbody>
            </div>
        </table>
        </div>
</div>
</div>
</body>
</html>
