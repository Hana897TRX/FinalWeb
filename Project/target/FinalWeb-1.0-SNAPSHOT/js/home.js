function ready(){
    getTop5();
}

function getTop5(){
    let formData = new FormData();
    formData.append('action', 'GET_TOP5');

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
                let viewedSection = document.getElementById("viewedSection");
                for(let i = 0; i < response.length; i++){
                    topBooks(viewedSection, response[i]);
                }
            }
        )
        .then(
            getMoreBooks()
        )
        .catch(
            error => console.log(error)
        )
}

function getMoreBooks(){
    let formData = new FormData();
    formData.append('action', 'GET_MOREBOOKSECTION')

    fetch('books', {
        method : 'POST',
        body : formData
    })
        .then( response => response.json())
        .then(response => {
            console.log(response);
            let moreSection = document.getElementById("moreSection");
            for(let i = 0; i < response.length; i++){
                moreBooks(moreSection, response[i]);
            }

        })
        .then(
            btnShowModalTransaction()
        )
        .catch(
            error => console.log(error)
        )
}

function moreBooks(viewedSection, response){
    let card = document.createElement("div");
        card.setAttribute("class", "card");
        card.setAttribute("style", "width: 18rem; background-color: white;");
        viewedSection.append(card);

    let cardBody = document.createElement("div");
        cardBody.setAttribute("class", 'card-body');
        card.append(cardBody);

    let cardContainer = document.createElement("div");
        cardContainer.setAttribute("class", "container");
        cardBody.append(cardContainer);

    let row = document.createElement("div");
        row.setAttribute("class", "row align-items-start");
        cardContainer.append(row);

        let colImg = document.createElement("div");
            colImg.setAttribute("class", "col");
            row.append(colImg);

            let button = document.createElement("button")
                button.setAttribute("class", "imgButton")
                button.setAttribute("data-bs-toggle", "modal")
                button.setAttribute("data-bs-target", "#modalCore")
                button.setAttribute("date-id", response.idBook);
                colImg.append(button);

            let img = document.createElement("img");
                img.setAttribute("class", "book-cover");
                img.setAttribute("style", "opacity: 1.0;")
                img.setAttribute("src", "data:" + response.coverBookType + ";base64," + response.content)
                button.append(img);

    let colInformation = document.createElement("div");
        colInformation.setAttribute("class", "col");
        row.append(colInformation);

        let bookTitle = document.createElement("div");
            bookTitle.setAttribute("class", "book-title");
            bookTitle.setAttribute("style", "color: black;");
            bookTitle.textContent = response.bookName;
            colInformation.append(bookTitle);

        let bookAuthor = document.createElement("div");
            bookAuthor.setAttribute("class", "book-author-browse");
            bookAuthor.textContent = response.author;
            colInformation.append(bookAuthor);

        let bookStars = document.createElement("div");
            bookStars.setAttribute("class", "d-flex flex-row");
            colInformation.append(bookStars);

            for(let i = 0; i < 5; i++){
                let colStar = document.createElement("div")
                    colStar.setAttribute("class", "col");
                    bookStars.append(colStar);

                    let star = document.createElement("i");
                        star.setAttribute("class", "bi bi-star-fill");
                        colStar.append(star);
            }

        let divDummyAuthor = document.createElement("div");
            let imgAuthor = document.createElement("img");
                imgAuthor.setAttribute("src", "assets/img/profile.png");
                imgAuthor.setAttribute("style", "width: 30px; height: 25px;");
                divDummyAuthor.append(imgAuthor);

            let imgAuthor2 = document.createElement("img");
                imgAuthor2.setAttribute("src", "assets/img/profile2.png");
                imgAuthor2.setAttribute("style", "width: 30px; height: 25px;");
                divDummyAuthor.append(imgAuthor2);

        colInformation.append(divDummyAuthor);

}

function topBooks(viewedSection, response){
    let card = document.createElement("div");
        card.setAttribute("class", "card");
        card.setAttribute("style", "width: 18rem; background-color: #cec6ff;");
        viewedSection.append(card);

    let cardBody = document.createElement("div");
        cardBody.setAttribute("class", 'card-body');
        card.append(cardBody);

    let cardContainer = document.createElement("div");
        cardContainer.setAttribute("class", "container");
        cardBody.append(cardContainer);

    let row = document.createElement("div");
        row.setAttribute("class", "row align-items-start");
        cardContainer.append(row);

    let colImg = document.createElement("div");
        colImg.setAttribute("class", "col");
        row.append(colImg);

    let button = document.createElement("button")
        button.setAttribute("class", "imgButton")
        //data-bs-toggle="modal" data-bs-target="#modalCore"
        button.setAttribute("data-bs-toggle", "modal")
        button.setAttribute("data-bs-target", "#modalCore")
        button.setAttribute("date-id", response.idBook);
        colImg.append(button);

    let img = document.createElement("img");
        img.setAttribute("class", "book-cover");
        img.setAttribute("style", "opacity: 1.0;")
        img.setAttribute("src", "data:" + response.coverBookType + ";base64," + response.content)
        button.append(img);

    let colInformation = document.createElement("div");
        colInformation.setAttribute("class", "col");
        row.append(colInformation);

    let bookTitle = document.createElement("div");
        bookTitle.setAttribute("class", "book-title");
        bookTitle.textContent = response.bookName;
        colInformation.append(bookTitle);

        let bookStars = document.createElement("div");
        bookStars.setAttribute("class", "d-flex flex-row");
        colInformation.append(bookStars);

    for(let i = 0; i < 5; i++){
        let colStar = document.createElement("div")
        colStar.setAttribute("class", "col");
        bookStars.append(colStar);

        let star = document.createElement("i");
        star.setAttribute("class", "bi bi-star-fill white-icon");
        colStar.append(star);
    }

    let divDummyAuthor = document.createElement("div");
    let imgAuthor = document.createElement("img");
    imgAuthor.setAttribute("src", "assets/img/profile.png");
    imgAuthor.setAttribute("style", "width: 30px; height: 25px;");
    divDummyAuthor.append(imgAuthor);

    let imgAuthor2 = document.createElement("img");
    imgAuthor2.setAttribute("src", "assets/img/profile2.png");
    imgAuthor2.setAttribute("style", "width: 30px; height: 25px;");
    divDummyAuthor.append(imgAuthor2);

    colInformation.append(divDummyAuthor);
}

function btnShowModalTransaction(){
    let imgBtn = document.querySelectorAll("imgButton");

    let showModal = function(event){
        let idBook = event.target.getAttribute("date-id");

        if(idBook === "")
            return;

        fetch('books', {
            method: 'POST',
            body : { 'idBook' : idBook }
        })
            .then(

            )
    }

    imgBtn.forEach(function (element){
        element.addEventListener(showModal);
    })
}

document.addEventListener("DOMContentLoaded", ready);