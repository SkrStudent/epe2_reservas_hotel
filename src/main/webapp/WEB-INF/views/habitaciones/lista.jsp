<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageTitle" value="Habitaciones"/>
<c:set var="bodyClass" value="bg-habitaciones"/>
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1 class="h3 mb-0">Habitaciones</h1>
        <a class="btn btn-primary" href="<c:url value='/habitaciones/nuevo'/>">Crear habitación</a>
    </div>

    <!-- Mensaje flash opcional -->
    <c:if test="${not empty sessionScope.flash}">
        <div class="alert alert-success">${sessionScope.flash}</div>
        <c:remove var="flash" scope="session"/>
    </c:if>

    <c:choose>
        <c:when test="${empty habitaciones}">
            <div class="alert alert-info mb-3">No hay habitaciones.</div>
        </c:when>
        <c:otherwise>
            <div class="table-responsive">
                <table class="table table-striped align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Hotel</th>
                        <th>Número</th>
                        <th>Tipo</th>
                        <th>Precio/noche</th>
                        <th class="text-end">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="hb" items="${habitaciones}">
                        <tr>
                            <td>${hb.id}</td>
                            <td>${hb.hotel.nombre}</td>
                            <td>${hb.numero}</td>
                            <td>${hb.tipo}</td>
                            <td>
                                <fmt:formatNumber value="${hb.precioNoche}" pattern="$ #,##0"/>
                            </td>
                            <td class="text-end table-actions">
                                <a class="btn btn-sm btn-outline-secondary"
                                   href="<c:url value='/habitaciones/editar?id=${hb.id}'/>">Editar</a>
                                <a class="btn btn-sm btn-outline-danger"
                                   href="<c:url value='/habitaciones/eliminar?id=${hb.id}'/>"
                                   onclick="return confirm('¿Eliminar habitación?');">Eliminar</a>
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
