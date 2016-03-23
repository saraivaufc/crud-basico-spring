<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listar Contatos</title>
<jsp:include page="base/header-estrutura.jsp" />
</head>
<body>
<jsp:include page="base/header.jsp" />
	<c:choose>
	    <c:when test="${acao eq 'adicionar'}">
	        <h2 class="text-center">Novo Contato</h2>
	        <c:set var="url" value="/adicionar"></c:set>
	        <br />	        
	    </c:when>
	    <c:when test="${acao eq 'editar'}">
	        <h2 class="text-center">Editar Contato</h2>
	        <c:set var="url" value="/editar"></c:set>
	        <br />
	    </c:when>
	</c:choose>
	
	<form:form id="ContatoForm" commandName="contato" servletRelativeAction="${url}" method="POST">
		<form:hidden path="id"/>
		<div class="form-group">
			<label for="nome">Nome: </label>
			<form:input type="text" path="nome" cssClass="form-control"/><br>
		</div>
		<div class="form-group">
			<label for="email">Email: </label>
			<form:input type="text" path="email" cssClass="form-control" /><br>
		</div>
		<div class="form-group">
			<label for="telefone">Telefone: </label>
			<form:input type="text" path="telefone" cssClass="form-control" /><br>
		</div>
		<c:choose>
	    <c:when test="${acao eq 'adicionar'}">
	        <input type="submit" class="btn btn-primary" value="Adicionar"/>	        
	    </c:when>
	    <c:when test="${acao eq 'editar'}">
	        <input type="submit" class="btn btn-primary" value="Editar"/>		
	    </c:when>
	</c:choose>
	</form:form>
</body>
<jsp:include page="base/footer.jsp" />
</html>