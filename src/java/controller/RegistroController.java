package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.UsuarioDAO;
import model.vo.UsuarioVO;
import java.io.IOException;

@WebServlet("/RegistroController")
public class RegistroController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String documento = request.getParameter("documento");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UsuarioVO u = new UsuarioVO();
        u.setDocumento(documento);
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setEmail(email);
        u.setPassUsuario(password);

        UsuarioDAO dao = new UsuarioDAO();
        if (dao.registrar(u)) {
            request.setAttribute("error", "Registro exitoso. ¡Inicia sesión!");
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        } else {
            request.setAttribute("mensaje", "Error al registrar el usuario. El correo o documento ya existe.");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
}
