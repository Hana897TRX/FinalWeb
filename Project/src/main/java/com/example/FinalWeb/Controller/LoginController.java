package com.example.FinalWeb.Controller;

import com.example.FinalWeb.Dao.UsuarioDao;
import com.example.FinalWeb.model.Usuario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "login", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String usuario = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println(usuario);
        System.out.println(password);

        if(!usuario.equals("") && !password.equals("")){
            UsuarioDao usuarioDao = new UsuarioDao();
            Usuario user = usuarioDao.getUser(usuario, password);

            System.out.println(user);

            if(user != null){
                HttpSession sesion = request.getSession();
                sesion.setAttribute("idUser", user.getIdUser());
                sesion.setAttribute("userType", user.getUserType());
                System.out.println(user.getIdUser());
                response.sendRedirect("home");
            }else{
                request.setAttribute("mensaje", "Error al iniciar sesión");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        }else {
            request.setAttribute("mensaje", "El usuario o contraseña no son validos");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
