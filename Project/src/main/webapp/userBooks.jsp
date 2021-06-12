<%--
  Created by IntelliJ IDEA.
  User: Hana897TRX
  Date: 6/4/2021
  Time: 12:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <link rel="stylesheet" href="css/userBooks.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
    <link rel="stylesheet" href="css/menu.css">
    <script src="js/userBooks.js"></script>
    <link rel="stylesheet" href="css/transactions.css">
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
                <button type="button" class="selectedItem" id="btnGoBooks">
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
        <nav class="navbar sticky-top navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="#">Book Exchange</a>
                <div class="row">
                    <div class="col">
                        <button id="addBook" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                            Add new book
                        </button>
                        <a href="homeX">
                            <button type="button" class="btn btn-info">Back</button>
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

            <table>
                <div class="container">
                    <tr>
                        <th class="col">Book title</th>
                        <th class="col">ISBN</th>
                        <th class="col">Fecha de compra</th>
                        <th class="col">Author</th>
                        <th class="col">Status</th>
                        <th class="col">Cover book</th>
                        <th class="col">Acciones</th>
                    </tr>
                    <c:forEach items="${userBooks}" var="book">
                        <tr>
                            <td>${book.bookName}</td>
                            <td>${book.isbn}</td>
                            <td>${book.fechaCompra}</td>
                            <td>${book.author}</td>
                            <td>${book.status}</td>
                            <td><img src="data:${book.coverBookType};base64,${book.content}" width="100" height="158"></td>
                            <td>
                                <button class="btn btn-primary me-md-2 btn-edit" type="button" data-id="${book.idBook}" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i data-id="${book.idBook}" class="bi bi-pen"></i></button>
                                <button class="btn btn-danger" type="button" data-id="${book.idBook}"><i data-id="${book.idBook}" class="bi bi-trash2"></i></button>
                            </td>
                        </tr>
                    </c:forEach>

                        <!--<td class="col">1</td>
                        <td class="col"> Hana </td>
                        <td class="col"> Fernanda </td>
                        <td class="col"> 2000-11-09 </td>
                        <td class="col"> hana@hana.com </td>
                        <td class="col"> 2 </td>
                        <td class="col">
                            <button class="btn btn-primary me-md-2 btn-edit" type="button" data-bs-toggle="modal" data-bs-target="#editModal" data-id="${user.idUser}"><i data-id="${user.idUser}" class="bi bi-pen" data-bs-toggle="modal" data-bs-target="#editModal"></i></button>
                            <button class="btn btn-danger" type="button" data-id="${user.idUser}"><i data-id="${user.idUser}" class="bi bi-trash2"></i></button>
                        </td>-->

                </div>
            </table>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Add new book</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <form action="books" id="formulario" method="POST" enctype="multipart/form-data">
                        <div class="row justify-content-md-center">
                            <div class="col-sm-8">
                                <div class="input-group mb-3">
                                    <span class="input-group-text col-sm-3">Book name</span>
                                    <input type="text" id="bookName" class="form-control" aria-label="Username"
                                           aria-describedby="basic-addon1">
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text col-sm-3">ISBN</span>
                                    <input type="text" id="bookIsbn" class="form-control" aria-label="Username"
                                           aria-describedby="basic-addon1">
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text col-sm-3">Book date</span>
                                    <input type="date" id="bookDate" class="form-control" aria-label="Username"
                                           aria-describedby="basic-addon1">
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text col-sm-3">Book Author</span>
                                    <input type="text" id="bookAuthor" class="form-control" aria-label="Username"
                                           aria-describedby="basic-addon1">
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text col-sm-3">Book satus</span>
                                    <select id="bookStatus" class="form-select" aria-label="Default select example">
                                        <option selected>Choose one</option>
                                        <option value="New">New</option>
                                        <option value="Like new">Like new</option>
                                        <option value="Good">Good</option>
                                        <option value="Bad">Bad</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="image-bookCover">
                                    <label for="bookCover">
                                    <span class="d-inline-block" tabindex="0" data-bs-toggle="popover"
                                          data-bs-trigger="hover focus"
                                          data-bs-content="Click over and choose your cover book!">
                                        <img id="imgBookCover" src="assets/img/book_placeholder.png"
                                             class="rounded mx-auto d-block" alt="..." width="125" height="188">
                                    </span>
                                    </label>
                                    <input id="bookCover" type="file" id="formFile" name="file">
                                </div>
                            </div>
                            <input id="idBook" type="hidden">
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" id="newBookR" data-bs-dismiss="modal" class="btn btn-success">Register new book</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
