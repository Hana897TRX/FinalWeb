<%--
  Created by IntelliJ IDEA.
  User: Lizzie Rosado
  Date: 7/6/2021
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin. Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <link rel="stylesheet" href="css/tableUsers.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <script src="js/tableUsers.js"></script>
</head>
<body>
<nav class="navbar sticky-top navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">Administración de Usuarios</a>
        <div class="row">
            <div class="col">
                <button type="button" class="btn-outline-green" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Nuevo
                </button>
                <button type="button" class="btn-outline-blue">Regresar</button>
            </div>
        </div>
    </div>
</nav>

<div class="container">
    <table class="table table-dark">
        <thead>
        <tr class="table-dark">
            <th scope="col">ID User</th>
            <th scope="col">Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Birthday</th>
            <th scope="col">Email</th>
            <th scope="col">User Type</th>
            <th scope="col">Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${usuarioslist}" var="user">
            <tr>
                <td class="table-info">${user.idUser}</td>
                <td class="table-info">${user.name}</td>
                <td class="table-info">${user.lastName}</td>
                <td class="table-info">${user.birthday}</td>
                <td class="table-info">${user.email}</td>
                <td class="table-info">${user.userType}</td>
                <td class="table-info">
                    <button class="btn btn-primary me-md-2 btn-edit" type="button" data-id="${user.idUser}"><i data-id="${user.idUser}" class="bi bi-pen" data-bs-toggle="modal" data-bs-target="#exampleModal"></i></button>
                    <button class="btn btn-danger" type="button" data-id="${user.idUser}"><i data-id="${user.idUser}" class="bi bi-trash2"></i></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">Registrar Usuario</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-md-center">
                    <form action="" method="" id="formulario">
                        <div class="sameRow">
                            <input type="text" placeholder="Nombre(s)" name="nameUser" class="form-control" id="nameUser" class="form-control input-box"/>
                        </div>
                        <div class="sameRow">
                            <input type="date" name="dateUser" id="dateUser" class="form-control"/>
                        </div>
                        <div class="sameRow">
                            <input type="text" placeholder="Apellido(s)" name="surnameUser" id="surnameUser"class="form-control input-box"/>
                        </div>
                        <div class="sameRow">
                            <input type="text" placeholder="Correo" name="mailUser" id="mailUser"class="form-control input-box"/>
                        </div>
                        <div class="sameRow">
                            <input type="password" placeholder="Contraseña" name="passwordUser" id="passwordUser"class="form-control input-box"/>
                        </div>
                        <!--<div>
                            <input type="password" placeholder="Confirme contraseña" name="reinforcePassword" id="reinforcePassword"/>
                        </div>-->
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <div>
                    <!--<a href="">-->
                    <input type="button" value="Cancelar" id="btnBack" class="btn-outline-blue" data-bs-dismiss="modal">
                    <!--</a>-->
                    <input type="button" value="Registrar" id="btnRegisUser" class="btn-outline-purple">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
