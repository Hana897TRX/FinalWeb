package com.example.FinalWeb.Dao;

import com.example.FinalWeb.model.Usuario;
import com.example.FinalWeb.utility.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao implements IUsuarioDao {
    @Override
    public Usuario getUser(String usuario, String password) {
        String sql = "SELECT idUser, name, lastName, birthday, email, password, userType FROM Users" +
                " WHERE email = ? AND password = SHA2(?, 224)";

        try{
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement preparedStatement = conexion.prepareStatement(sql);
            preparedStatement.setString(1, usuario);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                //Se encontró la información
                Usuario user = new Usuario();

                user.setIdUser(resultSet.getInt("idUser"));
                user.setName(resultSet.getString("name"));
                user.setLastName(resultSet.getString("lastName"));
                user.setBirthday(resultSet.getDate("birthday"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setUserType(resultSet.getInt("userType"));

                return user;
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    @Override
    public Usuario getUser(int idUser) {
        String sql = "SELECT idUser, name, lastName, birthday, email, password, userType FROM Users" +
                " WHERE idUser = ?";

        try{
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement preparedStatement = conexion.prepareStatement(sql);
            preparedStatement.setInt(1, idUser);

            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                //Se encontró la información
                Usuario user = new Usuario();

                user.setIdUser(resultSet.getInt("idUser"));
                user.setName(resultSet.getString("name"));
                user.setLastName(resultSet.getString("lastName"));
                user.setBirthday(resultSet.getDate("birthday"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setUserType(resultSet.getInt("userType"));

                return user;
            }else{
                //No hay user info
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    @Override
    public Usuario saveUser(Usuario usuario) {
        System.out.println("H" + usuario);
        Connection conexion = MySQLConnection.getConnection();
        String sql_user = "INSERT INTO Users(name, lastName, birthday, email, password, userType) " +
                "VALUES(?,?,?,?,SHA2(?, 224),?)";

        System.out.println(usuario);

        try{

            // Para devolver el id insertado
            PreparedStatement preparedStatement = conexion.prepareStatement(sql_user);

            preparedStatement.setString(1, usuario.getName());
            preparedStatement.setString(2, usuario.getLastName());
            preparedStatement.setDate(3, usuario.getBirthday());
            preparedStatement.setString(4, usuario.getEmail());
            preparedStatement.setString(5, usuario.getPassword());
            preparedStatement.setInt(6, 3);

            preparedStatement.executeUpdate();

            //ResultSet resultSet = preparedStatement.getGeneratedKeys(); // Return resultSet con los id's inserted
            //resultSet.next();

            //int idUser = resultSet.getInt(1);
            //usuario.setIdUser(idUser);

        } catch(Exception ex){
            System.out.println(ex.getMessage());
        }

        return null;
    }

    @Override
    public List<Usuario> getUsers() {
        Usuario user = null;
        List<Usuario> usuarios = new ArrayList();

        String sql = "SELECT idUser, name, lastName, birthday, email, userType FROM Users";
        try {
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement preparedStatement = conexion.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                user = new Usuario();
                user.setName(resultSet.getString("name"));
                user.setLastName(resultSet.getString("lastName"));
                user.setBirthday(resultSet.getDate("birthday"));
                user.setEmail(resultSet.getString("email"));
                user.setUserType(resultSet.getInt("userType"));
                usuarios.add(user);
            }
            return usuarios;
        }catch (Exception ex){
            System.out.println("ERROR: " + ex.getMessage());
        }
        return null;
    }

    @Override
    public boolean deleteUser(int idUser) {
        String sql_usuario = "DELETE FROM Users WHERE idUser = ?";

        try {
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement preparedStatement = conexion.prepareStatement(sql_usuario);
            preparedStatement.setInt(1, idUser);

            int count = 0;

            ResultSet resultSet = preparedStatement.executeQuery();
            count = preparedStatement.executeUpdate();

            if(count > 0){
                return true;
            }

        } catch(Exception ex){
            System.out.print(ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean updateUser(Usuario usuario) {
        String sql_usuario = "UPDATE Users SET name = ?, lastName = ?, birthday = ?, email = ?, password=SHA2(?,224), userType = ? WHERE idUser = ?";
        System.out.println(usuario);
        int count = 0;
        try {
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement preparedStatement = conexion.prepareStatement(sql_usuario);
            preparedStatement.setString(1,usuario.getName());
            preparedStatement.setString(2,usuario.getLastName());
            preparedStatement.setDate(3,usuario.getBirthday());
            preparedStatement.setString(4,usuario.getEmail());
            preparedStatement.setString(5,usuario.getPassword());
            preparedStatement.setInt(6, usuario.getUserType());
            count = preparedStatement.executeUpdate();

            if(count > 0)
                return true;
        }
        catch (Exception ex){
            System.out.println("ERROR: " + ex.getMessage());
        }
        return false;
    }
}
