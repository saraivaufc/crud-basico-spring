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
	<h2 class="text-center">Contatos</h2>
	<c:if test="${qtd_busca > 0 }">
		<h3>Foi encontrado ${qtd_busca} resultados para a busca!</h3>
	</c:if>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Email</th>
				<th>Telefone</th>
				<th>Ações</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${contatos}" var="contato">
			<tr>
			<td>${contato.nome }</td>
			<td>${contato.email }</td>
			<td>${contato.telefone }</td>
			<td>
				<a href="/contatos/detalhes/${contato.id }"><i class="fa fa-table"></i></a>
				<a href="/contatos/remover/${contato.id }"><i class="fa fa-remove"></i></a>
				<a href="/contatos/editar/${contato.id }"><i class="fa fa-edit"></i></a>
			</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
<jsp:include page="base/footer.jsp" />
</html>