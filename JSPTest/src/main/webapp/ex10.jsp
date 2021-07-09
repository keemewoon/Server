<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	int a = 10;

%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

</head>
<body>
	<!--ex10.jsp -->
	<div class="container">
		<h1 class="page-header">JSP 페이지 </h1>
	<div> a: <%= a %></div>
	
	<%= request.getRealPath(".") %>
	
	<!--
		아파치 톰캣은 웹사이트를 실행(운영)할때
		개발자가 만든 소스를 직접 사용하지 않는다.
		-> 반드시 복사본을 만들어서 사용한다.
		-> 그 복사본을 .metadata 이하에 저장해서 사용한다.
	
	  -->
	
	</div>
	
	

<script>



</script>

</body>
</html>



















