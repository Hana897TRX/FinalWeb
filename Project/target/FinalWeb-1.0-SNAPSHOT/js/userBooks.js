function ready(){
    changeImgOnSelected();

    document.getElementById("newBookR").addEventListener("click", uploadAndSave);
    document.getElementById("addBook").addEventListener("click", clear);
    document.getElementById("search").addEventListener("change", search);

    getModalData();
    deleteBook();

    let btnOff = document.getElementById("btnOff");
    btnOff.addEventListener("click", Off);
}

let Off = () => {
    let not = new Notyf();
    let formData = new FormData();
    formData.append("page", 0);

    fetch('usuario', {
        method: 'POST',
        body: formData
    }).then(
        response => response.json()
    ).then(
        response => {
            console.log(response)
        }
    ).catch(
        error => console.log(error)
    )
}

function clear(){
    document.getElementById("newBookR").textContent = "Save new book";
    document.getElementById("formulario").reset();
}

function getModalData() {

    let editBtns = document.querySelectorAll(".btn-edit");

    let getBookInfo = function(event) {
        let bookId = event.target.getAttribute("data-id");

        if(bookId == null)
            return;

        let formData = new FormData();
        formData.append('idBook', bookId);

        fetch('books', {
            method : 'POST',
            body : formData
        })
            .then(
                response => response.json()
            )
            .then(
                response => {
                    console.log(response);
                    console.log(new Date(response.fechaCompra).toISOString());

                    document.getElementById("bookName").value = response.bookName;
                    document.getElementById("bookIsbn").value = response.isbn;
                    document.getElementById("bookDate").value = response.fechaCompra;
                    document.getElementById("bookAuthor").value = response.author;
                    document.getElementById("bookStatus").value = response.status;
                    document.getElementById("imgBookCover").setAttribute("src", "data:" + response.coverBookType + ";base64," + response.content)
                    document.getElementById("idBook").value = response.idBook;
                    document.getElementById("newBookR").textContent = "Save changes";
                }
            )
            .catch(
                error => console.log(error)
            )
    }

    editBtns.forEach(function (element) {
        element.addEventListener("click", getBookInfo)
    })
}

function uploadAndSave(){
    let not = new Notyf();
    let bookName = document.getElementById("bookName").value;
    let bookIsbn = document.getElementById("bookIsbn").value;// bookIsbn
    let bookDate = document.getElementById("bookDate").value;
    let bookAuthor = document.getElementById("bookAuthor").value;
    let selected = document.getElementById("bookStatus");
    let status = selected.options[selected.selectedIndex].text;
    let file = document.getElementById("bookCover").files[0];
    let method = 'POST';

    if(bookName.length > 5 && bookName.length < 20){
        if(bookIsbn.length > 5 && bookIsbn.length < 20){
            if(bookDate.length > 5 && bookDate.length <= 10){
                if(bookAuthor.length > 3 && bookAuthor.length < 20) {
                    if (status.length > 2 && status.length < 15 && status !== "Choose one") {
                        if (file != null) {

                            let formData = new FormData();

                            if(document.getElementById("idBook").value !== ""){
                                formData.append('idBook', document.getElementById("idBook").value);
                                method = 'PUT'
                            }

                            formData.append('bookName', bookName);
                            formData.append('bookIsbn', bookIsbn);
                            formData.append('bookDate', bookDate);
                            formData.append('bookAuthor', bookAuthor);
                            formData.append('status', status);
                            formData.append('imgCover', file);
                            formData.append('idOwner', '1')

                            fetch('books', {
                                method: method,
                                body: formData
                            })
                                .then(
                                    response => response.json()
                                )
                                .then(
                                    response => {
                                        console.log(response)
                                        if (response.status === "1") {
                                            not.success("Book has been added");
                                            document.getElementById("formulario").reset();
                                        } else if (response.status === "0") {
                                            not.error("Error, no se ha añadadido el registro");
                                        }
                                    }
                                )
                                .catch(
                                    not.error("Error, no se ha añadadido el registro")
                                )
                        } else
                            not.error("¡Book cover is empty!")
                    } else
                        not.error("¡Book status isn't valid!")
                }else
                    not.error("¡Book author is empty!")
            }
            else
                not.error("¡You didn't choose a book date!")
        }
        else
            not.error("¡Book ISBN is empty!")
    }
    else
        not.error("¡Book Name is empty!")

}

function changeImgOnSelected(){
    let inputImg = document.getElementById("bookCover");
    let imgPreview = document.getElementById("imgBookCover");

    inputImg.onchange = evt => {
        const [file] = inputImg.files
        if (file) {
            imgPreview.setAttribute("src", URL.createObjectURL(file));
        }
    }
}

function deleteBook(){
    let btnDelete = document.querySelectorAll(".btn-danger");

    let deleteX = function(event){
        let idBook = event.target.getAttribute("data-id");

        let formData = new FormData();
        formData.append('idBook', idBook);

        fetch('books', {
            method: 'DELETE',
            body : formData
        })
    }

    btnDelete.forEach(function (element) {
        element.addEventListener("click", deleteX)
    })
}

function search(event){
    find(event.currentTarget.value);
}

document.addEventListener("DOMContentLoaded", ready);