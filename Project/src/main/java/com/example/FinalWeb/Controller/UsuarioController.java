package com.example.FinalWeb.Controller;

import com.example.FinalWeb.dao.UsuarioDao;
import com.example.FinalWeb.model.Usuario;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

@WebServlet(name = "usuario", value = "/usuario")
@MultipartConfig
public class UsuarioController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setCharacterEncoding("UFF-8"); //Kinda gives me an error?
        String  name = request.getParameter("name");
        String  lastName = request.getParameter("lastName");
        String  birthday = request.getParameter("birthday");
        String  email = request.getParameter("email");
        String  password = request.getParameter("password");

        Usuario user = new Usuario();
        user.setName(name);
        user.setLastName(lastName);
        user.setBirthday(Date.valueOf(birthday));
        user.setEmail(email);
        user.setPassword(password);

        System.out.println(user.getEmail());

        UsuarioDao usuarioDao = new UsuarioDao();
        Usuario userConIds = usuarioDao.saveUser(user); //Error here

        Gson gson = new Gson();
        String mensaje = "";

        System.out.println(userConIds.getIdUser());

        if(userConIds.getIdUser() > 0){
            mensaje = gson.toJson(userConIds);
        }else{
            mensaje = "{ \"idPersona\": 0, \"mensaje\": \"El registro no se inserto\"}";
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
