package com.example.FinalWeb.Controller;

import com.example.FinalWeb.Dao.BookDao;
import com.example.FinalWeb.model.Book;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "books", value = "/books")
@MultipartConfig
public class BookController extends HttpServlet {
    private int idUser = 0;

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idBook = Integer.parseInt(request.getParameter("idBook"));

        if (idBook != 0) {
            BookDao bookDao = new BookDao();
            bookDao.deteteBook(idBook);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int message = 0;

        HttpSession sesion = request.getSession(false);

        if(sesion == null)
            response.sendRedirect("index.jsp");

        if(sesion.getAttribute("idUser") != null) {
            System.out.print(sesion.getAttribute("idUser"));
            message = (Integer) sesion.getAttribute("idUser");
            System.out.print("Book controller: " + message);

            if (message != 0) {
                idUser = message;
                BookDao bookDao = new BookDao();
                List<Book> bookList = bookDao.getBooks(idUser);
                //System.out.println(bookList);
                request.setAttribute("userBooks", bookList);
                request.getRequestDispatcher("userBooks.jsp").forward(request, response);
            } else {
                response.sendRedirect("index.jsp");
            }
        }
        else
            response.sendRedirect("index.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        //System.out.println(request.getParameter("action"));

        String action = request.getParameter("action");

        if (request.getParameter("idBook") != null) {
            int bookid = Integer.parseInt(request.getParameter("idBook"));

            Book book;
            BookDao bookDao = new BookDao();
            book = bookDao.getBook(bookid);
            String message = gson.toJson(book);

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(message);
        }
        else if(request.getParameter("idUser") != null){
            System.out.println("GetUserBooks");
            int _idUser = idUser;

            List<Book> bookList = new ArrayList<>();
            BookDao bookDao = new BookDao();
            bookList = bookDao.getBooks(idUser);

            String message = gson.toJson(bookList);

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(message);
        }
        else if(action != null && action.equals("GET_TOP5")){
            BookDao bookDao = new BookDao();
            List<Book> bookList = new ArrayList<>();
            bookList = bookDao.getTop5Books();
            String message = gson.toJson(bookList);

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(message);
        }
        else if (action != null && action.equals("GET_MOREBOOKSECTION")){
            BookDao bookDao = new BookDao();
            List<Book> bookList = new ArrayList<>();
            bookList = bookDao.getBooks();
            String message = gson.toJson(bookList);

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(message);
        }
        else {
            Book book = new Book();
            request.setCharacterEncoding("UTF-8");
            book.setBookName(request.getParameter("bookName"));
            book.setIsbn(request.getParameter("bookIsbn"));
            book.setFechaCompra(Date.valueOf(request.getParameter("bookDate")));
            book.setAuthor(request.getParameter("bookAuthor"));
            book.setStatus(request.getParameter("status"));
            book.setIdOwner(idUser);

            Part cover = request.getPart("imgCover");
            book.setCoverBookContent(cover.getInputStream());
            book.setCoverBookSize(cover.getSize());
            book.setCoverBookType(cover.getContentType());

            BookDao bookDao = new BookDao();
            boolean resultado = bookDao.newBook(book);

            String message = "";

            if (resultado) {
                message = "{ \"message\" : \" Libro registrado con ??xito \", \"status\" : \"1\" }";
            } else {
                message = "{ \"message\" : \" Error en el registro \", \"status\" : \"0\" }";
            }

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(message);
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Book book = new Book();
        book.setIdBook(Integer.parseInt(request.getParameter("idBook")));
        book.setBookName(request.getParameter("bookName"));
        book.setIsbn(request.getParameter("bookIsbn"));
        book.setFechaCompra(Date.valueOf(request.getParameter("bookDate")));
        book.setAuthor(request.getParameter("bookAuthor"));
        book.setStatus(request.getParameter("status"));
        book.setIdOwner(idUser);

        Part cover = request.getPart("imgCover");
        book.setCoverBookContent(cover.getInputStream());
        book.setCoverBookSize(cover.getSize());
        book.setCoverBookType(cover.getContentType());

        BookDao bookDao = new BookDao();
        bookDao.updateBook(book);
    }
}
