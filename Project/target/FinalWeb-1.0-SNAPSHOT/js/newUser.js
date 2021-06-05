let load = () => {
    let boton = document.getElementById("btnRegisUser");
    boton.addEventListener("click", () => {
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
            alert("Es necesario llenar todos los campos");
        else if(!regEx.test(mail))
            alert("Correo invalido")
        else {
            fetch('usuario', {
                method: 'POST',
                body: formData
            }).then(
                response => response.json()
            ).then(
                response => {
                    if (response.mensaje != undefined)
                        alert(response.message);
                    else
                        alert(mensaje);
                    document.getElementById("formulario").reset();
                }
            ).catch(
                error => console.log(error)
            )
        }
    })
}

document.addEventListener("DOMContentLoaded", load)