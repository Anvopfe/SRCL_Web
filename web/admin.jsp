<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.vo.UsuarioVO" %>
<%@ page import="model.vo.ServicioVO" %>
<%@ page import="model.vo.CitaVO" %>
<% 
    UsuarioVO user = (UsuarioVO) session.getAttribute("usuario");
    if (user == null || !"admin".equalsIgnoreCase(user.getRol())) { response.sendRedirect("principal.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SRCL - Panel de Administración</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style>.nav-srcl { background-color: #1A3C6E !important; }</style>
</head>
<body>
    <nav class="nav-srcl">
        <div class="nav-wrapper container">
            <a href="#" class="brand-logo">SRCL Admin</a>
            <ul class="right">
                <li><a href="Acceso">Cerrar Sesión</a></li>
            </ul>
        </div>
    </nav>

    <div class="container" style="margin-top: 30px;">
        <h4 style="color: #1A3C6E;">Panel de Administración</h4>
        
        <h5>Todas las Citas</h5>
        <table class="striped responsive-table card">
            <thead>
                <tr><th>Cliente</th><th>Servicio</th><th>Fecha</th><th>Hora</th><th>Estado</th></tr>
            </thead>
            <tbody>
                <% 
                    List<CitaVO> citas = (List<CitaVO>) request.getAttribute("citas");
                    if (citas != null) {
                        for(CitaVO c : citas) {
                %>
                <tr>
                    <td><%= c.getNombreCliente() %></td>
                    <td><%= c.getNomServicio() %></td>
                    <td><%= c.getFecCita() %></td>
                    <td><%= c.getHoraCita() %></td>
                    <td><%= c.getEstado() %></td>
                </tr>
                <%      }
                    } %>
            </tbody>
        </table>

        <h5>Servicios Ofrecidos</h5>
        <table class="striped responsive-table card">
            <thead><tr><th>ID</th><th>Servicio</th><th>Duración</th><th>Precio</th></tr></thead>
            <tbody>
                <% 
                    List<ServicioVO> servicios = (List<ServicioVO>) request.getAttribute("servicios");
                    if (servicios != null) {
                        for(ServicioVO s : servicios) {
                %>
                <tr>
                    <td><%= s.getIdServicio() %></td>
                    <td><%= s.getNomServicio() %></td>
                    <td><%= s.getDuracionMin() %> min</td>
                    <td>$<%= s.getPrecio() %></td>
                </tr>
                <%      }
                    } %>
            </tbody>
        </table>
    </div>
</body>
</html>
