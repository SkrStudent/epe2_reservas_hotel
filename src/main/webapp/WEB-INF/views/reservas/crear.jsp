<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="${empty reserva.id ? 'Crear reserva' : 'Editar reserva'}"/>
<c:set var="bodyClass" value="bg-reservas"/>
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1 class="h3 mb-0"><c:out value="${pageTitle}"/></h1>
        <a class="btn btn-outline-secondary" href="<c:url value='/reservas'/>">Volver</a>
    </div>

    <!-- Avisos si faltan datos base -->
    <c:if test="${empty usuarios}">
        <div class="alert alert-warning">
            No hay usuarios disponibles. Cree al menos un usuario.
            <a class="alert-link" href="<c:url value='/usuarios/nuevo'/>">Crear usuario</a>
        </div>
    </c:if>
    <c:if test="${empty hoteles}">
        <div class="alert alert-warning">
            No hay hoteles disponibles. Cree al menos un hotel.
            <a class="alert-link" href="<c:url value='/hoteles/nuevo'/>">Crear hotel</a>
        </div>
    </c:if>
    <c:if test="${empty habitaciones}">
        <div class="alert alert-info">
            No hay habitaciones disponibles. Cree habitaciones para poder reservar.
            <a class="alert-link" href="<c:url value='/habitaciones/nuevo'/>">Crear habitación</a>
        </div>
    </c:if>

    <c:if test="${not (empty usuarios or empty hoteles or empty habitaciones)}">
        <form action="<c:url value='/reservas/guardar'/>" method="post"
              class="needs-validation" novalidate>

            <c:if test="${not empty reserva.id}">
                <input type="hidden" name="id" value="${reserva.id}"/>
            </c:if>

            <!-- Usuario -->
            <div class="mb-3">
                <label class="form-label required">Usuario</label>
                <select name="usuarioId" class="form-select" required>
                    <option value="">Seleccione…</option>
                    <c:forEach var="u" items="${usuarios}">
                        <option value="${u.id}" <c:if test="${not empty reserva.usuario and reserva.usuario.id == u.id}">selected</c:if>>
                                ${u.nombre} <c:if test="${not empty u.email}">– ${u.email}</c:if>
                        </option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Seleccione un usuario.</div>
            </div>

            <!-- Hotel -->
            <div class="mb-3">
                <label class="form-label required">Hotel</label>
                <select id="hotelSelect" name="hotelId" class="form-select" required>
                    <option value="">Seleccione…</option>
                    <c:forEach var="h" items="${hoteles}">
                        <option value="${h.id}" <c:if test="${not empty reserva.habitacion and reserva.habitacion.hotel.id == h.id}">selected</c:if>>
                                ${h.nombre}<c:if test="${not empty h.ciudad}"> – ${h.ciudad}</c:if>
                        </option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Seleccione un hotel.</div>
            </div>

            <!-- Habitación (filtra por hotel) -->
            <div class="mb-3">
                <label class="form-label required">Habitación</label>
                <select id="habitacionSelect" name="habitacionId" class="form-select" required>
                    <option value="">Seleccione…</option>
                    <c:forEach var="hb" items="${habitaciones}">
                        <option
                                value="${hb.id}"
                                data-hotel="${hb.hotel.id}"
                                data-precio="${hb.precioNoche}"
                                <c:if test="${not empty reserva.habitacion and reserva.habitacion.id == hb.id}">selected</c:if>>
                                ${hb.hotel.nombre} — #${hb.numero} (${hb.tipo}) — $${hb.precioNoche}
                        </option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Seleccione una habitación.</div>
                <div class="form-text">La lista se filtra automáticamente según el hotel elegido.</div>
            </div>

            <!-- Fechas -->
            <div class="row g-3">
                <div class="col-sm-6">
                    <label class="form-label required">Entrada (check-in)</label>
                    <input type="date" id="checkIn" name="checkIn" class="form-control"
                           value="<c:out value='${reserva.checkIn}'/>" required>
                    <div class="invalid-feedback">Seleccione fecha de entrada.</div>
                </div>
                <div class="col-sm-6">
                    <label class="form-label required">Salida (check-out)</label>
                    <input type="date" id="checkOut" name="checkOut" class="form-control"
                           value="<c:out value='${reserva.checkOut}'/>" required>
                    <div class="invalid-feedback">Seleccione fecha de salida.</div>
                </div>
            </div>

            <!-- Resumen calculado -->
            <div class="row g-3 mt-2">
                <div class="col-sm-4">
                    <label class="form-label">Noches</label>
                    <input type="number" id="noches" name="noches" class="form-control" readonly>
                </div>
                <div class="col-sm-4">
                    <label class="form-label">Precio/noche</label>
                    <div class="input-group">
                        <span class="input-group-text">$</span>
                        <input type="number" id="precioNoche" class="form-control" step="0.01" readonly>
                    </div>
                </div>
                <div class="col-sm-4">
                    <label class="form-label">Total estimado</label>
                    <div class="input-group">
                        <span class="input-group-text">$</span>
                        <input type="number" id="totalEstimado" name="totalEstimado"
                               class="form-control" step="0.01" readonly>
                    </div>
                    <div class="form-text">El total final puede recalcularse en el servidor.</div>
                </div>
            </div>

            <!-- Observaciones -->
            <div class="mb-3 mt-3">
                <label class="form-label">Observaciones</label>
                <textarea name="observaciones" rows="3" class="form-control"><c:out value='${reserva.observaciones}'/></textarea>
            </div>

            <div class="d-flex gap-2">
                <button class="btn btn-primary" type="submit">Guardar</button>
                <a class="btn btn-outline-secondary" href="<c:url value='/reservas'/>">Cancelar</a>
            </div>
        </form>
    </c:if>
