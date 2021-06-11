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
    public List<BookExchange> getBookExchange() {
        String sql ="SELECT idExchange, idBookOwner, idBookReceiver, idBook, exchangeDate FROM BookExchange";

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
                exchange.setIdBook(resultSet.getInt("idBook"));
                exchange.setExchangeDate(resultSet.getDate("exchangeDate"));

                exchangeList.add(exchange);
            }
            return exchangeList;

        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }
}
