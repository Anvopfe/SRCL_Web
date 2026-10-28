package model.dao;

import model.vo.UsuarioVO;
import util.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    public UsuarioVO autenticar(String email, String password) {
        UsuarioVO user = null;
        String sql = "SELECT * FROM usuario WHERE email = ? AND passUsuario = ?";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new UsuarioVO();
                    user.setIdUsuario(rs.getInt("idUsuario"));
                    user.setDocumento(rs.getString("documento"));
                    user.setNombre(rs.getString("nombre"));
                    user.setApellido(rs.getString("apellido"));
                    user.setEmail(rs.getString("email"));
                    user.setRol(rs.getString("rol"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean registrar(UsuarioVO u) {
        String sql = "INSERT INTO usuario (documento, nombre, apellido, email, passUsuario, rol) VALUES (?, ?, ?, ?, ?, 'cliente')";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, u.getDocumento());
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getApellido());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPassUsuario());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<UsuarioVO> listarTodos() {
        List<UsuarioVO> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuario";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                UsuarioVO u = new UsuarioVO();
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setDocumento(rs.getString("documento"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setEmail(rs.getString("email"));
                u.setRol(rs.getString("rol"));
                lista.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}
