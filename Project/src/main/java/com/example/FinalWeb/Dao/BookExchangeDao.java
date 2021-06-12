package com.example.FinalWeb.Dao;

import com.example.FinalWeb.model.BookExchange;
import com.example.FinalWeb.utility.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookExchangeDao implements  IBookExchange{
    @Override
    public boolean saveBookExchange(BookExchange bookExchange) {
        String sql = "INSERT INTO bookexchange(idBookOwner, idBookReceiver, exchangeDate) VALUES (?, ? , ?)";
        Connection connection = MySQLConnection.getConnection();

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, bookExchange.getIdBookOwner());
            preparedStatement.setInt(2, bookExchange.getIdBookReceiver());
            preparedStatement.setString(3, bookExchange.getExchangeDate());

            preparedStatement.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        return false;
    }

    @Override
    public List<BookExchange> getBookExchange() {
        String sql ="SELECT * FROM BookExchange";

        BookExchange exchange = null;
        List<BookExchange> exchangeList = new ArrayList();

        try {
            Connection connection = MySQLConnection.getConnection();
            PreparedStatement preparedStatement =connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                exchange = new BookExchange();

                exchange.setIdExchange(resultSet.getInt("idExchange"));
                exchange.setIdBookOwner(resultSet.getInt("idBookOwner"));
                exchange.setIdBookReceiver(resultSet.getInt("idBookReceiver"));
                exchange.setExchangeDate(resultSet.getString("exchangeDate"));

                exchangeList.add(exchange);
            }
            return exchangeList;

        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }

    @Override
    public List<BookExchange> getBookExchange(int idUser) {
        String sql = "SELECT * FROM BookExchange " +
                "WHERE idBookOwner IN (SELECT idBook FROM Books WHERE idUser = ?) " +
                "OR idBookReceiver IN (SELECT idBook FROM Books WHERE idUser = ?);";

        BookExchange exchange = null;
        List<BookExchange> exchangeList = new ArrayList();

        try {
            Connection connection = MySQLConnection.getConnection();
            PreparedStatement preparedStatement =connection.prepareStatement(sql);
            preparedStatement.setInt(1, idUser);
            preparedStatement.setInt(2, idUser);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                exchange = new BookExchange();

                exchange.setIdExchange(resultSet.getInt("idExchange"));
                exchange.setIdBookOwner(resultSet.getInt("idBookOwner"));
                exchange.setIdBookReceiver(resultSet.getInt("idBookReceiver"));
                exchange.setExchangeDate(resultSet.getString("exchangeDate"));

                exchangeList.add(exchange);
            }
            return exchangeList;

        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }
}
