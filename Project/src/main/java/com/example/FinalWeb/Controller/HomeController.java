package com.example.FinalWeb.Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "homeX", value = "/homeX")
@MultipartConfig
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession(false);

        if(sesion != null) {
            int idUser = (Integer) sesion.getAttribute("idUser");
            if (idUser != 0) {
                request.getRequestDispatcher("/home.jsp").forward(request, response);
            } else
                response.sendRedirect("index.jsp");
        }
        else
            response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("actionv2");
        String hello = request.getParameter("hello");

        if(action != null && action.equals("GO_TO_BOOKS")){
            //response.sendRedirect("www.google.com");
            response.sendRedirect("books");
            //
            //request.getRequestDispatcher("/books").forward(request, response);

        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("actionv2");

        if(action != null && action.equals("GO_TO_BOOKS")){
            request.getRequestDispatcher("/books").forward(request, response);
        }
    }
}
