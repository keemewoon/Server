<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

	.container {width: 600px;}
	.container .table th, .table hd {text-align:center;
									vertical-align:middle; }
	.table th { width: 120px; }
	.table td input[name=name] { width: 100px; }
	.table td input[name=age] { width: 80px; }
	.table td input[name=gender] { width: 80px; }


</style>

<%@ include file="/inc/asset.jsp" %>

</head>
<body>
	<div class="container">
		<h1 class="page-header"> Address book </h1>

		<!-- 무조건 POST를 쓰세요!!! -->
		<form method="POST" action="addok.jsp" >
			<table class="table table-bordered">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" class="form-control" autocomplete="off"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="number" name="age" min="19" max="" class="form-control" autocomplete="off"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="gender" class="form-control">
							<option value="m">남자</option>
							<option value="f">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" class="form-control" autocomplete="off"></td>
				</tr>




			</table>

			<div class="btns">
				<input type="submit" value="추가하기" class="btn btn-default">
				<input type="button" value="목록보기" class="btn btn-default"
								onclick="history.back();">
			</div>
		</form>

	</div>


<script>



</script>

</body>
</html>



















