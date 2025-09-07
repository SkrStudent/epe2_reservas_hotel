<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageTitle" value="Crear usuario"/>
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<h2>Crear usuario</h2>

<c:set var="errs" value="${errores}" />
<form method="post" action="<c:url value='/usuarios/crear'/>" class="mt-3">

    <div class="mt-2">
        <label>Nombre</label><br/>
        <input type="text" name="nombre" value="${fn:escapeXml(nombre)}" style="width:320px;" />
        <c:if test="${!empty errs.nombre}">
            <div style="color:#c00;">${errs.nombre}</div>
        </c:if>
    </div>

    <div class="mt-2">
        <label>Email</label><br/>
        <input type="email" name="email" value="${fn:escapeXml(email)}"
               style="width:320px;" placeholder="nombre.apellido@example.cl" />
        <c:if test="${!empty errs.email}">
            <div style="color:#c00;">${errs.email}</div>
        </c:if>
    </div>

    <div class="mt-2">
        <label>Contraseña</label><br/>
        <input type="password" name="password" style="width:320px;" />
        <c:if test="${!empty errs.password}">
            <div style="color:#c00;">${errs.password}</div>
        </c:if>
    </div>

    <div class="mt-2">
        <label>Rol</label><br/>
        <select name="rol" style="width:180px;">
            <option value="USER"  ${rol == 'USER'  ? 'selected' : ''}>USER</option>
            <option value="ADMIN" ${rol == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
        </select>
    </div>

    <div class="mt-3">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <a href="<c:url value='/usuarios'/>" class="btn">Cancelar</a>
    </div>
</form>

<jsp:include page="/WEB-INF/jspf/footer.jsp"/>
