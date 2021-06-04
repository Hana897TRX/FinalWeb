function ready(){
    changeImgOnSelected();
}

function upload(){

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