<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    	<div class="text-center">
		    	<img class="img-responsive img-rounded" src="/contatos/${contato.relativePathImagem}"/>
		    </div>
	    </div>
	    <div class="col-md-9">
		    <div class="row">
		    	<div class="list-group">
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
	 </div>
	 </div>
  <div class="panel-footer">
    <small>Built with Bootcards - Base Card</small>
  </div>
</div>
<jsp:include page="base/footer.jsp" />
</body>
</html>