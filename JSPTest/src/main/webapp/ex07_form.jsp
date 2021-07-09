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

<style>
	.btns { margin: 10px; }
	.table { width: 700px; margin: 10px;}
	.number { width: 150px; }
	.txt { width: 300px; }
	

</style>

</head>
<body>
	<!-- -->
	<div class="container">
		<h1 class="page-header">버튼만들기</h1>
	</div>
	
	<form method="GET" action="ex07_ok.jsp">
	
		<table class="table table-bordered">
			<tr>
				<th>너비(px)</th>
				<td><input type="number" name="width" class="form-control number" size="5"></td>
			</tr>
			<tr>
				<th>높이(px)</th>
				<td><input type="number" name="height" class="form-control number"></td>
			</tr>
			<tr>
				<th>텍스트</th>
				<td><input type="text" name="txt1" class="form-control txt"></td>
			</tr>
			<tr>
				<th>배경색</th>
				<td><input type="color" name="color1" value="#FFFFF" ></td>
			</tr>
			<tr>
				<th>글자색</th>
				<td><input type="color" name="color2" value="#000" ></td>
			</tr>
			<tr>
				<th>글자크기(px)</th>
				<td><input type="number" name="fontSize" class="form-control number"  min="10" max="100" value="16" ></td>
			</tr>
			<tr>
				<th>버튼개수(ea)</th>
				<td><input type="number" name="btnEa" class="form-control number"  min="1" max="30" value="1" ></td>
			</tr>
			<tr>
				<th>버튼간격</th>
				<td>좌우간격: <input type="range" name="right" min="0" max="50" value="0"><br>
				상하간격: <input type="range" name="bottom" min="0" max="50" value="0"></td>
			</tr>
		
			
		
			
		</table>
		
		<div class = "btns">
			<input type="submit" value="만들기" class="btn btn-default">
		</div>
		
	</form>
	
	

<script>



</script>

</body>
</html>



















