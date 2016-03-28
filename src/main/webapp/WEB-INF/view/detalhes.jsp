<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="base/header-estrutura.jsp" />
</head>
<body>
<jsp:include page="base/header.jsp" />
<ol class="breadcrumb">
  <li><a href="/contatos/">Início</a></li>
  <li class="active">${contato.nome}</li>
</ol>

<div class="panel panel-default">
  <div class="panel-heading clearfix">
    <h1 class="panel-title pull-left">${contato.nome}</h1>
    	<div class="btn-group pull-right">
		      <a class="btn btn-primary" href="/contatos/editar/${contato.id}/">
		        <i class="fa fa-pencil"></i>
		        Editar
		      </a>
		      <a class="btn btn-danger" href="/contatos/remover/${contato.id}/">
		        <i class="fa fa-pencil"></i>
		        Excluir
		      </a>
		      
      	</div>
    </div>
    <div class="container-fluid">
    <div class="row">
	    <div class="col-md-3">
	    	<div class="row">
	    	<div class="text-center">
		    	<img class="img-responsive img-rounded" 
		    	<c:if test="${contato.relativePathImagem != null }">
		  			src="<c:url value="${contato.relativePathImagem }" />"
		  		</c:if>
				<c:if test="${contato.relativePathImagem == null }">
					src="<c:url value="/resources/img/icons/contact.png" />"
				</c:if>
		    	/>
		    </div>
		    </div>
	    </div>
	    <div class="col-md-6">
		    <div class="row">
		    	<div class="list-group fill">
			      <div class="list-group-item">
			        <p class="list-group-item-text">Nome</p>
			        <h4 class="list-group-item-heading">${contato.nome}</h4>
			      </div>
			      <div class="list-group-item">
			        <p class="list-group-item-text">Telefone</p>
			        <h4 class="list-group-item-heading">${contato.telefone}</h4>
			      </div>
			      <div class="list-group-item">
			        <p class="list-group-item-text">Email</p>
			        <h4 class="list-group-item-heading">${contato.email}</h4>
			      </div>
			      <div class="list-group-item">
			        <p class="list-group-item-text">Endereço</p>
			        <h4 class="list-group-item-heading">${contato.endereco}</h4>
			      </div>
			    </div>
			</div>
	    </div>
	    <div class="col-md-3">
	    	</br>
		    <form:form id="MensagemForm" commandName="mensagem" servletRelativeAction="/mensagens/adicionar/contato=${contato.id}"  method="POST">    	
		   		<div class="form-group">
					<label for="assunto">Assunto *: </label>
					<form:input type="text" path="assunto" cssClass="form-control"/>
					<form:errors path="assunto" />
				</div>
				<div class="form-group">
					<label for="messagem">Mensagem *: </label>
					<form:textarea path="mensagem" cssClass="form-control"/>
					<form:errors path="mensagem" />
				</div>
		    	<div class="btn-group pull-right">
				  <button type="submit" class="btn btn-primary">
				  	<i class="fa fa-send"></i>
				  	Enviar Email
				  </button>
				</div>
		    </form:form>
	    </div>
	 </div>
	 </div>
  <div class="panel-footer">
    <small>Built with Bootcards - Base Card</small>
  </div>
</div>
<jsp:include page="base/footer.jsp" />
</body>
</html>