<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.vo.ServicioVO" %>
<%@ page import="model.vo.UsuarioVO" %>
<% 
    UsuarioVO user = (UsuarioVO) session.getAttribute("usuario");
    if (user == null) { response.sendRedirect("principal.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SRCL - Reservar Cita</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style>
        .nav-srcl { background-color: #1A3C6E !important; }
        .btn-srcl { background-color: #1A3C6E !important; }
    </style>
</head>
<body>
    <nav class="nav-srcl">
        <div class="nav-wrapper container">
            <a href="#" class="brand-logo">SRCL</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li>Bienvenido, <%= user.getNombre() %></li>
                <li><a href="ReservaController?action=historial">Mis Citas</a></li>
                <li><a href="Acceso">Cerrar Sesión</a></li>
            </ul>
        </div>
    </nav>

    <div class="container" style="margin-top: 30px;">
        <h4 class="center-align" style="color: #1A3C6E;">Reservar una Cita</h4>
        <div class="row">
            <div class="col s12 m8 offset-m2">
                <div class="card z-depth-2">
                    <div class="card-content">
                        <form action="ReservaController" method="POST">
                            <div class="input-field">
                                <select name="idServicio" required style="display:block; width:100%; height:40px; border-radius:4px;">
                                    <option value="" disabled selected>-- Seleccione un Servicio --</option>
                                    <% 
                                        List<ServicioVO> servicios = (List<ServicioVO>) request.getAttribute("servicios");
                                        if (servicios != null) {
                                            for(ServicioVO s : servicios) {
                                    %>
                                    <option value="<%= s.getIdServicio() %>"><%= s.getNomServicio() %> - <%= s.getDuracionMin() %> min ($<%= s.getPrecio() %>)</option>
                                    <%      } 
                                        } %>
                                </select>
                            </div>
                            <br>
                            <div class="input-field">
                                <input type="date" id="fecCita" name="fecCita" required>
                                <label for="fecCita" class="active">Fecha de la Cita</label>
                            </div>
                            <div class="input-field">
                                <select name="horaCita" required style="display:block; width:100%; height:40px; border-radius:4px;">
                                    <option value="" disabled selected>-- Seleccione una Hora --</option>
                                    <option value="08:00">08:00 AM</option>
                                    <option value="09:00">09:00 AM</option>
                                    <option value="10:00">10:00 AM</option>
                                    <option value="11:00">11:00 AM</option>
                                    <option value="14:00">02:00 PM</option>
                                    <option value="15:00">03:00 PM</option>
                                </select>
                            </div>
                            <br>
                            <div class="center-align">
                                <button type="submit" class="btn btn-srcl waves-effect waves-light">Confirmar Reserva</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
