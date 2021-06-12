package com.example.FinalWeb.Controller;

import com.example.FinalWeb.Dao.BookExchangeDao;
import com.example.FinalWeb.Dao.UsuarioDao;
import com.example.FinalWeb.model.Book;
import com.example.FinalWeb.model.BookExchange;
import com.example.FinalWeb.model.Usuario;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "Exchange", value = "/Exchange")
@MultipartConfig
public class ExchangeController extends HttpServlet {
    private int idUser = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int message = 0;
        int userType = 0;

        HttpSession sesion = request.getSession(false);

        if(sesion == null)
            response.sendRedirect("index.jsp");

        message = (Integer)sesion.getAttribute("idUser");
        userType = (Integer)sesion.getAttribute("userType");

        if(message != 0 && userType != 3 ) {
            idUser = message;
            BookExchangeDao bookExchangeDao = new BookExchangeDao();
            List<BookExchange> bookExchangeList = bookExchangeDao.getBookExchange();
            request.setAttribute("bookExchangeList", bookExchangeList);
            request.getRequestDispatcher("/transactions.jsp").forward(request, response);
        }else if(message != 0 && userType == 3){
            response.sendRedirect("home.jsp");
        }else{
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idBookOwner = Integer.parseInt(request.getParameter("idBookOwner"));
        int idBookUser = Integer.parseInt(request.getParameter("idBookUser"));

        System.out.println(request.getParameter("today"));

        String today = request.getParameter("today");

        BookExchange bookExchange = new BookExchange();
        bookExchange.setExchangeDate(today.toString());
        bookExchange.setIdBookOwner(idBookOwner);
        bookExchange.setIdBookReceiver(idBookUser);

        BookExchangeDao bookExchangeDao = new BookExchangeDao();

        String message = "";

        Gson gson = new Gson();

        if(bookExchangeDao.saveBookExchange(bookExchange)){
            message = "{ \"message\" : \" Intercambio registrado \", \"status\" : \"1\"}";
        }
        else{
            message = "{ \"message\" : \" No pudo realizarse el intercambio \", \"status\" : \"0\"}";
        }
        message = gson.toJson(message);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(message);
    }
}
