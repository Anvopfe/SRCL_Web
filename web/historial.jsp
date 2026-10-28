<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.vo.CitaVO" %>
<%@ page import="model.vo.UsuarioVO" %>
<% 
    UsuarioVO user = (UsuarioVO) session.getAttribute("usuario");
    if (user == null) { response.sendRedirect("principal.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SRCL - Mis Citas</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style>.nav-srcl { background-color: #1A3C6E !important; }</style>
</head>
<body>
    <nav class="nav-srcl">
        <div class="nav-wrapper container">
            <a href="ReservaController" class="brand-logo">SRCL</a>
            <ul class="right">
                <li><a href="ReservaController">Nueva Reserva</a></li>
                <li><a href="Acceso">Cerrar Sesión</a></li>
            </ul>
        </div>
    </nav>

    <div class="container" style="margin-top:30px;">
        <h4 style="color: #1A3C6E;">Historial de Citas</h4>
        <table class="striped responsive-table highlight card">
            <thead>
                <tr>
                    <th>Servicio</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<CitaVO> citas = (List<CitaVO>) request.getAttribute("citas");
                    if (citas != null && !citas.isEmpty()) {
                        for(CitaVO c : citas) {
                %>
                <tr>
                    <td><%= c.getNomServicio() %></td>
                    <td><%= c.getFecCita() %></td>
                    <td><%= c.getHoraCita() %></td>
                    <td><b><%= c.getEstado().toUpperCase() %></b></td>
                    <td>
                        <% if ("confirmada".equalsIgnoreCase(c.getEstado())) { %>
                            <a href="ReservaController?action=cancelar&idCita=<%= c.getIdCita() %>" class="btn-small red">Cancelar</a>
                        <% } else { %>
                            <span class="grey-text">N/A</span>
                        <% } %>
                    </td>
                </tr>
                <%      }
                    } else { %>
                <tr><td colspan="5" class="center-align">No tienes citas registradas.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
