<%--
  Created by IntelliJ IDEA.
  User: Lizzie Rosado
  Date: 9/6/2021
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <link rel="stylesheet" href="css/menu.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
</head>
<body>
    <div class="title">
        <img src="assets/img/logo.png" alt="logo" height="65" width="65"/>
    </div>
    <div class="sideLeftBanner">
        <div class="item">
            <span class="iconify" data-icon="bi:people-fill" data-inline="false"></span>
            <p class="itemText">Usuarios</p>
        </div>
        <div class="selectedItem">
            <!--<span class="selectedItem">h</span>-->
            <span class="iconify" data-icon="bi:book-half" data-inline="false"></span>
            <p class="itemText">Libros</p>
        </div>
        <div class="item">
            <span class="iconify" data-icon="vaadin:handshake" data-inline="false"></span>
            <p class="itemText">Transacciones</p>
        </div>
        <div class="item">
            <span class="iconify" data-icon="ant-design:global-outlined" data-inline="false"></span>
            <p class="itemText">Transacciones Globales</p>
        </div>
        <div class="item">
            <span class="iconify" data-icon="bi:x-circle-fill" data-inline="false"></span>
            <p class="itemText">Cerrar Sesion</p>
        </div>
    </div>
    <div class="sideRightBanner">

    </div>
</body>
</html>
