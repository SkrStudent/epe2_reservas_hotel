<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="${empty hotel.id ? 'Crear hotel' : 'Editar hotel'}"/>
<c:set var="bodyClass" value="bg-hoteles"/>
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1 class="h3 mb-0"><c:out value="${pageTitle}"/></h1>
        <a class="btn btn-outline-secondary" href="<c:url value='/hoteles'/>">Volver</a>
    </div>

    <form action="<c:url value='/hoteles/guardar'/>" method="post"
          class="needs-validation" novalidate>

        <c:if test="${not empty hotel.id}">
            <input type="hidden" name="id" value="${hotel.id}"/>
        </c:if>

        <!-- Nombre -->
        <div class="mb-3">
            <label class="form-label required">Nombre</label>
            <input type="text" name="nombre" class="form-control"
                   value="<c:out value='${hotel.nombre}'/>" required autofocus>
            <div class="invalid-feedback">El nombre del hotel es obligatorio.</div>
        </div>

        <!-- Ciudad -->
        <div class="mb-3">
            <label class="form-label required">Ciudad</label>
            <input type="text" name="ciudad" class="form-control"
                   value="<c:out value='${hotel.ciudad}'/>" required>
            <div class="invalid-feedback">La ciudad es obligatoria.</div>
        </div>

        <!-- Dirección -->
        <div class="mb-3">
            <label class="form-label required">Dirección</label>
            <input type="text" name="direccion" class="form-control"
                   value="<c:out value='${hotel.direccion}'/>" required>
            <div class="invalid-feedback">La dirección es obligatoria.</div>
        </div>

        <div class="d-flex gap-2">
            <button class="btn btn-primary" type="submit">Guardar</button>
            <a class="btn btn-outline-secondary" href="<c:url value='/hoteles'/>">Cancelar</a>
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
