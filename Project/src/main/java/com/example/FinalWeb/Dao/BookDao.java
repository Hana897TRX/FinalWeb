package com.example.FinalWeb.Dao;

import com.example.FinalWeb.model.Book;
import com.example.FinalWeb.utility.MySQLConnection;
import com.mysql.cj.conf.ConnectionPropertiesTransform;
import org.apache.commons.io.IOUtils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
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
                book.setIdOwner(resultSet.getInt("idUser"));
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
    public List<Book> getBooks(int idUser) {
        Connection connection = MySQLConnection.getConnection();
        String sql = "SELECT * FROM Books WHERE idUser = ?";

        List<Book> bookList = new ArrayList();
        Book book;

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, idUser);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                book = new Book();
                book.setIdBook(resultSet.getInt("idBook"));
                book.setIdOwner(resultSet.getInt("idUser"));
                book.setBookName(resultSet.getString("bookName"));
                book.setIsbn(resultSet.getString("isbn"));
                book.setFechaCompra(resultSet.getDate("fechaCompra"));
                book.setAuthor(resultSet.getString("author"));
                book.setStatus(resultSet.getString("status"));
                book.setCoverBookContent(resultSet.getBinaryStream("coverBookContent"));
                book.setCoverBookSize(resultSet.getDouble("coverBookSize"));
                book.setCoverBookType(resultSet.getString("coverBookType"));
                //book.setContent(Base64.getEncoder().encode(book.getCoverBookContent()));
                book.setContent(Base64.getEncoder().encodeToString(IOUtils.toByteArray(book.getCoverBookContent())));

                bookList.add(book);
            }

            return bookList;
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return null;
    }

    @Override
    public boolean updateBook(Book book) {
        String sql = "UPDATE Books SET bookName = ?, isbn = ?, fechaCompra = ?, author = ?, status = ?, coverBookContent = ?, coverBookSize = ?, coverBookType = ?, idUser = ? WHERE idBook = ?";
        Connection connection = MySQLConnection.getConnection();

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, book.getBookName());
            preparedStatement.setString(2, book.getIsbn());
            preparedStatement.setDate(3, book.getFechaCompra());
            preparedStatement.setString(4, book.getAuthor());
            preparedStatement.setString(5, book.getStatus());
            preparedStatement.setBinaryStream(6, book.getCoverBookContent());
            preparedStatement.setDouble(7, book.getCoverBookSize());
            preparedStatement.setString(8, book.getCoverBookType());
            preparedStatement.setInt(9, book.getIdOwner());
            preparedStatement.setInt(10, book.getIdBook());

            preparedStatement.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return false;
    }

    @Override
    public Book getBook(int idBook) {
        String sql = "SELECT * FROM Books WHERE idBook = ?";
        Connection connection = MySQLConnection.getConnection();

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, idBook);

            ResultSet resultSet = preparedStatement.executeQuery();

            Book book;

            if (resultSet.next()){
                book = new Book();
                book.setIdBook(resultSet.getInt("idBook"));
                book.setIdOwner(resultSet.getInt("idUser"));
                book.setBookName(resultSet.getString("bookName"));
                book.setIsbn(resultSet.getString("isbn"));
                book.setFechaCompra(resultSet.getDate("fechaCompra"));
                book.setAuthor(resultSet.getString("author"));
                book.setStatus(resultSet.getString("status"));
                book.setCoverBookContent(resultSet.getBinaryStream("coverBookContent"));
                book.setCoverBookSize(resultSet.getDouble("coverBookSize"));
                book.setCoverBookType(resultSet.getString("coverBookType"));
                book.setContent(Base64.getEncoder().encodeToString(IOUtils.toByteArray(book.getCoverBookContent())));

                return book;
            }
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return null;
    }

    @Override
    public List<Book> getTop5Books() {
        Connection connection = MySQLConnection.getConnection();
        String sql = "SELECT * FROM Books ORDER BY RAND() LIMIT 5";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            List<Book> bookList = new ArrayList<>();
            Book book;

            while(resultSet.next()){
                book = new Book();
                book.setIdBook(resultSet.getInt("idBook"));
                book.setIdOwner(resultSet.getInt("idUser"));
                book.setBookName(resultSet.getString("bookName"));
                book.setIsbn(resultSet.getString("isbn"));
                book.setFechaCompra(resultSet.getDate("fechaCompra"));
                book.setAuthor(resultSet.getString("author"));
                book.setStatus(resultSet.getString("status"));
                book.setCoverBookContent(resultSet.getBinaryStream("coverBookContent"));
                book.setCoverBookSize(resultSet.getDouble("coverBookSize"));
                book.setCoverBookType(resultSet.getString("coverBookType"));
                //book.setContent(Base64.getEncoder().encode(book.getCoverBookContent()));
                book.setContent(Base64.getEncoder().encodeToString(IOUtils.toByteArray(book.getCoverBookContent())));

                bookList.add(book);
            }

            return bookList;
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return null;
    }

    @Override
    public boolean newBook(Book book) {
        Connection connection = MySQLConnection.getConnection();
        String sql = "INSERT INTO Books(bookName, isbn, fechaCompra, author, status, coverBookContent, coverBookSize, coverBookType, idUser) VALUES(?,?,?,?,?,?,?,?,?)";
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
            preparedStatement.setInt(9, book.getIdOwner());

            preparedStatement.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        return false;
    }

    @Override
    public boolean deteteBook(int idBook) {
        String sql = "DELETE FROM Books Where idBook = ?";
        Connection connection = MySQLConnection.getConnection();

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, idBook);

            preparedStatement.executeUpdate();

            return true;
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }

        return false;
    }
}
