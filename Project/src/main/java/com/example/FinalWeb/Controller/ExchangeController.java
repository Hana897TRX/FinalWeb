package com.example.FinalWeb.Controller;

import com.example.FinalWeb.Dao.BookExchangeDao;
import com.example.FinalWeb.Dao.UsuarioDao;
import com.example.FinalWeb.model.BookExchange;
import com.example.FinalWeb.model.Usuario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Exchange", value = "/Exchange")
public class ExchangeController extends HttpServlet {
    private int idUser = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int message = 0;
        int userType = 0;

        HttpSession sesion = request.getSession(false);
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

    }
}
