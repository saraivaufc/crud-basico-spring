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

<ol class="breadcrumb">
  <li><a href="/contatos/">Início</a></li>
</ol>


	<h2 class="text-center">Contatos</h2>
	<c:if test="${qtd_busca >= 0 }">
		<h3>Foi encontrado ${qtd_busca} resultados para a busca!</h3>
	</c:if>
	
<div class="bootcards-list">
	<div class="panel panel-default">
		<div class="panel-body">
			  <form>
					<div class="row">
					  <div class="col-xs-9">
					    <div class="form-group">
					      <input type="text" class="form-control" placeholder="Buscar contatos...">
					      <i class="fa fa-search"></i>
					    </div>
					  </div>
					  <div class="col-xs-3">
					    <a class="btn btn-primary btn-block" href="/contatos/adicionar/">
					      <i class="fa fa-plus"></i>
					      Novo Contato
					    </a>
					  </div>
					</div>
			</form>
			
			<div class="list-group">
			<c:forEach items="${contatos}" var="contato">
				<a class="list-group-item" href="#">
					<img class="img-rounded pull-left" src="/contatos/${contato.relativePathImagem }" width="50px" height="50px"/>
					<h4 class="list-group-item-heading">${contato.nome }</h4>
					<p class="list-group-item-text">${contato.telefone }</p>
				</a>
			</c:forEach>
		    </div>
		</div>
	</div>
</div>

	<table class="table table-striped">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Email</th>
				<th>Telefone</th>
				<th>Endereço</th>
				<th>Imagem</th>
				<th>Ações</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${contatos}" var="contato">
			<tr>
			<td>${contato.nome }</td>
			<td>${contato.email }</td>
			<td>${contato.telefone }</td>
			<td>${contato.endereco }</td>
			<td>${contato.relativePathImagem }</td>
			<td>
				<a href="/contatos/detalhes/${contato.id }"><i class="fa fa-table"></i></a>
				<a href="/contatos/remover/${contato.id }"><i class="fa fa-remove"></i></a>
				<a href="/contatos/editar/${contato.id }"><i class="fa fa-edit"></i></a>
			</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

<jsp:include page="base/footer.jsp" />
</body>
</html>