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
	<h1>Ver Detalhes de ${contato.nome}</h1>
	
	Nome: ${contato.nome}</br>
	Email: ${contato.email}</br>
	TeleFone: ${contato.telefone}</br>
	<a href="/contatos/listar">Voltal ao Inicio</a>
</body>
<jsp:include page="base/footer.jsp" />
</html>