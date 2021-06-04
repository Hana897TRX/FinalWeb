package com.example.FinalWeb.Dao;

import com.example.FinalWeb.model.Book;
import com.example.FinalWeb.utility.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDao implements iBookDao{
    @Override
    public List<Book> getBooks() {
        String sql = "SELECT * FROM Books";

        List<Book> bookList = new ArrayList();
        Book book = null;

        try{
            Connection connection = MySQLConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                book = new Book();
                book.setIdBook(resultSet.getInt("idBook"));
                book.setBookName(resultSet.getString("bookName"));
                book.setIsbn(resultSet.getString("isbn"));
                book.setFechaCompra(resultSet.getDate("fechaCompra"));
                book.setIdAuthor(resultSet.getInt("idAuthor"));
                book.setStatus(resultSet.getString("status"));
                book.setCoverBookContent(resultSet.getBinaryStream("coverBookContent"));
                book.setCoverBookSize(resultSet.getDouble("coverBookSize"));
                book.setCoverBookType(resultSet.getString("coverBookType"));

                bookList.add(book);
            }

            return bookList;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
