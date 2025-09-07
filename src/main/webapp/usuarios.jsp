<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="Usuarios"/>
<c:set var="bodyClass" value="bg-usuarios"/><!-- opcional si agregas el fondo en app.css -->
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1 class="h3 mb-0">Usuarios</h1>
        <a class="btn btn-primary" href="<c:url value='/usuarios/nuevo'/>">Crear usuario</a>
    </div>

    <c:if test="${not empty sessionScope.flash}">
        <div class="alert alert-success">${sessionScope.flash}</div>
        <c:remove var="flash" scope="session"/>
    </c:if>

    <c:choose>
        <c:when test="${empty usuarios}">
            <div class="alert alert-info">No hay usuarios.</div>
        </c:when>
        <c:otherwise>
            <div class="table-responsive">
                <table class="table table-striped align-middle">
                    <thead>
                    <tr>
                        <th>ID</th><th>Nombre</th><th>Email</th><th>Rol</th>
                        <th class="text-end">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="u" items="${usuarios}">
                        <tr>
                            <td>${u.id}</td>
                            <td>${u.nombre}</td>
                            <td>${u.email}</td>
                            <td>${u.rol}</td>
                            <td class="text-end table-actions">
                                <a class="btn btn-sm btn-outline-secondary"
                                   href="<c:url value='/usuarios/editar?id=${u.id}'/>">Editar</a>
                                <a class="btn btn-sm btn-outline-danger"
                                   href="<c:url value='/usuarios/eliminar?id=${u.id}'/>"
                                   onclick="return confirm('¿Eliminar usuario?');">Eliminar</a>
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
