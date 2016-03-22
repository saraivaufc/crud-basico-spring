<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listar Contatos</title>
</head>
<body>
	<c:choose>
	    <c:when test="${acao eq 'adicionar'}">
	        Novo Contato
	        <c:set var="url" value="/adicionar"></c:set>
	        <br />	        
	    </c:when>
	    <c:when test="${acao eq 'editar'}">
	        Editar Contato
	        <c:set var="url" value="/editar"></c:set>
	        <br />
	    </c:when>
	</c:choose>
	
	<form:form id="ContatoForm" commandName="contato" servletRelativeAction="${url}" method="POST">
		<form:hidden path="id"/>
		<label>Nome: </label>
		<form:input type="text" path="nome"/><br>
		<label>Email: </label>
		<form:input type="text" path="email"/><br>
		<label>Telefone: </label>
		<form:input type="text" path="telefone"/><br>
		
		<c:choose>
	    <c:when test="${acao eq 'adicionar'}">
	        <input type="submit" value="Adicionar"/>	        
	    </c:when>
	    <c:when test="${acao eq 'editar'}">
	        <input type="submit" value="Editar"/>		
	    </c:when>
	</c:choose>
	</form:form>
</body>
</html>