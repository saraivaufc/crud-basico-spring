<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Novo Usuário</title>
<jsp:include page="../base/header-estrutura.jsp" />
</head>
<body>
<jsp:include page="../base/header.jsp" />

<ol class="breadcrumb">
  <li><a href="/contatos/">Início</a></li>
  <li><a href="/contatos/usuario/cadastrar">Cadastrar</a></li>
</ol>
<div class="container-fluid">
	<div class="row">
		<h1 class="text-center">Novo Usuário</h1>
		<div class="col-md-8 col-md-offset-2">	
	    <form:form id="UsuarioForm" modelAttribute="usuario" servletRelativeAction="/usuario/registrar" enctype="multipart/form-data"  method="POST">
	    	<div class="form-group">
				<label for="nome">Nome *: </label>
				<form:input type="text" path="nome" cssClass="form-control" required="required"/>
			</div>
			<div class="form-group">
				<label for="nome">Email *: </label>
				<form:input type="text" path="email" cssClass="form-control" required="required"/>
			</div>
			<div class="form-group">
				<label for="nome">Login *: </label>
				<form:input type="text" path="login" cssClass="form-control" required="required"/>
			</div>
			<div class="form-group">
				<label for="nome">Senha *: </label>
				<form:input type="password" path="password" cssClass="form-control" required="required"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Cadastrar</button>
			</div>
	    </form:form>
	    </div>
	</div>
</div>

<jsp:include page="../base/footer.jsp" />
</body>
</html>