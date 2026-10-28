package model.vo;

public class ServicioVO {
    private int idServicio;
    private String nomServicio;
    private int duracionMin;
    private double precio;

    public int getIdServicio() { return idServicio; }
    public void setIdServicio(int idServicio) { this.idServicio = idServicio; }

    public String getNomServicio() { return nomServicio; }
    public void setNomServicio(String nomServicio) { this.nomServicio = nomServicio; }

    public int getDuracionMin() { return duracionMin; }
    public void setDuracionMin(int duracionMin) { this.duracionMin = duracionMin; }

    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }
}
