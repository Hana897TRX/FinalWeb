package com.example.FinalWeb.Dao;

import com.example.FinalWeb.model.BookExchange;

import java.util.List;

public interface IBookExchange {
    boolean saveBookExchange(BookExchange bookExchange);
    List<BookExchange> getBookExchange();
    List<BookExchange> getBookExchange(int idUser);
}
