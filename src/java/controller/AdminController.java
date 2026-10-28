package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.CitaDAO;
import model.dao.ServicioDAO;
import model.dao.UsuarioDAO;
import model.vo.UsuarioVO;
import java.io.IOException;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("principal.jsp");
            return;
        }

        UsuarioVO user = (UsuarioVO) session.getAttribute("usuario");
        if (!"admin".equalsIgnoreCase(user.getRol())) {
            response.sendRedirect("ReservaController");
            return;
        }

        UsuarioDAO uDao = new UsuarioDAO();
        ServicioDAO sDao = new ServicioDAO();
        CitaDAO cDao = new CitaDAO();

        request.setAttribute("usuarios", uDao.listarTodos());
        request.setAttribute("servicios", sDao.listarTodos());
        request.setAttribute("citas", cDao.listarTodas());

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}
