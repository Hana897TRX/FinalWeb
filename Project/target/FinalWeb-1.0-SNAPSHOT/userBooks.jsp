<%--
  Created by IntelliJ IDEA.
  User: Hana897TRX
  Date: 6/4/2021
  Time: 12:33 PM
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <link rel="stylesheet" href="css/userBooks.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
    <script src="js/userBooks.js"></script>
</head>
<body>
<nav class="navbar sticky-top navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">Book Exchange</a>
        <div class="row">
            <div class="col">
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Add new book
                </button>
                <button type="button" class="btn btn-info">Back</button>
            </div>
        </div>
    </div>
</nav>

<div class="container">
    <table class="table table-dark">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">First</th>
            <th scope="col">Last</th>
            <th scope="col">Handle</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td>Larry</td>
            <td>the Bird</td>
            <td>@twitter</td>
        </tr>
        </tbody>
    </table>
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
                    <form action="books" method="POST" enctype="multipart/form-data">
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
                                        <option value="1">New</option>
                                        <option value="2">Like new</option>
                                        <option value="3">Good</option>
                                        <option value="3">Bad</option>
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
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" id="newBookR" class="btn btn-success">Register new book</button>
            </div>
        </div>
    </div>
</div>

<!-- Toast -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 5">
    <div id="toastResult" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <img src="..." class="rounded me-2" alt="...">
            <strong class="me-auto">Bootstrap</strong>
            <small>11 mins ago</small>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            Hello, world! This is a toast message.
        </div>
    </div>
</div>
</body>
</html>
