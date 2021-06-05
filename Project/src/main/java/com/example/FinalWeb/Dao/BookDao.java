package com.example.FinalWeb.Dao;

import com.example.FinalWeb.model.Book;
import com.example.FinalWeb.utility.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookDao implements com.example.FinalWeb.Dao.iBookDao {
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
                book.setAuthor(resultSet.getString("author"));
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

    @Override
    public boolean newBook(Book book) {
        Connection connection = MySQLConnection.getConnection();
        String sql = "INSERT INTO Books(bookName, isbn, fechaCompra, author, status, coverBookContent, coverBookSize, coverBookType) VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, book.getBookName());
            preparedStatement.setString(2, book.getIsbn());
            preparedStatement.setDate(3, book.getFechaCompra());
            preparedStatement.setString(4, book.getAuthor());
            preparedStatement.setString(5, book.getStatus());
            preparedStatement.setBinaryStream(6, book.getCoverBookContent());
            preparedStatement.setDouble(7, book.getCoverBookSize());
            preparedStatement.setString(8, book.getCoverBookType());
            preparedStatement.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        return false;
    }
}
