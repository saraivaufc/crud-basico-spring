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
	<h2>Contatos</h2>
	<form:form id="BuscarForm" commandName="buscar" servletRelativeAction="/buscar" method="POST">
		<input type="text" name="nome"/>
		 <input type="submit" value="Buscar"/>
		 <br>
	</form:form>
	<c:forEach items="${contatos}" var="contato">
		<label>Nome: ${contato.nome }</label> | 
		<label>Email: ${contato.email }</label> | 
		<label>Telefone: ${contato.telefone }</label>
		<a href="/contatos/detalhes/${contato.id }">detalhes</a>
		<a href="/contatos/remover/${contato.id }">remover</a>
		<a href="/contatos/editar/${contato.id }">editar</a><br>
	</c:forEach>
	<a href="/contatos/adicionar">Adicionar</a>
</body>
</html>