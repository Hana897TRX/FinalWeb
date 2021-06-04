package com.example.FinalWeb.utility;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLConnection {
    public static Connection getConnection(){
        // protocolo:tiposervidor://ip|nombre:puerto/bddefault?opciones&password=123
        String cadena = "jdbc:mysql://localhost:3306/usuarios?user=root";

        try{
            DriverManager.registerDriver(new Driver());
            return DriverManager.getConnection(cadena);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }

        return null;
    }

    public static void main(String[] args) {
        Connection conexion = getConnection();
        if(conexion != null){
            System.out.println("Conectado");
        }
        else{
            System.out.println("Algo paso :c");
        }
    }
}

/*
    JDBC -> Java Database Connectivity
    ODBC -> Open

    MySQL - 3306
    SQL Server - 1433
*/
