<%@page import="com.test.jsp.User"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	

%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

</head>
<body>
	<!-- ex15_el.jsp -->
	<div class="container">
		<h1 class="page-header"> EL </h1>
		
		
		<!--
		
			액션 태그 + EL
			-> 목적: JSP 페이지에서 자바 구문을 사용하지 말자!!!
			
			EL, Expression Language
			- 표현식 언어
			- 자바의 표현식과 다름
			- 내장 객체(pageContext, request, session, application)에 들어있는 데이터를 HTML 소스에 출력하는 언어
			- <!-- ${a} -->
		
		 
		 <%
		 	//평범한 지역변수
		 	int a = 10;
		 
		 	//내장 객체 변수
		 	pageContext.setAttribute("b", 20);
		 	request.setAttribute("c", 30);
		 	session.setAttribute("d", 40);
		 	application.setAttribute("e", 50);
		 
		 %>
		 <h2>표현식</h2>
		 <div>평범한 지역변수 a : <%= a %></div>
		 <div>내장 객체 변수 b : <%= pageContext.getAttribute("b")%></div>
		 
		 <h2>EL</h2>
		 <div>a: ${a}</div><!--  JSP -->
		 <%-- <div>b: ${pageContext.getAttribute("b")}</div> --%>
		 <div>b: ${b}</div>
		 <div>c: ${c}</div>
		 <div>d: ${d}</div>
		 <div>e: ${e}</div>
		 
		 <hr>
		 
		 <%
		 	int num1 = 10;
		 
		 	pageContext.setAttribute("num2", 10);
		 %>
		 <h2>EL로 할 수 있는 일들(연산)</h2>
		 
		 <div>num1 + 10 = <%= num1  + 10 %></div>
		 <%-- <div>num2 + 10 = <%= (int)pageContext.getAttributesScope("num2") + 10 %></div> --%>
		 <div>num2 + 10 = ${num2} + 10</div>
		 
		 <hr>
		 
		 //EL연산
		 <div>num2 + 10 = ${num2 + 10}</div>
		 <div>num2 - 10 = ${num2 - 10}</div>
		 <div>num2 * 10 = ${num2 * 10}</div>
		 <div>num2 / 10 = ${num2 / 10}</div>
		 <div>num2 % 10 = ${num2 % 10}</div>
		 <div>num2 mod 10 = ${num2 mod 10}</div>
		 <hr>
		 
		 <div>num2 > 0 = ${num2 > 0 }</div>
		 <div>num2 >= 0 = ${num2 >= 0 }</div>
		 <div>num2 < 0 = ${num2 < 0 }</div>
		 <div>num2 <= 0 = ${num2 <= 0 }</div>
		 <div>num2 == 0 = ${num2 == 0 }</div>
		 <div>num2 != 0 = ${num2 != 0 }</div>
		 <hr>
		 
		 <div>${true && true}</div>
		 <div>${true && false}</div>
		 <div>${true || true}</div>
		 <div>${true || false}</div>
		 <hr>
		 
		 <div>num2 = ${num2 > 0 ? "양수":"음수"}</div>
		 <div>${"홍길동" == "홍길동" }</div>  <!-- 사용하지 마세요 -->
		<%--  <div>${"홍길동".equals("홍길동") }</div>  <!-- 권장 --> --%>
		<hr>
		
		<h2>HashMap 출력 지원</h2>
		
		<%
			HashMap<String, String> map = new HashMap<String,String>();
			map.put("name", "홍길동");
			map.put("age", "20");
			map.put("job", "학생");
			map.put("phone-number", "010-2222-1111");
			
			/* //EL로 하는법 */
			pageContext.setAttribute("map", map);
			
		%>
		<div>이름: <%=map.get("name") %></div>
		<div>나이: <%= Integer.parseInt(map.get("age")) -1  %></div>
		<div>직업: <%=map.get("job") %></div>
		
		<hr>
		
		<div>이름:  ${map.name}</div>
		<div>이름:  ${map["name"]}</div>
		
		<div>나이:  ${map.age -1}</div>
		<div>직업:  ${map.job}</div>
		<div>전화:  ${map["phone-number"]}</div>
		
		
		<h2>Java Object 출력 지원</h2>
		
		<%
			User hong = new User();
		
			hong.setfullname("홍길동");
			hong.setNick("멍멍이");
			hong.setInfo("술을 주지 마시오.");
			
			pageContext.setAttribute("hong", hong);
		
		%>
		
		<%-- <div>이름: <%=hong.getName() %></div> --%>
		<div>별명: <%=hong.getNick() %></div>
		<div>정보: <%=hong.getInfo() %></div>
		<hr>
		<div>이름: ${hong.getFullname()}</div>
		
		<div>이름: ${hong.fullname}</div>
		 <!-- 프로퍼티 fullname을 찾을 수 없다. 
		 		-> User 클래스에서 getFullname() 메소드를 찾을 수 없다.
		  -->
		 <div>이름: ${hong.fullname }</div>
		 <div>별명: ${hong.nick }</div>
		 <div>정보: ${hong.info }</div>
		 <hr>
		 
		 <!-- color 존재하지 않는아이 null -->
		 <h2>empty 연산자(나중에 조건문으로 씀)</h2>
		 <div>color = ${color}</div>
		 <div>color = ${empty color}</div>   <!-- color = true -->
		 <div>hong = ${empty hong }</div>  <!-- hong = false  -->
		
		
	</div>
	

<script>

	let name = '홍길동';
	let str = `안녕하세요. ${name}입니다.`; //template string :자바스크립트 구문 이해
	
	$("#div").css('color','red');

	

</script>

</body>
</html>



















