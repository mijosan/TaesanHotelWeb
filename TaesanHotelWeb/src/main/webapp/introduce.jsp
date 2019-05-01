<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>Main Page</title>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<!-- <link rel="stylesheet" href="./resources/css/codingBooster.css"> -->

<style type="text/css">

	</style>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">TSȣ��</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">�Ұ�<span class="sr-only"></span></a></li>
					<li><a href="introduce.jsp">�̿�ȳ�</a></li>
					<li><a href="instructor.jsp">���ǿ���</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">������<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="lecture.jsp?lectureName=C">���ǰԽ���</a></li>
					</ul>
					</li>
				</ul>
				<!-- <form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="������ �Է��ϼ���">
					</div>
					<button type="submit" class="btn btn-default">�˻�</button>
				</form> -->
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">�����ϱ�<span class="caret"></span></a>
						<ul class="dropdown-menu">
						<li><a href="loginForm.jsp">�α���</a></li>
						<li><a href="registerForm.jsp">ȸ������</a></li>
					</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<footer style="background-color:white; color: black">
		<div class="container">
			<br>
			<div class="col-sm-4" style="text-align: center;"><h5>Copyright �� Choi Tasean. All Rights Reserved.</h5></div>
			<div class="col-sm-4"></div>
			<div class="col-sm-2"><h4 style="text-align:center;">�ٷΰ���</h4>
				<div class="list-group">
					<a href="index.jsp" class="list-group-item">�Ұ�</a>
					<a href="introduce.jsp" class="list-group-item">�̿�ȳ�</a>
					<a href="lecture.jsp" class="list-group-item">���ǿ���</a>
					<a href="lecture.jsp" class="list-group-item">������</a>
				</div>
			</div>
			<div class="col-sm-2"><h4 style="text-align:center;">SNS</h4>
				<div class="list-group">
					<a href="https://www.facebook.com" class="list-group-item">���̽���</a>
					<a href="https://www.youtube.com" class="list-group-item">��Ʃ��</a>
					<a href="https://www.naver.com" class="list-group-item">���̹�</a>
				</div>
			</div>
			<!-- <div class="col-sm-2"><h4 style="text-align:center;"><span class="glyphicon glyphicon-ok"></span>&nbsp;by ���»�</h4></div> -->
		</div>
	</footer>
	
	<!--modal-->
	<!-- <div class="row">
		<div class="modal" id="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						�ְ��� ����
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align; center;">
						���Ӿ��� ���� �����ϰ�<br>
						����մϴ�.<br>
						<img src="images/chefs.jpg" id="imagepreview" style="width:256px; height:256px;">
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
</body>
</html>