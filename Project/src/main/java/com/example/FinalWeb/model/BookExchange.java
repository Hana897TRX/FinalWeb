package com.example.FinalWeb.model;

import java.io.Serializable;
import java.sql.Date;

public class BookExchange implements Serializable {

    private int idExchange;
    private int idBookOwner;
    private int idBookReceiver;
    private String exchangeDate;

    public BookExchange() {
    }

    public BookExchange(int idExchange, int idBookOwner, int idBookReceiver, String exchangeDate) {
        this.idExchange = idExchange;
        this.idBookOwner = idBookOwner;
        this.idBookReceiver = idBookReceiver;
        this.exchangeDate = exchangeDate;
    }

    public int getIdExchange() {
        return idExchange;
    }

    public void setIdExchange(int idExchange) {
        this.idExchange = idExchange;
    }

    public int getIdBookOwner() {
        return idBookOwner;
    }

    public void setIdBookOwner(int idBookOwner) {
        this.idBookOwner = idBookOwner;
    }

    public int getIdBookReceiver() {
        return idBookReceiver;
    }

    public void setIdBookReceiver(int idBookReceiver) {
        this.idBookReceiver = idBookReceiver;
    }

    public String getExchangeDate() {
        return exchangeDate;
    }

    public void setExchangeDate(String exchangeDate) {
        this.exchangeDate = exchangeDate;
    }

    @Override
    public String toString() {
        return "BookExchange{" +
                "idExchange=" + idExchange +
                ", idBookOwner=" + idBookOwner +
                ", idBookReceiver=" + idBookReceiver +
                ", exchangeDate=" + exchangeDate +
                '}';
    }
}
