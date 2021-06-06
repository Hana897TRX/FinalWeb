<%--
  Created by IntelliJ IDEA.
  User: Lizzie Rosado
  Date: 4/6/2021
  Time: 09:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/newUser.css">
    <script src="js/newUser.js"></script>
</head>
<body id="newUserPage">

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Launch demo modal
</button>

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