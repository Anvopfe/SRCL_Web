package model.vo;

public class UsuarioVO {
    private int idUsuario;
    private String documento;
    private String nombre;
    private String apellido;
    private String email;
    private String passUsuario;
    private String rol;

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public String getDocumento() { return documento; }
    public void setDocumento(String documento) { this.documento = documento; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getApellido() { return apellido; }
    public void setApellido(String apellido) { this.apellido = apellido; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassUsuario() { return passUsuario; }
    public void setPassUsuario(String passUsuario) { this.passUsuario = passUsuario; }

    public String getRol() { return rol; }
    public void setRol(String rol) { this.rol = rol; }
}
