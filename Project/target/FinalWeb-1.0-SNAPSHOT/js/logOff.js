function ready(){
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

document.addEventListener("DOMContentLoaded", ready);