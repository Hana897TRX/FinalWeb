package com.example.FinalWeb.Controller;

import com.example.FinalWeb.Dao.BookDao;
import com.example.FinalWeb.model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "books", value = "/books")
@MultipartConfig
public class BookController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.print("First 1");
        BookDao bookDao = new BookDao();

        List<Book> bookList = bookDao.getBooks();
        System.out.println(bookList);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Book book = new Book();
        request.setCharacterEncoding("UTF-8");
        book.setBookName(request.getParameter("bookName"));
        book.setIsbn(request.getParameter("bookIsbn"));
        book.setFechaCompra(Date.valueOf(request.getParameter("bookDate")));
        book.setAuthor(request.getParameter("bookAuthor"));
        book.setStatus(request.getParameter("status"));

        Part cover = request.getPart("imgCover");
        book.setCoverBookContent(cover.getInputStream());
        book.setCoverBookSize(cover.getSize());
        book.setCoverBookType(cover.getContentType());

        BookDao bookDao = new BookDao();
        boolean resultado = bookDao.newBook(book);

        String message = "";

        if(resultado){
            message = "{ \"message\" : \" Libro registrado con éxito \", \"status\" : \"1\" }";
        }
        else{
            message = "{ \"message\" : \" Error en el registro \", \"status\" : \"0\" }";
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(message);
    }
}
