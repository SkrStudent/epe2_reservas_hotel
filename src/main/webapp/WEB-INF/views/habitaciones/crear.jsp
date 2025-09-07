<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="Crear habitación"/>
<c:set var="bodyClass" value="bg-habitaciones"/>
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1 class="h3 mb-0">Crear habitación</h1>
        <a class="btn btn-outline-secondary" href="<c:url value='/habitaciones'/>">Volver</a>
    </div>

    <!-- Si no hay hoteles, avisa y evita mostrar el formulario -->
    <c:if test="${empty hoteles}">
        <div class="alert alert-warning">
            No hay hoteles disponibles. Primero crea un hotel para poder agregar habitaciones.
            <a class="alert-link" href="<c:url value='/hoteles/nuevo'/>">Crear hotel</a>
        </div>
    </c:if>

    <c:if test="${not empty hoteles}">
        <form action="<c:url value='/habitaciones/guardar'/>" method="post"
              class="needs-validation" novalidate>

            <!-- Si reusas este form para editar, este hidden mantiene el id -->
            <c:if test="${not empty habitacion.id}">
                <input type="hidden" name="id" value="${habitacion.id}"/>
            </c:if>

            <!-- Hotel -->
            <div class="mb-3">
                <label class="form-label required">Hotel</label>
                <select name="hotelId" class="form-select" required autofocus>
                    <option value="">Seleccione…</option>
                    <c:forEach var="h" items="${hoteles}">
                        <option value="${h.id}"
                                <c:if test="${not empty habitacion.hotel and habitacion.hotel.id == h.id}">selected</c:if>>
                                ${h.nombre}<c:if test="${not empty h.ciudad}"> – ${h.ciudad}</c:if>
                        </option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Seleccione un hotel.</div>
            </div>

            <!-- Número -->
            <div class="mb-3">
                <label class="form-label required">Número</label>
                <input type="text" name="numero" maxlength="20" class="form-control"
                       value="<c:out value='${habitacion.numero}'/>" required>
                <div class="invalid-feedback">El número de habitación es obligatorio.</div>
            </div>

            <!-- Tipo -->
            <div class="mb-3">
                <label class="form-label required">Tipo</label>
                <select name="tipo" class="form-select" required>
                    <option value="">Seleccione…</option>
                    <option value="SIMPLE" ${habitacion.tipo == 'SIMPLE' ? 'selected' : ''}>SIMPLE</option>
                    <option value="DOBLE"  ${habitacion.tipo == 'DOBLE'  ? 'selected' : ''}>DOBLE</option>
                    <option value="SUITE"  ${habitacion.tipo == 'SUITE'  ? 'selected' : ''}>SUITE</option>
                </select>
                <div class="invalid-feedback">Seleccione el tipo de habitación.</div>
            </div>

            <!-- Precio por noche -->
            <div class="mb-3">
                <label class="form-label required">Precio por noche</label>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="number" name="precioNoche" class="form-control"
                           step="0.01" min="0"
                           value="<c:out value='${habitacion.precioNoche}'/>" required>
                </div>
                <div class="form-text">Use punto para decimales (ej: 45990.00).</div>
                <div class="invalid-feedback">Ingrese un precio válido.</div>
            </div>

            <div class="d-flex gap-2">
                <button class="btn btn-primary" type="submit">Guardar</button>
                <a class="btn btn-outline-secondary" href="<c:url value='/habitaciones'/>">Cancelar</a>
            </div>
        </form>
    </c:if>
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
