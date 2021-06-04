function ready(){
    getBooks();
}

function getBooks(){
    fetch('books', {
        method: 'GET'
    })
        .then(
            response => response.json()
        )
        .then(
            response => {
                console.log(response);
            }
        )
}

document.addEventListener("DOMContentLoaded", ready);