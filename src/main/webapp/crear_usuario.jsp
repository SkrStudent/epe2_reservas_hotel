<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageTitle" value="Crear usuario"/>
<c:set var="bodyClass" value="bg-usuarios"/><!-- opcional si agregas el fondo en app.css -->
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1 class="h3 mb-0">Crear usuario</h1>
        <a class="btn btn-outline-secondary" href="<c:url value='/usuarios'/>">Volver</a>
    </div>

    <c:if test="${not empty errores}">
        <div class="alert alert-danger">Revisa los campos marcados.</div>
    </c:if>

    <form method="post" action="<c:url value='/usuarios/crear'/>"
          class="needs-validation" novalidate>

        <div class="mb-3">
            <label class="form-label required">Nombre</label>
            <input type="text" name="nombre" class="form-control"
                   value="<c:out value='${fn:escapeXml(nombre)}'/>" required autofocus>
            <div class="invalid-feedback">El nombre es obligatorio.</div>
            <c:if test="${not empty errores.nombre}">
                <div class="text-danger small mt-1">${errores.nombre}</div>
            </c:if>
        </div>

        <div class="mb-3">
            <label class="form-label required">Email</label>
            <input type="email" name="email" class="form-control"
                   placeholder="nombre.apellido@example.cl"
                   value="<c:out value='${fn:escapeXml(email)}'/>" required>
            <div class="invalid-feedback">Ingresa un email válido.</div>
            <c:if test="${not empty errores.email}">
                <div class="text-danger small mt-1">${errores.email}</div>
            </c:if>
        </div>

        <div class="mb-3">
            <label class="form-label required">Contraseña</label>
            <input type="password" name="password" class="form-control" required>
            <div class="invalid-feedback">La contraseña es obligatoria.</div>
            <c:if test="${not empty errores.password}">
                <div class="text-danger small mt-1">${errores.password}</div>
            </c:if>
        </div>

        <div class="mb-3">
            <label class="form-label required">Rol</label>
            <select name="rol" class="form-select" required>
                <option value="">Seleccione…</option>
                <option value="USER"  ${rol == 'USER'  ? 'selected' : ''}>USER</option>
                <option value="ADMIN" ${rol == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
            </select>
            <div class="invalid-feedback">Selecciona un rol.</div>
        </div>

        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <a href="<c:url value='/usuarios'/>" class="btn btn-outline-secondary">Cancelar</a>
        </div>
    </form>
</div>

<script>
    (()=> {
        'use strict';
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(form=>{
            form.addEventListener('submit', ev=>{
                if (!form.checkValidity()) { ev.preventDefault(); ev.stopPropagation(); }
                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>

<jsp:include page="/WEB-INF/jspf/footer.jsp"/>
