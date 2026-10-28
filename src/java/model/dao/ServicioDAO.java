package model.dao;

import model.vo.ServicioVO;
import util.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ServicioDAO {

    public List<ServicioVO> listarTodos() {
        List<ServicioVO> lista = new ArrayList<>();
        String sql = "SELECT * FROM servicio";
        try (Connection con = ConexionBD.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ServicioVO s = new ServicioVO();
                s.setIdServicio(rs.getInt("idServicio"));
                s.setNomServicio(rs.getString("nomServicio"));
                s.setDuracionMin(rs.getInt("duracionMin"));
                s.setPrecio(rs.getDouble("precio"));
                lista.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}