</div>

<script>
    (()=> {
        'use strict';

        // Validación Bootstrap
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', ev => {
                if (!form.checkValidity()) { ev.preventDefault(); ev.stopPropagation(); }
                form.classList.add('was-validated');
            }, false);
        });

        const hotelSelect = document.getElementById('hotelSelect');
        const habSelect   = document.getElementById('habitacionSelect');
        const checkIn     = document.getElementById('checkIn');
        const checkOut    = document.getElementById('checkOut');
        const noches      = document.getElementById('noches');
        const precioNoche = document.getElementById('precioNoche');
        const total       = document.getElementById('totalEstimado');

        function filterHabitaciones() {
            const hid = hotelSelect?.value || '';
            const opts = Array.from(habSelect.options);
            opts.forEach(o => {
                if (!o.value) return; // placeholder
                const match = (o.getAttribute('data-hotel') === hid);
                o.hidden = !match;
            });
            // Si la seleccion actual no coincide, resetea
            const sel = habSelect.selectedOptions[0];
            if (sel && sel.hidden) habSelect.value = '';
            updatePrecio();
            computeTotal();
        }

        function updatePrecio() {
            const sel = habSelect.selectedOptions[0];
            const p = sel ? Number(sel.getAttribute('data-precio')) : 0;
            precioNoche.value = p ? p.toFixed(2) : '';
        }

        function computeTotal() {
            const ci = new Date(checkIn.value);
            const co = new Date(checkOut.value);
            let nights = 0;
            if (checkIn.value && checkOut.value && co > ci) {
                nights = Math.round((co - ci) / (1000*60*60*24));
            }
            noches.value = nights || '';
            const p = Number(precioNoche.value);
            total.value = (nights && p) ? (nights * p).toFixed(2) : '';
        }

        hotelSelect?.addEventListener('change', filterHabitaciones);
        habSelect?.addEventListener('change', () => { updatePrecio(); computeTotal(); });
        checkIn?.addEventListener('change', computeTotal);
        checkOut?.addEventListener('change', computeTotal);

        // Inicializa (útil si vienes de "editar")
        filterHabitaciones();
        updatePrecio();
        computeTotal();
    })();
</script>

<jsp:include page="/WEB-INF/jspf/footer.jsp"/>
