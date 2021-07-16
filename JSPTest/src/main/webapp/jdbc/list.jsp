<%@page import="com.test.jsp.jdbc.DBUtil"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// 페이지 할일 !!
	// 1. DB -> select
	// 2. ResultSet
	// 3. 테이블에 <tr>추가


	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;

	try {

		conn = DBUtil.open();
		stat = conn.createStatement();

		String sql = "select * from tblAddress order by seq asc";

		rs = stat.executeQuery(sql);



		//여기서 닫으면 안된다.
		//rs.close();
		//stat.close();
		//conn.close();



	} catch (Exception e){
		System.out.println(e);
	}


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.container{width: 600px; }
	.table th:nth-child(1){ width: 60px; }
	.table th:nth-child(2){ width: 90px; }
	.table th:nth-child(3){ width: 60px; }
	.table th:nth-child(4){ width: 70px; }
	.table th:nth-child(5){ width: auto; }
	.table th, .table td{ text-align: center; vertical-align: middle; }
	.table td:nth-child(5) {text-align: left; }
</style>

<%@ include file="/inc/asset.jsp" %>

</head>
<body>

 	
	<!-- -->
	<div class="container">
		<h1 class="page-header"> Address book </h1>


	<table class="table table-bordered">
		<tr>

			<th>번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>주소</th>
		</tr>
		<% while (rs.next()) { %>
		<tr>
			<td> <%= rs.getString("seq") %></td>
			<td> <%= rs.getString("name") %></td>
			<td> <%= rs.getString("age") %></td>
			<td> <%= rs.getString("gender").equals("m") ? "남자" : "여자" %></td>
			<td>
				<%= rs.getString("address") %>
				<span class="glyphicon glyphicon-trash" onclick="del(<%= rs.getString("seq") %>);"></span>
				<span class="glyphicon glyphicon-edit" onclick="edit(<%= rs.getString("seq") %>);"></span>

			</td>

		</tr>
		<% } %>

		<% if(rs.getRow() == 0) { %>
		<tr>
			<td colspan = "5"> 데이터가 없습니다.</td>
		</tr>
		<% } %>


	</table>

	<div class="btns">
		<input type="button" value="추가하기" class="btn btn-default" onclick="location.href='add.jsp'">

	</div>
	</div>


<script>

	function del(seq) {
		//alert(seq);
		location.href = 'del.jsp?seq=' + seq;

	}



	function edit(seq) {

		location.href = 'edit.jsp?seq=' + seq;


	}


</script>

</body>
</html>


<%
	rs.close();
	stat.close();
	conn.close();
%>


















