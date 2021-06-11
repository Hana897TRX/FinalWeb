function ready(){
    getBooks();
}

function getBooks(){
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
                    viewedCard(viewedSection, response[i]);
                }
            }
        )
}

function viewedCard(viewedSection, response){
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

document.addEventListener("DOMContentLoaded", ready);