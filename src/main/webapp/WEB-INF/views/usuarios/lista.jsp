<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="Usuarios"/>
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<h2>Usuarios</h2>

<p><a class="btn" href="<c:url value='/usuarios/crear'/>">Crear usuario</a></p>

<c:choose>
    <c:when test="${empty usuarios}">
        <p>No hay usuarios.</p>
    </c:when>
    <c:otherwise>
        <table class="mt-2">
            <thead>
            <tr>
                <th>ID</th><th>Nombre</th><th>Email</th><th>Rol</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="u" items="${usuarios}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.nombre}</td>
                    <td>${u.email}</td>
                    <td>${u.rol}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<p class="mt-3"><a href="<c:url value='/'/>">Volver</a></p>

<jsp:include page="/WEB-INF/jspf/footer.jsp"/>
