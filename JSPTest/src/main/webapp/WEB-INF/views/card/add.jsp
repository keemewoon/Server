<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
   .container {
      width: 600px;
   }
</style>

<%@ include file="/inc/asset.jsp" %>

</head>
<body>
	<!-- -->
	<div class="container">
		<h1 class="page-header"> Business Card </h1>

		<form method = "POST" action="/jsp/card/addok.do">
			<table class="table table-bordered">
				<tr>
					<th>이름(한글)</th>
					<td><input type="text" name="korname" class="form-control" required></td>
				</tr>
				<tr>
					<th>이름(영문)</th>
					<td><input type="text" name="engname" class="form-control" required></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="tel" class="form-control" required></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" class="form-control" required></td>
				</tr>
				<tr>
					<th>회사</th>
					<td><input type="text" name="company" class="form-control" required></td>
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" name="position" class="form-control" required></td>
				</tr>
			</table>
			<div class="btns">
				<input type="submit" value="Register" class="btn btn-default">
				<input type="button" value="Cancle" class="btn btn-default"
					onclick="location.href='/jsp/card/list.do';">
			</div>

		</form>


	</div>


	<script>

	</script>

</body>
</html>





