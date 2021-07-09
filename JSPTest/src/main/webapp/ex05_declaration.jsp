<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.test.jsp.Ex05"%>

<%! 
	public int sum(int a, int b){
		return a + b;
	}

%>
<%
	// 무슨 변수??
	// - 멤버 변수? 지역 변수?
	int a = 10;
 	int b = 20;
 	
 	Ex05 ex05 = new Ex05();

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>선언문</h1>
	
	<p>10 + 20 = 30 </p>
	<p><%= a %> + <%= b %> = <%= a+b %> </p>
	<p><%= a %> + <%= b %> = <%= sum(a,b) %> </p>
	<p><%= a %> + <%= b %> = <%= ex05.sum(a,b) %> </p>

</body>
</html>