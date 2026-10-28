package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.UsuarioDAO;
import model.vo.UsuarioVO;
import java.io.IOException;

@WebServlet("/Acceso")
public class Acceso extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UsuarioDAO dao = new UsuarioDAO();
        UsuarioVO usuario = dao.autenticar(email, password);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            if ("admin".equalsIgnoreCase(usuario.getRol())) {
                response.sendRedirect("AdminController");
            } else {
                response.sendRedirect("ReservaController");
            }
        } else {
            request.setAttribute("error", "Correo o contraseña incorrectos.");
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("principal.jsp");
    }
}
