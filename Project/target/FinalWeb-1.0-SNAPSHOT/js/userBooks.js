function ready(){
    changeImgOnSelected();

    document.getElementById("newBookR").addEventListener("click", upload);
}

function upload(){
    var not = new Notyf();
    let bookName = document.getElementById("bookName").value;
    let bookIsbn = document.getElementById("bookIsbn").value;// bookIsbn
    let bookDate = document.getElementById("bookDate").value;
    let bookAuthor = document.getElementById("bookAuthor").value;
    let selected = document.getElementById("bookStatus");
    let status = selected.options[selected.selectedIndex].text;
    let file = document.getElementById("bookCover").files[0];

    let formData = new FormData();

    formData.append('bookName', bookName);
    formData.append('bookIsbn', bookIsbn);
    formData.append('bookDate', bookDate);
    formData.append('bookAuthor', bookAuthor);
    formData.append('status', status);
    formData.append('imgCover', file);

    fetch('books', {
        method: 'POST',
        body : formData
    })
        .then(
            response => response.json()
        )
        .then(
            response => {
                console.log(response)
                if(response.status === "1"){
                    not.success("Book has been added");
                }
                else if (response.status === "0"){
                    not.error("Error, no se ha añadadido el registro");
                }
            }
        )
        .catch(
            not.error("Error, no se ha añadadido el registro")
        )
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