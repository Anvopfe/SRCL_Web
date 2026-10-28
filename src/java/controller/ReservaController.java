package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.CitaDAO;
import model.dao.ServicioDAO;
import model.vo.CitaVO;
import model.vo.ServicioVO;
import model.vo.UsuarioVO;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReservaController")
public class ReservaController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("principal.jsp");
            return;
        }

        String action = request.getParameter("action");
        UsuarioVO user = (UsuarioVO) session.getAttribute("usuario");
        CitaDAO citaDAO = new CitaDAO();

        if ("historial".equals(action)) {
            List<CitaVO> citas = citaDAO.listarPorUsuario(user.getIdUsuario());
            request.setAttribute("citas", citas);
            request.getRequestDispatcher("historial.jsp").forward(request, response);
        } else if ("cancelar".equals(action)) {
            int idCita = Integer.parseInt(request.getParameter("idCita"));
            citaDAO.cancelarCita(idCita);
            response.sendRedirect("ReservaController?action=historial");
        } else {
            ServicioDAO servicioDAO = new ServicioDAO();
            List<ServicioVO> servicios = servicioDAO.listarTodos();
            request.setAttribute("servicios", servicios);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("principal.jsp");
            return;
        }

        UsuarioVO user = (UsuarioVO) session.getAttribute("usuario");
        int idServicio = Integer.parseInt(request.getParameter("idServicio"));
        String fecCita = request.getParameter("fecCita");
        String horaCita = request.getParameter("horaCita");

        CitaVO cita = new CitaVO();
        cita.setIdUsuario(user.getIdUsuario());
        cita.setIdServicio(idServicio);
        cita.setFecCita(fecCita);
        cita.setHoraCita(horaCita);

        CitaDAO dao = new CitaDAO();
        boolean exito = dao.registrarCita(cita);

        if (exito) {
            request.setAttribute("mensaje", "¡Cita reservada con éxito!");
            request.setAttribute("tipo", "green");
        } else {
            request.setAttribute("mensaje", "Error al procesar la reserva.");
            request.setAttribute("tipo", "red");
        }
        request.getRequestDispatcher("resultado.jsp").forward(request, response);
    }
}
