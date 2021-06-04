package com.example.FinalWeb.dao;

import com.example.FinalWeb.model.Usuario;

import java.util.List;

public interface IUsuarioDao {
    public Usuario getUser(String usuario, String password);
    public Usuario getUser(int idCuenta);
    public Usuario saveUser(Usuario usuario);
    List<Usuario> getUsers();
    boolean deleteUser(int idCuenta);
    boolean updateUser(Usuario usuario);
}
