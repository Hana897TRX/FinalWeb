function ready(){
    getBooks();
}

function getBooks(){
    fetch('books', {
        method: 'GET',
        body: {
            'action' : 'GET_BOOKS'
        }
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