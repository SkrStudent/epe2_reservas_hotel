<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="Inicio"/>
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<div class="container py-4">
    <section class="mb-4">
        <h1 class="display-5 fw-semibold mb-2">Reservas Hotel</h1>
        <p class="lead text-muted mb-0">Proyecto EPE2 – IP Chile</p>
    </section>

    <div class="row g-3">
        <div class="col-12 col-sm-6 col-lg-3">
            <a class="card text-decoration-none h-100" href="<c:url value='/usuarios'/>">
                <div class="card-body">
                    <h5 class="card-title mb-1">Gestión de usuarios</h5>
                    <p class="card-text text-muted">Crear, editar y listar usuarios.</p>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-lg-3">
            <a class="card text-decoration-none h-100" href="<c:url value='/hoteles'/>">
                <div class="card-body">
                    <h5 class="card-title mb-1">Hoteles</h5>
                    <p class="card-text text-muted">Administración de hoteles.</p>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-lg-3">
            <a class="card text-decoration-none h-100" href="<c:url value='/habitaciones'/>">
                <div class="card-body">
                    <h5 class="card-title mb-1">Habitaciones</h5>
                    <p class="card-text text-muted">Tipos, precios y estado.</p>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-lg-3">
            <a class="card text-decoration-none h-100" href="<c:url value='/reservas'/>">
                <div class="card-body">
                    <h5 class="card-title mb-1">Reservas</h5>
                    <p class="card-text text-muted">Crear y gestionar reservas.</p>
                </div>
            </a>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/jspf/footer.jsp"/>
