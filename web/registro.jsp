<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SRCL - Registro de Usuario</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style>.btn-srcl { background-color: #1A3C6E !important; }</style>
</head>
<body>
    <div class="container" style="margin-top: 40px;">
        <div class="row">
            <div class="col s12 m6 offset-m3">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title center-align bold" style="color:#1A3C6E;">Registro de Usuario</span>
                        <% if (request.getAttribute("mensaje") != null) { %>
                            <p class="red-text center-align"><%= request.getAttribute("mensaje") %></p>
                        <% } %>
                        <form action="RegistroController" method="POST">
                            <div class="input-field"><input type="text" name="documento" required><label>Documento</label></div>
                            <div class="input-field"><input type="text" name="nombre" required><label>Nombres</label></div>
                            <div class="input-field"><input type="text" name="apellido" required><label>Apellidos</label></div>
                            <div class="input-field"><input type="email" name="email" required><label>Correo Electrónico</label></div>
                            <div class="input-field"><input type="password" name="password" required><label>Contraseña</label></div>
                            <div class="center-align">
                                <button type="submit" class="btn btn-srcl">Registrarse</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-action center-align">
                        <a href="principal.jsp" style="color:#1A3C6E;">Volver al Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
