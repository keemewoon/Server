<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//삭제하기전에 한번 거쳐가는 페이지
	//delok에게 전달할 번호..(쪽지 전달)
	String seq = request.getParameter("seq");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

	.container { width: 600px; }

</style>

<%@ include file="/inc/asset.jsp" %>

</head>
<body>
	<!-- del.jsp -->
	<div class="container">
		<h1 class="page-header"> Address book </h1>


		<div class="confirm">
		<div class="alert alert-danger"> 정말 삭제하시겠습니까?</div>
			<input type="button" value="삭제하기" class="btn btn-default"
				onclick = "location.href='delok.jsp?seq=<%= seq%>';">
			<input type="button" value="목록보기" class="btn btn-default"
				onclick = "location.href='list.jsp';">
		</div>



	</div>


<script>



</script>

</body>
</html>



















