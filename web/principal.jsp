<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SRCL - Sistema de Reserva de Citas en Línea</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style>
        body { background-color: #f2f6fa; }
        .nav-srcl { background-color: #1A3C6E !important; }
        .btn-srcl { background-color: #1A3C6E !important; }
    </style>
</head>
<body>
    <nav class="nav-srcl">
        <div class="nav-wrapper container">
            <a href="#" class="brand-logo bold">SRCL Citas</a>
        </div>
    </nav>

    <div class="container" style="margin-top: 40px;">
        <div class="row">
            <div class="col s12 m6 offset-m3">
                <div class="card z-depth-2">
                    <div class="card-content">
                        <span class="card-title center-align bold" style="color:#1A3C6E;">Iniciar Sesión</span>
                        <p class="center-align grey-text">Sistema de Reserva de Citas en Línea</p>
                        <br>
                        <% if (request.getAttribute("error") != null) { %>
                            <div class="red-text center-align bold"><%= request.getAttribute("error") %></div>
                            <br>
                        <% } %>
                        <form action="Acceso" method="POST">
                            <div class="input-field">
                                <input type="email" id="email" name="email" required>
                                <label for="email">Correo Electrónico</label>
                            </div>
                            <div class="input-field">
                                <input type="password" id="password" name="password" required>
                                <label for="password">Contraseña</label>
                            </div>
                            <div class="center-align" style="margin-top:20px;">
                                <button type="submit" class="btn btn-srcl waves-effect waves-light border-round">Ingresar</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-action center-align">
                        <a href="registro.jsp" style="color:#1A3C6E;">¿No tienes cuenta? Regístrate</a> | 
                        <a href="recuperar.jsp" style="color:#1A3C6E;">Recuperar clave</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
