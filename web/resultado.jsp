<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SRCL - Resultado</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>
<body>
    <div class="container" style="margin-top: 50px;">
        <div class="card-panel <%= request.getAttribute("tipo") %> lighten-4 center-align">
            <h5 class="<%= request.getAttribute("tipo") %>-text text-darken-4"><%= request.getAttribute("mensaje") %></h5>
            <br>
            <a href="ReservaController" class="btn black">Volver a Reservar</a>
            <a href="ReservaController?action=historial" class="btn #1A3C6E">Ver mis citas</a>
        </div>
    </div>
</body>
</html>
