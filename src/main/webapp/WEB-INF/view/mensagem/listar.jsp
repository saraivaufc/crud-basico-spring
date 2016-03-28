<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listar Contatos</title>
<jsp:include page="../base/header-estrutura.jsp" />
</head>
<body>
<jsp:include page="../base/header.jsp" />

<ol class="breadcrumb">
  <li><a href="/contatos/">Início</a></li>
  <li><a href="/contatos/mensagens/listar">Mensagens Enviadas</a></li>
</ol>

<div class="table-responsive">
<table class="table">
	<thead>
		<tr>
			<th>Remetente</th>
			<th>Destinatario</th>
			<th>Assunto</th>
			<th>Mensagem</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${mensagens}" var="mensagem">
			<tr>
				<td>${mensagem.remetente}</td>
				<td><a href="/contatos/detalhes/${mensagem.destinatario.id }">${mensagem.destinatario}</a></td>
				<td>${mensagem.assunto}</td>
				<td>${mensagem.mensagem}</td>
			</tr>	
		</c:forEach>
		<tr></tr>
	</tbody>
</table>
</div>
<jsp:include page="../base/footer.jsp" />
</body>
</html>