<%@page import="com.test.jsp.jdbc.DBUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//delok.jsp
	//찐으로 삭제하는 페이지

	//할일
	//1. 삭제될 글 번호 가져오기
	//2. DB -> delete
	//3. 페이지 이동하기 -> list.jsp

	//최종목적지
	String seq = request.getParameter("seq");

	Connection conn = null;
	Statement stat = null;

	int result = 1;

	try {

		conn = DBUtil.open();
		stat = conn.createStatement();

		String sql = "delete from tblAddress where seq =" + seq ;

		result  = stat.executeUpdate(sql);

	}catch (Exception e) {
		System.out.println(e);
	}

	if (result == 1){
		response.sendRedirect("list.jsp");
	} else {
		response.sendRedirect("del.jsp");
	}



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
		<h1 class="page-header"> </h1>
	</div>


<script>



</script>

</body>
</html>



















