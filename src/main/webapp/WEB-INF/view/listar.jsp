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
		<h3>Foram encontrado ${qtd_busca} resultados para a busca!</h3>
	</c:if>
	
<div class="bootcards-list">
	<div class="panel panel-default">
		<div class="panel-body">
			<form:form id="BuscarForm" commandName="buscar" servletRelativeAction="/buscar" method="POST" >
				 <div class="row">
					  <div class="col-xs-9">
					  <div class="form-group">
					  	  <input type="text" class="form-control" placeholder="Buscar contatos..." name="nome" required/>
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
			  </form:form>
			
			<div class="list-group">
			<c:forEach items="${contatos}" var="contato">
				<a class="list-group-item" href="/contatos/detalhes/${contato.id }">
				    <div class="row">
					  <div class="col-sm-6">
					  		<img class="img-rounded pull-left" 
					  		<c:if test="${contato.relativePathImagem != null }">
					  			src="<c:url value="${contato.relativePathImagem }" />"
					  		</c:if>
							<c:if test="${contato.relativePathImagem == null }">
								src="<c:url value="/resources/img/icons/contact.png" />"
							</c:if>
							width="50px" height="50px"/>
							<h4 class="list-group-item-heading">${contato.nome }</h4>
							<p class="list-group-item-text">${contato.telefone }</p>
			          </div>
			          <div class="col-sm-6">
			            <p class="list-group-item-text">${contato.email }</p>
			            <p class="list-group-item-text">${contato.endereco }</p>
			          </div>
					</div>
				</a>
			</c:forEach>
		    </div>
		</div>
	</div>
</div>

<jsp:include page="base/footer.jsp" />
</body>
</html>