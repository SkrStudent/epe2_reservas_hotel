<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="Hoteles"/>
<c:set var="bodyClass" value="bg-hoteles"/>
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1 class="h3 mb-0">Hoteles</h1>
        <a class="btn btn-primary" href="<c:url value='/hoteles/nuevo'/>">Crear hotel</a>
    </div>

    <!-- Flash opcional -->
    <c:if test="${not empty sessionScope.flash}">
        <div class="alert alert-success">${sessionScope.flash}</div>
        <c:remove var="flash" scope="session"/>
    </c:if>

    <c:choose>
        <c:when test="${empty hoteles}">
            <div class="alert alert-info">No hay hoteles.</div>
        </c:when>
        <c:otherwise>
            <div class="table-responsive">
                <table class="table table-striped align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Ciudad</th>
                        <th>Dirección</th>
                        <th class="text-end">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="h" items="${hoteles}">
                        <tr>
                            <td>${h.id}</td>
                            <td>${h.nombre}</td>
                            <td>${h.ciudad}</td>
                            <td>${h.direccion}</td>
                            <td class="text-end table-actions">
                                <a class="btn btn-sm btn-outline-secondary"
                                   href="<c:url value='/hoteles/editar?id=${h.id}'/>">Editar</a>
                                <a class="btn btn-sm btn-outline-danger"
                                   href="<c:url value='/hoteles/eliminar?id=${h.id}'/>"
                                   onclick="return confirm('¿Eliminar hotel?');">Eliminar</a>
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
