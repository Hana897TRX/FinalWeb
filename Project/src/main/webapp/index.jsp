<%--
  Created by IntelliJ IDEA.
  User: Lizzie Rosado
  Date: 10/6/2021
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/login.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!--<link rel="stylesheet" href="css/newUser.css">-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <script src="js/newUser.js"></script>
</head>
<body class="my-login-page">
<section class="h-100">
    <div class="container h-100">
        <div class="row justify-content-md-center h-100">
            <div class="card-wrapper">
                <div class="brand">
                    <img src="assets/img/logo.png" alt="logo" height="150" width="150"/>
                </div>
                <div class="card fat">
                    <div class="card-body">
                        <h4 class="card-title">Iniciar sesión</h4>
                        <form method="POST" action="login" class="my-login-validation" novalidate="">
                            <div class="form-group">
                                <label for="email">Usuario</label>
                                <input id="email" type="email" class="form-control" name="email" value="" required autofocus>
                            </div>

                            <div class="form-group">
                                <label for="password">Contraseña
                                    <!--<a href="forgot.html" class="float-right">
                                        Restablecer contraseña
                                    </a>-->
                                </label>
                                <input id="password" type="password" class="form-control" name="password" required data-eye>
                            </div>

                            <div class="form-group m-0">
                                <button type="submit" class="btn btn-outline-purple btn-block">
                                    Login
                                </button>
                            </div>
                            <div class="mt-4 text-center">
                                ¿Nuevo usuario? <a href="register.html" data-bs-toggle="modal" data-bs-target="#exampleModal">Crear cuenta</a>
                            </div>
                            <div class="mt-4 text-center">
                                <a href="Tutorial.html" data-bs-toggle="modal" data-bs-target="#Modal2">Tutorial</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Modal Registrar usuario-->
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
                        <div>
                            <input type="text" placeholder="Apellido(s)" name="surnameUser" id="surnameUser"class="form-control input-box"/>
                        </div>
                        <div>
                            <input type="text" placeholder="Correo" name="mailUser" id="mailUser"class="form-control input-box"/>
                        </div>
                        <div>
                            <input type="password" class="passwordModal" placeholder="Contraseña" name="passwordUser" id="passwordUser"class="form-control input-box"/>
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

<!-- Modal Tutorial (#Modal2) -->
<div class="modal fade" id="Modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="ModalLabel2">Tutorial</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <body class="my-login-page">
            <section class="h-100">
                <div class="container h-100">
                    <div class="card fat">
                        <div>
                            <div class="form-group">
                                <h4>Intercambiar un libro</h4>
                                <img src="assets/img/TipIntercambio.PNG" alt="logo" height="200" width="300"/>
                            </div>

                            <div class="form-group">
                                <label>-Elige el libro de tu preferencia.</label>
                                <label>-Da click en la portada. </label>
                                <label>-Llena la información necesaria. </label>
                                <label>-Da click en "Intercambiar".</label>
                                <label>¡Disfruta de tu nuevo libro!</label>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            </body>
            <div class="modal-footer">
                <div>
                    <!--</a>-->
                    <input type="button" value="Siguiente" id="btnNext1" class="btn-outline-purple" data-bs-toggle="modal" data-bs-target="#Modal3" data-bs-dismiss="modal">
                    <!--<a href="">-->
                    <input type="button" value="Cancelar" id="btnCerrar1" class="btn-outline-blue" data-bs-dismiss="modal">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal Tutorial2 (#Modal3) -->
<div class="modal fade" id="Modal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="ModalLabel3">Tutorial</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <body class="my-login-page">
            <section class="h-100">
                <div class="container h-100">
                    <div class="card fat">
                        <div>
                            <div class="form-group">
                                <h4>Agregar un nuevo libro</h4>
                                <img src="assets/img/TipAgregar.PNG" height="200" width="300"/>
                            </div>

                            <div class="form-group">
                                <label>-Ingresa al menu</label>
                                <label>-Da click en el botón "Add new book"</label>
                                <label>-Llena toda la información requerida de tu libro</label>
                                <label>-Da click en "Save new book"</label>
                                <label>¡Agrega todos los libros que desees!</label>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            </body>
            <div class="modal-footer">
                <div>
                    <!--</a>-->
                    <input type="button" value="Anterior" id="btnPrevious2" class="btn-outline-purple" data-bs-toggle="modal" data-bs-target="#Modal2" data-bs-dismiss="modal">
                    <!--</a>-->
                    <input type="button" value="Siguiente" id="btnNext2" class="btn-outline-purple" data-bs-toggle="modal" data-bs-target="#Modal4" data-bs-dismiss="modal">
                    <!--<a href="">-->
                    <input type="button" value="Cancelar" id="btnCerrar2" class="btn-outline-blue" data-bs-dismiss="modal">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal Tutorial3 (#Modal4) -->
<div class="modal fade" id="Modal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="ModalLabel4">Tutorial</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <body class="my-login-page">
            <section class="h-100">
                <div class="container h-100">
                    <div class="card fat">
                        <div>
                            <div class="form-group">
                                <h4>Consultar información</h4>
                                <img src="assets/img/TipMenu.PNG" height="200" width="300"/>
                            </div>

                            <div class="form-group">
                                <label>Para ingresar al menu da click en el icono</label>
                                <label>Podrás ver toda tu información como libros e intercambios realizados</label>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            </body>
            <div class="modal-footer">
                <div>
                    <!--</a>-->
                    <input type="button" value="Anterior" id="btnPrevious3" class="btn-outline-purple" data-bs-toggle="modal" data-bs-target="#Modal3" data-bs-dismiss="modal">
                    <!--<a href="">-->
                    <input type="button" value="Cancelar" id="btnCerrar3" class="btn-outline-blue" data-bs-dismiss="modal">
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
