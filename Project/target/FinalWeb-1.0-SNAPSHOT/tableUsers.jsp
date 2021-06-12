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
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="css/transactions.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
    <script src="js/tableUsers.js"></script>
</head>
<body>
<div class="d-flex flex-row">
    <div class="col-sm-2">
        <div class="title">
            <img src="assets/img/logo.png" alt="logo" height="65" width="65"/>
        </div>
        <div class="sideLeftBanner">
            <a href="/FinalWeb_war_exploded/usuario">
                <button type="button" class="selectedItem" id="btnGoUsers">
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
                <button type="button" class="item" id="btnGoTranscP">
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
        <div>
            <nav class="navbar sticky-top navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand" href="#">Administración de Usuarios</a>
                    <div class="row">
                        <div class="col">
                            <button type="button" class="btn-outline-green" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">
                                Nuevo
                            </button>
                            <a href="FinalWeb_war_exploded/home.jsp">
                                <button type="button" class="btn-outline-blue" id="btnGoBack">Regresar</button>
                            </a>
                        </div>
                    </div>
                </div>
            </nav>

            <div class="card shadow-sm p-3 mb-5 bg-white" style="margin-top: 1%; margin-left: 5%; margin-right: 5%; padding: 1%;">
                <div class="input-group">
                    <span class="input-group-text" style="background-color: white; border: white;"><i class="bi bi-search"></i></span>
                    <input type="email" class="form-control" id="search" aria-describedby="emailHelp" placeholder="Search an user" style="border-color: rgba(0, 0, 0, 0);">
                </div>
            </div>
            <div class="card shadow-sm p-3 mb-5 bg-white" style="margin-top: 1%; margin-left: 5%; margin-right: 5%; padding: 1%;">


            <div class="card shadow-sm p-3 mb-5 bg-white" style="margin-top: 1%; margin-left: 5%; margin-right: 5%; padding: 1%;">
                <div class="container">
                    <table>
                        <thead>
                        <tr>
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
                                <td>${user.idUser}</td>
                                <td>${user.name}</td>
                                <td>${user.lastName}</td>
                                <td>${user.birthday}</td>
                                <td>${user.email}</td>
                                <td>${user.userType}</td>
                                <td>
                                    <button class="btn btn-primary me-md-2 btn-edit" type="button" data-bs-toggle="modal"
                                            data-bs-target="#editModal" data-id="${user.idUser}"><i data-id="${user.idUser}"
                                                                                                    class="bi bi-pen"
                                                                                                    data-bs-toggle="modal"
                                                                                                    data-bs-target="#editModal"></i>
                                    </button>
                                    <button class="btn btn-danger" type="button" data-id="${user.idUser}"><i
                                            data-id="${user.idUser}" class="bi bi-trash2"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
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
                                <input type="text" placeholder="Nombre(s)" name="nameUser" class="form-control"
                                       id="nameUser" class="form-control input-box"/>
                            </div>
                            <div class="sameRow">
                                <input type="date" name="dateUser" id="dateUser" class="form-control"/>
                            </div>
                            <div class="sameRow">
                                <input type="text" placeholder="Apellido(s)" name="surnameUser" id="surnameUser"
                                       class="form-control input-box"/>
                            </div>
                            <div class="sameRow">
                                <input type="text" placeholder="Correo" name="mailUser" id="mailUser"
                                       class="form-control input-box"/>
                            </div>
                            <div class="sameRow">
                                <input type="password" placeholder="Contraseña" name="passwordUser" id="passwordUser"
                                       class="form-control input-box"/>
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
                        <input type="button" value="Cancelar" id="btnBack" class="btn-outline-blue"
                               data-bs-dismiss="modal">
                        <!--</a>-->
                        <input type="button" value="Registrar" id="btnRegisUser" class="btn-outline-purple">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="editModalLabel">Editar Usuario</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row justify-content-md-center">
                        <form action="" method="" id="formularioEdit">
                            <div class="sameRow">
                                <input type="text" placeholder="Nombre(s)" name="nameUser" class="form-control"
                                       id="nameUserEdit" class="form-control input-box"/>
                            </div>
                            <div class="sameRow">
                                <input type="date" name="dateUser" id="dateUserEdit" class="form-control"/>
                            </div>
                            <div class="sameRow">
                                <input type="text" placeholder="Apellido(s)" name="surnameUser" id="surnameUserEdit"
                                       class="form-control input-box"/>
                            </div>
                            <div class="sameRow">
                                <input type="text" placeholder="Correo" name="mailUser" id="mailUserEdit"
                                       class="form-control input-box"/>
                            </div>
                            <div class="sameRow">
                                <input type="text" placeholder="Tipo de Usuario" name="userType" id="userType"
                                       class="form-control input-box"/>
                            </div>
                            <input id="idUser" type="hidden">
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <div>
                        <!--<a href="">-->
                        <input type="button" value="Cancelar" id="btnBackEdit" class="btn-outline-blue"
                               data-bs-dismiss="modal">
                        <!--</a>-->
                        <input type="button" value="Actualizar" id="btnEditUser" class="btn-outline-purple">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
