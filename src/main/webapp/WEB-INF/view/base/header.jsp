<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand"  href="/contatos/listar">Gerenciador de Contatos</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="/contatos/listar">Início <span class="sr-only">(current)</span></a></li>
      </ul>
      
      <div class="col-sm-3 col-md-3"> 	
	      <form:form id="BuscarForm" commandName="buscar" servletRelativeAction="/buscar" method="POST" cssClass="navbar-form">
			 <div class="input-group">
				<input type="text" class="form-control" placeholder="Buscar..." name="nome" required/>
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
				</div>
			</div>
		  </form:form>
	 </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>