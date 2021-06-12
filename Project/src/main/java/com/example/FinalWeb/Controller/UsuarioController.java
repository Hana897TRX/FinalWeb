package com.example.FinalWeb.Controller;

import com.example.FinalWeb.Dao.BookDao;
import com.example.FinalWeb.Dao.UsuarioDao;
import com.example.FinalWeb.model.Book;
import com.example.FinalWeb.model.Usuario;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "usuario", value = "/usuario")
@MultipartConfig
public class UsuarioController extends HttpServlet {
    private int idUser = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int message = 0;
        int userType = 0;

        HttpSession sesion = request.getSession(false);

        if(sesion.getAttribute("idUser") != null){
            System.out.print(sesion.getAttribute("idUser"));
            message = (Integer)sesion.getAttribute("idUser");
            userType = (Integer)sesion.getAttribute("userType");
            System.out.print("User controller: " + message);

            if(message != 0 && userType != 3 ) {
                idUser = message;
                UsuarioDao usuarioDao = new UsuarioDao();
                List<Usuario> usuariosList = usuarioDao.getUsers();
                request.setAttribute("usuarioslist", usuariosList);
                request.getRequestDispatcher("/tableUsers.jsp").forward(request, response);
            }else if(message != 0 && userType == 3){
                response.sendRedirect("home.jsp");
            }else{
                response.sendRedirect("index.jsp");
            }
        }else{
            response.sendRedirect("index.jsp");
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("idUser") != null){
            int idUser= Integer.parseInt(request.getParameter("idUser"));

            Usuario user;
            UsuarioDao usuarioDao = new UsuarioDao();
            user = usuarioDao.getUser(idUser);
            Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
            String message = gson.toJson(user);

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(message);
        }else if(request.getParameter("page") == "home"){
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        }else if(request.getParameter("page") == "Index"){
            HttpSession sesion = request.getSession(false);
            sesion.invalidate();
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else {

            request.setCharacterEncoding("UTF-8");
            String  name = request.getParameter("name");
            String  lastName = request.getParameter("lastName");
            String  birthday = request.getParameter("birthday");
            String  email = request.getParameter("email");
            String  password = request.getParameter("password");

            System.out.println("H1");

            Usuario user = new Usuario();
            user.setName(name);
            user.setLastName(lastName);
            user.setBirthday(Date.valueOf(birthday));
            user.setEmail(email);
            user.setPassword(password);

            System.out.println(user.getEmail());

            UsuarioDao usuarioDao = new UsuarioDao();
            Usuario userConIds = usuarioDao.saveUser(user);

            Gson gson = new Gson();
            String mensaje = "";

            System.out.println(userConIds.getIdUser());

            if(userConIds.getIdUser() > 0){
                mensaje = gson.toJson(userConIds);
            }else{
                mensaje = "{ \"idUser\": 0, \"mensaje\": \"El registro no se inserto\"}";
            }

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(mensaje);
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String  name = request.getParameter("name");
        String  lastName = request.getParameter("lastName");
        String  birthday = request.getParameter("birthday");
        String  email = request.getParameter("email");
        int userType = request.getParameter("userType") == "" ? 0 : Integer.parseInt(request.getParameter("userType"));
        int idUser = request.getParameter("idUser") == "" ? 0 : Integer.parseInt(request.getParameter("idUser"));


        Usuario user = new Usuario();
        user.setName(name);
        user.setLastName(lastName);
        user.setBirthday(Date.valueOf(birthday));
        user.setEmail(email);
        user.setUserType(userType);
        user.setIdUser(idUser);

        UsuarioDao usuarioDao = new UsuarioDao();
        boolean resultado = usuarioDao.updateUser(user);

        String mensaje = "";
        Gson gson = new Gson();

        if(resultado){
            mensaje = gson.toJson(user);
        }else{
            mensaje = "{'mensaje': 'El registro no se actualizo correctamente'}";
        }
        // Ya no se necesita redirigir
        // request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
        // Devolver indicación de exito de inserción

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(mensaje);

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Got to Delete");
        int id = request.getParameter("idUser") == "" ? 0 : Integer.parseInt(request.getParameter("idUser"));
        //condicion ? verdadera : falsa
        System.out.println("Got: " + id);

        UsuarioDao usuarioDao = new UsuarioDao();
        boolean resultado = usuarioDao.deleteUser(id);

        String mensaje = "";

        if(resultado){
            mensaje = "{\"mensaje\": \"El registro se elimino correctamente\"}";;
        }else{
            mensaje = "{\"mensaje\": \"El registro no se borro\"}";
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(mensaje);
    }
}
