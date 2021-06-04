package com.example.FinalWeb.Dao;

import com.example.FinalWeb.model.Book;

import java.util.List;

public interface iBookDao {
    List<Book> getBooks();
    boolean newBook(Book book);
}
