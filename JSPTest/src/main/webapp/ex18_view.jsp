<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%
//디렉토리 목록 읽기
String path = application.getRealPath("/files");

File dir = new File(path);
File[] list = dir.listFiles();
%>
<!DOCTYPE html>
<html>
<head>


<script
  src="http://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>


<meta charset="UTF-8">
<title></title>

<%@ include file="/inc/asset.jsp"%>

<style>
.list {
	margin: 20px;
	display: flex;
	flex-wrap: wrap;
}

.list .item {
	width: 200px;
	height: 200px;
	border: 1px solid #AAA;
	border-radius: 5px;
	margin: 10px;
	background-repeat: no-repeat;
	background-position: center center;
	background-size: contain;
	cursor: pointer;
	/* background-color: #000; */
}

.img1 {
	display: block;
	margin: 30px auto;
}

</style>

</head>
<body>
	<!-- ex18_view.jsp -->
	<div class="container">
		<h1 class="page-header">Gallery</h1>

		<div class="list">

			<%
			for (File f : list) {
			%>
			<div class="item"
				 style="background-image:url(/jsp/files/<%=f.getName()%>);"
				 data-toggle="modal"
				 data-target="#myModal"
				 onclick="view('<%=f.getName()%>');"></div>
			<%
			}
			%>

		</div>

		<div class="btns">
			<input type="button" value="Add Image" class="btn btn-default"
				onclick="location.href='ex18_file_form.jsp';">
		</div>

	</div>



	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-body">
					<img class="img1">
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger btnDelete">Delete</button>
				</div>

			</div>
		</div>
	</div>



	<script>

		function view(img) {

			//alert(img);

			$('.img1').attr('src', '/jsp/files/' + img);

			/*
			setTimeout(function() {
				//alert($('.img1').width());

				if ($('.img1').width() > 800) {
					$('.img1').width(800);
				} else {
					$('.img1').width(-1);
				}

			}, 200);
			*/

		}


		$(".btnDelete").click(function() {

			//지금 보고 있는 이미지 파일명을 서버에 전송 -> 파일 삭제
			//alert($(".img1").attr('src'));

			let img = $(".img1").attr('src').replace('/jsp/files/', '');
			//alert(img);

			location.href = 'ex18_file_delete.jsp?img=' + img;

		});

	</script>
</body>
</html>















