<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="es">
<head><%@ include file="includes/cabecera.jsp"%>
</head>
<body>
<%@ include file="includes/navegador.jsp"%>
<%@ include file="includes/modales.jsp"%>
<%@ include file="includes/modalesABMevento.jsp"%>
	
		<div class="container-fluid">
		<div class="col-md-12 main">
			<div class="row">
		
				<div class="col-md-8 col-md-offset-2">
		 			<ol class="breadcrumb text-center">
	          			<li class="breadcrumb-item active">Administraci�n de eventos - Desde aqu� los podr� visualizar, crear, modificar o eliminar.</li>
	     			</ol>
	     			
	     			
	     	<!-- Se listan los eventos -->	     			
						<div class="panel panel-primary">
							<div class="panel-heading">Listado de eventos</div>
							<div class="container-fluid">
								<div class="row">
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>		
											<tr>
												<th class="text-center">ID</th>
												<th class="text-center">Equipo Local</th>
												<th class="text-center">Equipo Visitante</th>
												<th class="text-center">Descripci�n del evento</th>
												<th class="text-center">Tipo de evento</th>
											</tr>
											</thead>
											<c:forEach items="${eventos}" var="e">
											<tbody class="text-center">
												<td>${e.id}</td>
												<td>${e.partido.local.nombre}</td>
												<td>${e.partido.visitante.nombre}</td>
												<td>${e.descripcion}</td>
												<td>${e.nombre}</td>
											</tbody>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
						</div>
						
				
			<!--  Empieza panel para crear evento -->
	     			<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">Crear nuevo evento:</h3>
							</div>
							<div class="container-fluid">

								<form:form class="form-horizontal" role="form" action="crear-Evento" method="post" name="crearEvento" modelAttribute="evento">

									<div class="form-group"></div>

									<div class="form-group">
										<div class="col-md-12">

									<div class="form-group">
										<div class="col-md-10 col-md-offset-1">
											<div class="input-group">
												<span class="input-group-addon">Partido</span>
												<select name="partidos" class="form-control" required="required">

													<c:forEach items="${partidos}" var="e">
														<option value="" selected hidden>Elegir partido:</option>
 														<option value="${e.id}">${e.id} -  [${e.local.nombre} vs ${e.visitante.nombre}] - ${e.fecha}</option> 
													</c:forEach>

												</select>
											</div>
											</div>
											</div>
							
				
									<div class="col-md-8 col-md-offset-2">
										<div class="input-group">
											<span class="input-group-addon">Tipo</span> 
												<select name="tipoEvento" class="form-control" required="required">
														<option value="" selected hidden>Elegir tipo de evento:</option> 
												</select>
										</div>
									</div>
				

										</div>
									</div>



								<div class="form-group">
							<div class="col-md-8 col-md-offset-4">
								<a data-toggle="modal" data-target="#add" class="btn btn-success">Crear nuevo evento</a>
							</div>
						</div>
						</form:form>
						</div>

						
					</div>
					
					<!--  Termina panel para crear evento -->
				
				
				<!--  Empieza panel para eliminar evento -->	
							<div class="panel panel-danger">
							<div class="panel-heading">
								<h3 class="panel-title">Eliminaci�n de eventos:</h3>
							</div>
							<div class="container-fluid">
							
							<form:form class="form-horizontal" role="form" action="eliminar-Evento" method="post" name="eliminarEvento" modelAttribute="evento">

									<div class="form-group"></div>

									<div class="form-group">
										<div class="col-md-10 col-md-offset-1">
											<div class="input-group center">
												<span class="input-group-addon">Evento a eliminar:
												</span> <select name="eventoParaEliminar" class="form-control" required="required">

													<c:forEach items="${eventos}" var="e">
														<option value="" selected hidden>Elegir:</option>

														<option value="${e.id}">${e.id} - [${e.partido.local.nombre} vs ${e.partido.visitante.nombre}] - ${e.partido.fecha} - ${e.nombre}</option>
													</c:forEach>

												</select>
											</div>
										</div>
									</div>

							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<a data-toggle="modal" data-target="#delete" class="btn btn-danger">Eliminar evento seleccionado</a>
								</div>
							</div>
							</form:form>
							</div>
						</div>
				<!--  Termina panel para eliminar evento -->
				
				
				
				
				</div>
				</div>
			</div>
		</div>
	</div>
	


</body>
</html>
