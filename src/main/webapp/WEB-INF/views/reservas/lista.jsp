<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="Reservas"/>
<c:set var="bodyClass" value="bg-reservas"/>
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1 class="h3 mb-0">Reservas</h1>
        <a class="btn btn-primary" href="<c:url value='/reservas/nuevo'/>">Crear reserva</a>
    </div>

    <!-- Flash opcional -->
    <c:if test="${not empty sessionScope.flash}">
        <div class="alert alert-success">${sessionScope.flash}</div>
        <c:remove var="flash" scope="session"/>
    </c:if>

    <c:choose>
        <c:when test="${empty reservas}">
            <div class="alert alert-info">No hay reservas.</div>
        </c:when>
        <c:otherwise>
            <div class="table-responsive">
                <table class="table table-striped align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Usuario</th>
                        <th>Hotel</th>
                        <th>Hab.</th>
                        <th>Check-in</th>
                        <th>Check-out</th>
                        <th class="text-end">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="r" items="${reservas}">
                        <tr>
                            <td>${r.id}</td>
                            <td>${r.usuario.nombre}</td>
                            <td>${r.habitacion.hotel.nombre}</td>
                            <td>#${r.habitacion.numero} (${r.habitacion.tipo})</td>
                            <td>${r.checkIn}</td>
                            <td>${r.checkOut}</td>
                            <td class="text-end table-actions">
                                <a class="btn btn-sm btn-outline-secondary"
                                   href="<c:url value='/reservas/editar?id=${r.id}'/>">Editar</a>
                                <a class="btn btn-sm btn-outline-danger"
                                   href="<c:url value='/reservas/eliminar?id=${r.id}'/>"
                                   onclick="return confirm('¿Eliminar reserva?');">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>

    <a class="btn btn-outline-secondary mt-2" href="<c:url value='/'/>">Volver</a>
</div>

<jsp:include page="/WEB-INF/jspf/footer.jsp"/>
