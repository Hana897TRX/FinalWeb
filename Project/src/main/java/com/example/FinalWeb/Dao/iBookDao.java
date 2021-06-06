package com.example.FinalWeb.Dao;

import com.example.FinalWeb.model.Book;

import java.util.List;

public interface iBookDao {
    List<Book> getBooks();
    List<Book> getBooks(int idUser);
    boolean newBook(Book book);
}
