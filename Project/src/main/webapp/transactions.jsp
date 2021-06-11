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
</head>
<body>
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
</body>
</html>
