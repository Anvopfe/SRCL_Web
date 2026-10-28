package model.vo;

public class CitaVO {
    private int idCita;
    private int idUsuario;
    private int idServicio;
    private String nomServicio;
    private String fecCita;
    private String horaCita;
    private String estado;
    private String nombreCliente;

    public int getIdCita() { return idCita; }
    public void setIdCita(int idCita) { this.idCita = idCita; }

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public int getIdServicio() { return idServicio; }
    public void setIdServicio(int idServicio) { this.idServicio = idServicio; }

    public String getNomServicio() { return nomServicio; }
    public void setNomServicio(String nomServicio) { this.nomServicio = nomServicio; }

    public String getFecCita() { return fecCita; }
    public void setFecCita(String fecCita) { this.fecCita = fecCita; }

    public String getHoraCita() { return horaCita; }
    public void setHoraCita(String horaCita) { this.horaCita = horaCita; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public String getNombreCliente() { return nombreCliente; }
    public void setNombreCliente(String nombreCliente) { this.nombreCliente = nombreCliente; }
}
