package com.example.FinalWeb.model;

import java.io.InputStream;
import java.sql.Date;

public class Book {
    private int idBook;
    private String bookName;
    private String isbn;
    private Date fechaCompra;
    private String author;
    private String status;
    private InputStream coverBookContent;
    private double coverBookSize;
    private String coverBookType;

    public Book(int idBook, String bookName, String isbn, Date fechaCompra, String author, String status, InputStream coverBookContent, double coverBookSize, String coverBookType) {
        this.idBook = idBook;
        this.bookName = bookName;
        this.isbn = isbn;
        this.fechaCompra = fechaCompra;
        this.author = author;
        this.status = status;
        this.coverBookContent = coverBookContent;
        this.coverBookSize = coverBookSize;
        this.coverBookType = coverBookType;
    }

    public Book() {

    }

    public int getIdBook() {
        return idBook;
    }

    public String getBookName() {
        return bookName;
    }

    public String getIsbn() {
        return isbn;
    }

    public Date getFechaCompra() {
        return fechaCompra;
    }

    public String getAuthor() {
        return author;
    }

    public String getStatus() {
        return status;
    }

    public InputStream getCoverBookContent() {
        return coverBookContent;
    }

    public double getCoverBookSize() {
        return coverBookSize;
    }

    public String getCoverBookType() {
        return coverBookType;
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setCoverBookContent(InputStream coverBookContent) {
        this.coverBookContent = coverBookContent;
    }

    public void setCoverBookSize(double coverBookSize) {
        this.coverBookSize = coverBookSize;
    }

    public void setCoverBookType(String coverBookType) {
        this.coverBookType = coverBookType;
    }

    @Override
    public String toString() {
        return "Book{" +
                "idBook=" + idBook +
                ", bookName='" + bookName + '\'' +
                ", isbn='" + isbn + '\'' +
                ", fechaCompra=" + fechaCompra +
                ", idAuthor=" + author +
                ", status='" + status + '\'' +
                ", coverBookContent=" + coverBookContent +
                ", coverBookSize=" + coverBookSize +
                ", coverBookType='" + coverBookType + '\'' +
                '}';
    }
}
