let load = () => {
    let boton = document.getElementById("btnRegisUser");
    boton.addEventListener("click", () => {
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
                    if(response.idUser == 0 || response.idUser == undefined)
                        if(response.mensaje != undefined)
                            not.error("El registro no se añadió correctamente");
                        else
                            not.error("Ops!, algo pasó")
                    else{
                        not.success("Registro añadido correctamente")
                    }
                    document.getElementById("formulario").reset();
                }
            ).catch(
                error => console.log(error)
            )
        }
    })
}

document.addEventListener("DOMContentLoaded", load)