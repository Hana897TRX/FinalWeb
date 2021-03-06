let load = () => {
    let boton = document.getElementById("btnRegisUser");
    boton.addEventListener("click", regis);


    let borrado = document.querySelectorAll(".bi-trash2");
    borrado.forEach(function (elemento) {
        elemento.addEventListener("click", borrar);
    })

    getModalData();
    let botonE = document.getElementById("btnEditUser");
    botonE.addEventListener("click", update);

    document.getElementById("search").addEventListener("change", search);

    /*let btnGB = document.getElementById("btnGoBack");
    btnGB.addEventListener("click", goHome);*/
    let btnOff = document.getElementById("btnOff");
    btnOff.addEventListener("click", Off);
    /*let btnBooks = document.getElementById("btnGoBooks");
    btnBooks.addEventListener("click", Books);
    let btnTranscG = document.getElementById("btnGoTranscG");
    btnTranscG.addEventListener("click", TranscG);
    let btnTranscP = document.getElementById("btnGoTranscP");
    btnTranscP.addEventListener("click", TranscP);*/
}

let Books = () => {
    let not = new Notyf();
    let formData = new FormData();
    formData.append("page", 2);

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

let TranscG = () => {
    let not = new Notyf();
    let formData = new FormData();
    formData.append("page", 3);

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

let TranscP = () => {
    let not = new Notyf();
    let formData = new FormData();
    formData.append("page", 4);

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

let goHome = () => {
    let not = new Notyf();
    let formData = new FormData();
    formData.append("page", 1);

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

function search(event){
    find(event.currentTarget.value);
}

let regis = () => {
    let not = new Notyf();
    let name = document.getElementById("nameUser").value;
    let lastName = document.getElementById("surnameUser").value;
    let birthday = document.getElementById("dateUser").value;
    let mail = document.getElementById("mailUser").value;
    let password = document.getElementById("passwordUser").value;

    let formData = new FormData();
    formData.append("name", name);
    formData.append("lastName", lastName);
    formData.append("birthday", birthday);
    formData.append("email", mail);
    formData.append("password", password);

    let regEx = /[a-zA-Z0-9]+@+[a-z]+\.[a-z]+/

    if(name == "" || lastName == "" || !birthday || mail == "" || password == "")
        not.error("Es necesario llenar todos los campos");
    else if(!regEx.test(mail))
        not.error("Correo invalido")
    else {
        fetch('usuario', {
            method: 'POST',
            body: formData
        }).then(
            response => response.json()
        ).then(
            response => {
                console.log(response)
                if(response.mensaje == 0 || response.idUser == undefined)
                    if(response.mensaje != undefined)
                        not.error("El registro no se a??adi?? correctamente");
                    else
                        not.error("Ops!, algo pas??")
                else{
                    not.success("Registro a??adido correctamente")
                }
                document.getElementById("formulario").reset();
            }
        ).catch(
            error => console.log(error)
        )
    }
}

let update = () => {
    let not = new Notyf();
    let name = document.getElementById("nameUserEdit").value;
    let lastName = document.getElementById("surnameUserEdit").value;
    let birthday = document.getElementById("dateUserEdit").value;
    let mail = document.getElementById("mailUserEdit").value;
    let userType = document.getElementById("userType").value;
    let idUser = document.getElementById("idUser").value;

    let formData = new FormData();
    formData.append("name", name);
    formData.append("lastName", lastName);
    formData.append("birthday", birthday);
    formData.append("email", mail);
    formData.append("userType", userType);
    formData.append("idUser", idUser);

    let regEx = /[a-zA-Z0-9]+@+[a-z]+\.[a-z]+/

    if(name == "" || lastName == "" || !birthday || mail == "" || userType == "")
        not.error("Es necesario llenar todos los campos");
    else if(!regEx.test(mail))
        not.error("Correo invalido")
    else {
        fetch('usuario', {
            method: 'PUT',
            body: formData
        }).then(
            response => response.json()
        ).then(
            response => {
                console.log(response)
                if(response.idUser == 0 || response.idUser == undefined)
                    if(response.mensaje != undefined)
                        not.error("El registro no se actualizo correctamente");
                    else
                        not.error("Ops!, algo pas??")
                else{
                    not.success("Registro actualizado correctamente")
                }
                document.getElementById("formularioEdit").reset();
            }
        ).catch(
            error => console.log(error)
        )
    }
}

let borrar = function (event) {
    let not = new Notyf();
    let idUser = event.target.getAttribute("data-id");
    console.log(idUser)
    let formData = new FormData();
    formData.append("idUser", idUser);

    if(confirm("Estas seguro de eliminar el registro?")){
        fetch('usuario', {
            method: 'DELETE',
            body: formData
        }).then(
            response => response.json()
        ).then(
            response => {
                not.success(response.message);
            }
        ).catch(
            error => console.log(error)
        )
    }
}

let getModalData = function (event) {
    let getUserInfo = function(event) {
        let idUser = event.target.getAttribute("data-id");

        if(idUser == null)
            return;

        let formData = new FormData();
        formData.append('idUser', idUser);

        fetch('usuario', {
            method : 'POST',
            body : formData
        })
            .then(
                response => response.json()
            )
            .then(
                response => {
                    document.getElementById("nameUserEdit").value = response.name;
                    document.getElementById("surnameUserEdit").value = response.lastName;
                    document.getElementById("dateUserEdit").value = response.birthday;
                    document.getElementById("mailUserEdit").value = response.email;
                    document.getElementById("userType").value = response.userType;
                    document.getElementById("idUser").value = response.idUser;
                    console.log(response)
                }
            )
            .catch(
                error => console.log(error)
            )
    }

    let actualizado = document.querySelectorAll(".bi-pen");
    actualizado.forEach(function (elemento) {
        elemento.addEventListener("click", getUserInfo);
    })
}




document.addEventListener("DOMContentLoaded", load)