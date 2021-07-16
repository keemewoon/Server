<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

</style>

<%@ include file="/inc/asset.jsp" %>

</head>
<body>
	<!-- delok.jsp -->
	<div class="container">
		<h1 class="page-header">DelOk</h1>


	</div>

	<script>
		<c:if test="${result == 1}">
			location.href = '/jsp/list.do';
		</c:if>

		<c:if test="${result != 1}">
			history.back();
		</c:if>
	</script>


</body>
</html>



















