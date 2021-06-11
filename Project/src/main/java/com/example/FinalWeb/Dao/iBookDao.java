package com.example.FinalWeb.Dao;

import com.example.FinalWeb.model.Book;

import java.util.List;

public interface iBookDao {
    boolean newBook(Book book);
    List<Book> getBooks();
    List<Book> getBooks(int idUser);
    Book getBook(int idBook);
    List<Book> getTop5Books();
    boolean updateBook(Book book);
    boolean deteteBook(int idBook);
}
