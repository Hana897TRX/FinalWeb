function ready(){
    changeImgOnSelected();
    getBooks()

    document.getElementById("newBookR").addEventListener("click", upload);
}

function getBooks(){

    fetch(
        'books', {
            method: 'GET',
            body : {
                'action' : 'GET_USER_BOOKS',
                'idOwner' : 1
            }
        })
        .then(
            response => response.json()
        )
        .then(
            console.log(response)
        )
}

function upload(){
    let not = new Notyf();
    let bookName = document.getElementById("bookName").value;
    let bookIsbn = document.getElementById("bookIsbn").value;// bookIsbn
    let bookDate = document.getElementById("bookDate").value;
    let bookAuthor = document.getElementById("bookAuthor").value;
    let selected = document.getElementById("bookStatus");
    let status = selected.options[selected.selectedIndex].text;
    let file = document.getElementById("bookCover").files[0];

    if(bookName.length > 5 && bookName.length < 20){
        if(bookIsbn.length > 5 && bookIsbn.length < 20){
            if(bookDate.length > 5 && bookDate.length <= 10){
                if(bookAuthor.length > 3 && bookAuthor.length < 20) {
                    if (status.length > 2 && status.length < 15 && status !== "Choose one") {
                        if (file != null) {

                            let formData = new FormData();

                            formData.append('bookName', bookName);
                            formData.append('bookIsbn', bookIsbn);
                            formData.append('bookDate', bookDate);
                            formData.append('bookAuthor', bookAuthor);
                            formData.append('status', status);
                            formData.append('imgCover', file);
                            formData.append('idOwner', '1')

                            fetch('books', {
                                method: 'POST',
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
                                            document.getElementById("formulario").reset()
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

document.addEventListener("DOMContentLoaded", ready);