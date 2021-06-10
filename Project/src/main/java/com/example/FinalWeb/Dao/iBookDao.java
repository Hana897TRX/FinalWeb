package com.example.FinalWeb.Dao;

import com.example.FinalWeb.model.Book;

import java.util.List;

public interface iBookDao {
    List<Book> getBooks();
    List<Book> getBooks(int idUser);
    Book getBook(int idBook);
    boolean newBook(Book book);
}
