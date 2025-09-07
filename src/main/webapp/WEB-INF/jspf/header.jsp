<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><c:out value="${pageTitle != null ? pageTitle : 'Reservas Hotel'}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Estilos de la app -->
    <link href="<c:url value='/assets/css/app.css'/>" rel="stylesheet">
</head>

<!-- MUY IMPORTANTE: este class permite fondos por sección -->
<body class="${empty bodyClass ? '' : bodyClass}">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="<c:url value='/'/>">Reservas Hotel</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain" aria-controls="navMain" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navMain">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="<c:url value='/usuarios'/>">Usuarios</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value='/hoteles'/>">Hoteles</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value='/habitaciones'/>">Habitaciones</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value='/reservas'/>">Reservas</a></li>
            </ul>
        </div>
    </div>
</nav>
