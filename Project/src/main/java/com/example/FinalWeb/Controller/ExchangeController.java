package com.example.FinalWeb.Controller;

import com.example.FinalWeb.Dao.BookExchangeDao;
import com.example.FinalWeb.model.BookExchange;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ExchangeController", value = "/ExchangeController")
public class ExchangeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BookExchangeDao bookExchangeDao = new BookExchangeDao();
        List<BookExchange> bookExchangeList = bookExchangeDao.getBookExchange();
        for(int i=0;i<bookExchangeList.size();i++){
            System.out.println(bookExchangeList.get(i));
            System.out.println("Hay algo");
        }
        request.setAttribute("bookExchangeList", bookExchangeList);
        request.getRequestDispatcher("/transactions.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
