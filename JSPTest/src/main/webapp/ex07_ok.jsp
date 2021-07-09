<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String txt1 = request.getParameter("txt1");
	
	String color1 = request.getParameter("color1");
	String color2 = request.getParameter("color2");
	
	String fontSize =  request.getParameter("fontSize");
	int btnEa =  Integer.parseInt(request.getParameter("btnEa"));
	
	String[] right = request.getParameterValues("right");
	String[] bottom = request.getParameterValues("bottom");
	
	
	

%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp" %>

<style>

	#tbl { margin: auto 0; }
	#tbl th, #tbl td { text-align: center; }
	#tbl td { padding: 50px; }
	
	#btns { 
				background-color: <%= color1 %>;
				color: <%= color2 %>;
				width: <%= width +"px" %>;
				height:<%= height +"px" %>;
				font-size: <%= fontSize + "px" %>;
				margin-right:<%= right + "px" %>;
				margin-bottom: <%= bottom + "px" %>
	 }
	 
	

	

</style>

</head>
<body>
	<!-- -->
	<div class="container">
		<h1 class="page-header">결과</h1>
	</div>
	
	<table id="tbl" class="table table-bordered">
	
	<tr>
		<th>버튼</th>
	
	</tr>
	<tr>
		
		<td>
		<% for(int i=0; i<btnEa; i++) { %>
			<input type="button" id="btns" value="<%= txt1 %>">
		<%} %>
		</td>
		
	
	</tr>
	
	
	</table>
	
	

<script>



</script>

</body>
</html>



















