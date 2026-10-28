package model.dao;

import model.vo.CitaVO;
import util.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CitaDAO {

    public boolean registrarCita(CitaVO c) {
        String sql = "INSERT INTO cita (usuario_idUsuario, servicio_idServicio, fecCita, horaCita, estado) VALUES (?, ?, ?, ?, 'confirmada')";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, c.getIdUsuario());
            ps.setInt(2, c.getIdServicio());
            ps.setString(3, c.getFecCita());
            ps.setString(4, c.getHoraCita());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<CitaVO> listarPorUsuario(int idUsuario) {
        List<CitaVO> lista = new ArrayList<>();
        String sql = "SELECT c.idCita, c.fecCita, c.horaCita, c.estado, s.nomServicio " +
                     "FROM cita c JOIN servicio s ON c.servicio_idServicio = s.idServicio " +
                     "WHERE c.usuario_idUsuario = ? ORDER BY c.fecCita DESC";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CitaVO c = new CitaVO();
                    c.setIdCita(rs.getInt("idCita"));
                    c.setFecCita(rs.getString("fecCita"));
                    c.setHoraCita(rs.getString("horaCita"));
                    c.setEstado(rs.getString("estado"));
                    c.setNomServicio(rs.getString("nomServicio"));
                    lista.add(c);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean cancelarCita(int idCita) {
        String sql = "UPDATE cita SET estado = 'cancelada' WHERE idCita = ?";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idCita);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<CitaVO> listarTodas() {
        List<CitaVO> lista = new ArrayList<>();
        String sql = "SELECT c.idCita, c.fecCita, c.horaCita, c.estado, s.nomServicio, u.nombre, u.apellido " +
                     "FROM cita c " +
                     "JOIN servicio s ON c.servicio_idServicio = s.idServicio " +
                     "JOIN usuario u ON c.usuario_idUsuario = u.idUsuario ORDER BY c.fecCita DESC";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                CitaVO c = new CitaVO();
                c.setIdCita(rs.getInt("idCita"));
                c.setFecCita(rs.getString("fecCita"));
                c.setHoraCita(rs.getString("horaCita"));
                c.setEstado(rs.getString("estado"));
                c.setNomServicio(rs.getString("nomServicio"));
                c.setNombreCliente(rs.getString("nombre") + " " + rs.getString("apellido"));
                lista.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}
