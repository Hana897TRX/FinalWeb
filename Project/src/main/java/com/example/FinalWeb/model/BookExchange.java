package com.example.FinalWeb.model;

import java.io.Serializable;
import java.sql.Date;

public class BookExchange implements Serializable {

    private int idExchange;
    private int idBookOwner;
    private int idBookReceiver;
    private int idBook;
    private Date exchangeDate;

    public BookExchange() {
    }

    public BookExchange(int idExchange, int idBookOwner, int idBookReceiver, int idBook, Date exchangeDate) {
        this.idExchange = idExchange;
        this.idBookOwner = idBookOwner;
        this.idBookReceiver = idBookReceiver;
        this.idBook = idBook;
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

    public int getIdBook() {
        return idBook;
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }

    public Date getExchangeDate() {
        return exchangeDate;
    }

    public void setExchangeDate(Date exchangeDate) {
        this.exchangeDate = exchangeDate;
    }

    @Override
    public String toString() {
        return "BookExchange{" +
                "idExchange=" + idExchange +
                ", idBookOwner=" + idBookOwner +
                ", idBookReceiver=" + idBookReceiver +
                ", idBook=" + idBook +
                ", exchangeDate=" + exchangeDate +
                '}';
    }
}
