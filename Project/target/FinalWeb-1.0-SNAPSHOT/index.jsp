<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!--Boot strap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/home.css">
    <script src="js/home.js"></script>
</head>
<body>

<!-- Nav bar-->
<nav class="navbar navbar-light bg-light justify-content-between" style="height: 50px;">
    <div class="container">
        <div class="input-group mb-3" style="width: 20%;">
            <span class="input-group-text input-box" id="basic-addon1"><i class="bi bi-search"></i></span>
            <input type="search" class="form-control input-box" id="exampleInputEmail1" aria-describedby="emailHelp"
                   placeholder="Search book">
        </div>

        <div class="navbar-item">
            <img src="assets/img/logo.png" alt="" width="30px" height="25px"
                 style="display: inline-block; float: none; vertical-align: top;">
        </div>
        <div class="navbar-item">
            <a> <img src="assets/img/profile_icon.png" width="25px" height="25px"> </a>
        </div>
    </div>
</nav>

<!--Top 5-->
<p class="text-capitalize for-you">Top 5</p>
<div class="d-flex flex-row" id="viewedSection"></div>

<div class="d-flex flex-row more-container">
    <div class="col">
        <!-- More -->
        <p class="text-capitalize for-you" style="margin-left: 28px;">More</p>
    </div>
</div>

<!-- More section -->
<div class="d-flex flex-row" id="moreSection"></div>

<!-- Modal -->
<div class="modal fade" id="modalCore" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Intercambiar libro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-6">
                        <center>
                            <div class="col-sm-3">
                                <!--<div class="image-bookCover">
                                    <label for="bookCover">
                                        <img id="imgOwnerCover" src="assets/img/book_cover1.jpg"
                                             class="rounded mx-auto d-block" alt="..." width="125" height="188">
                                    </label>
                                </div>-->
                            </div>
                        </center>
                        <div class="input-group mb-3">
                            <span class="input-group-text col-sm-4">Book title</span>
                            <input type="text" aria-label="Last name" class="form-control" disabled>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text col-sm-4">Book author</span>
                            <input type="text" aria-label="Last name" class="form-control" disabled>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text col-sm-4">Book buy date</span>
                            <input type="text" aria-label="Last name" class="form-control" disabled>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text col-sm-4">Book status</span>
                            <input type="text" aria-label="Last name" class="form-control" disabled>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <center>
                            <div class="col-sm-3">
                                <div class="image-bookCover">
                                    <!--<label for="bookCover">
                                        <img id="imgYourBookCover" src="assets/img/book_cover1.jpg"
                                             class="rounded mx-auto d-block" alt="..." width="125" height="188">
                                    </label>-->
                                </div>
                            </div>
                        </center>
                        <div class="input-group mb-3">
                            <span class="input-group-text col-sm-4">Your books</span>
                            <select id="bookStatus" class="form-select" aria-label="Default select example">
                                <option selected>Choose one</option>
                                <option value="New">Alicia</option>
                                <option value="Like new">The world of darkness</option>
                                <option value="Good">Goodroots</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text col-sm-4">Book title</span>
                            <input type="text" aria-label="Last name" class="form-control" disabled>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text col-sm-4">Book status</span>
                            <input type="text" aria-label="Last name" class="form-control" disabled>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Intercambiar</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>