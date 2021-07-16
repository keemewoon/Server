<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.test.jsp.jdbc.DBUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//할일
	//1. 데이터 가져오기(request.getParameter())
	//2. DB 작업 -> insert
	//3. 페이지 이동하기 -> todo_list.jsp



	//1. 데이터 가져오기

	//현재시간
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat now = new SimpleDateFormat("yyyy-MM-dd");
	String nowday = now.format(cal.getTime());


	request.setCharacterEncoding("UTF-8");
	String todo =  request.getParameter("todo");
	String complete = "0";
	String regdate = nowday;

	//System.out.println(regdate);

	//2. DB->insert 실행
	Connection conn = null;
	PreparedStatement stat = null;

	int result = 1;


	//3. DB insert 실행
	try {

		String sql = "insert into tblTodo(seq, todo, complete, regdate) values(seqTodo.nextVal, ?, ?, ?)";

		System.out.println(sql);

		conn = DBUtil.open();
		stat = conn.prepareStatement(sql);


		stat.setString(1, todo);
		stat.setString(2, complete);
		stat.setString(3, regdate);

		System.out.println(stat.executeUpdate());


	}catch (Exception e) {
		System.out.println(e);
	}

	//4. 페이지 이동
	if(result == 1 ) {
		response.sendRedirect("todo_list.jsp");
	} else {
		response.sendRedirect("todo_add.jsp");
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

<style>

</style>

</head>
<body>
	<!-- todo_addok.jsp -->

</body>
</html>















