function ready(){
    document.getElementById("search").addEventListener("change", search)
}

function search(event){
    find(event.currentTarget.value);
}

document.addEventListener("DOMContentLoaded", ready)