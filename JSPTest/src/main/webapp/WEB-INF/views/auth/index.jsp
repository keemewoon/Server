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
	<!-- -->
	<div class="container">
		<h1 class="page-header"> 웹 보안 </h1>

		<!-- 로그인 성공하지 않은 사람 -->
		<c:if test="${empty id}">
			<button type="button" class="btn btn-default"
			onclick="location.href='/jsp/auth/login.do';">로그인</button>
		</c:if>

		<!-- 로그인 성공한 사람 -->
		<c:if test="${not empty id}">

			<!--  로그인한 사람의 정보를 보여줌 -->
			<div class = "panel panel-default" style="width: 300px">
				<div class="panel-heading">
					회원 정보
				</div>
				<div class="panel-body">
					<div>ID: ${id}</div>
					<div>이름: ${name}</div>
					<div>등급: ${lv}</div>
					<div>가입일: ${regdate}</div>
				</div>

			</div>

			<button type="button" class="btn btn-default"
			onclick="location.href='/jsp/auth/logoutok.do';">로그아웃</button>
		</c:if>


		<hr>

		<!--

			회원 전용 페이지 조작
			1. 인증 받지 못한 사용자에게 안보이게 감춘다.
			2. 항상 보여주되.. 처리를 다르게 한다.

		 -->

		<!-- 1. 로그인을 한사람 (보안에 좋다.)-->
		<c:if test="${not empty id}">
			<button type="button" class="btn btn-default"
				onclick="location.href='/jsp/auth/member.do';">회원 전용 페이지</button>
		</c:if>


		<hr>


		<c:if test="${not empty id && lv == 3}">
			<button type="button" class="btn btn-default"
				onclick="location.href='/jsp/auth/admin.do';">관리자 전용 페이지</button>
		</c:if>


	</div>


	<script>



	</script>

</body>
</html>





