package com.example.FinalWeb.Controller;

import com.example.FinalWeb.Dao.BookDao;
import com.example.FinalWeb.Dao.UsuarioDao;
import com.example.FinalWeb.model.Book;
import com.example.FinalWeb.model.Usuario;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "usuario", value = "/usuario")
@MultipartConfig
public class UsuarioController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
        System.out.println("H0");
=======
>>>>>>> 9c7dd6dcfaae08ec117110a39133e92e940f0689
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

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
