<%--
  Created by IntelliJ IDEA.
  User: Vivianaramirez
  Date: 11/06/2021
  Time: 04:12 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transacciones</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/transactions.css">
    <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
    <link rel="stylesheet" href="css/menu.css">
</head>
<body>
    <div class="d-flex flex-row">
        <div class="col-sm-2">
            <div class="title">
                <img src="assets/img/logo.png" alt="logo" height="65" width="65"/>
            </div>
            <div class="sideLeftBanner">
                <button type="button" class="item">
                    <span class="iconify" data-icon="bi:people-fill" data-inline="false"></span>
                    <p class="itemText">Usuarios</p>
                </button>
                <button type="button" class="item">
                    <span class="iconify" data-icon="bi:book-half" data-inline="false"></span>
                    <p class="itemText">Libros</p>
                </button>
                <button type="button" class="item">
                    <span class="iconify" data-icon="vaadin:handshake" data-inline="false"></span>
                    <p class="itemText">Transacciones</p>
                </button>
                <button type="button" class="selectedItem">
                    <span class="iconify" data-icon="ant-design:global-outlined" data-inline="false"></span>
                    <p class="itemText">Transacciones Globales</p>
                </button>
                <button type="button" class="item">
                    <span class="iconify" data-icon="bi:x-circle-fill" data-inline="false"></span>
                    <p class="itemText">Cerrar Sesion</p>
                </button>
            </div>
        </div>
        <div class="col-sm-10">
            <table>
                <thead>
                <tr>
                    <th>#Transaccion</th>
                    <th>Usuario Dueño</th>
                    <th>Nuevo dueño</th>
                    <th>Identificador libro</th>
                    <th>Fecha de intercambio</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${bookExchangeList}" var="exchange">
                    <tr>
                        <td>${exchange.idExchange}</td>
                        <td>${exchange.idBookOwner}</td>
                        <td>${exchange.idBookReceiver}</td>
                        <td>${exchange.idBook}</td>
                        <td>${exchange.exchangeDate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
