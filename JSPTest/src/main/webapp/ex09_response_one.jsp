<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	//페이지를 이동하는 수단
	//1. HTML
	// - <a href="">
	// - 사람이 직접 클릭
	
	//2. JavaScript
	// - location.href="";
	// - 프로그램에서 제어 가능
	
	//3. Servlet / JSP
	// - response.sendRedirect("")
	// - 프로그램 제어 가능
	
	
	//response.sendRedirect("ex09_response_two.jsp");

%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

</head>
<body>
	<!-- -->
	<div class="container">
		<h1 class="page-header">첫번째 페이지</h1>
	</div>
	

<script>

	location.href = 'ex09_response_two.jsp';


</script>

</body>
</html>



















