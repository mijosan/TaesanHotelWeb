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
	.jumbotron{
		/* background-image:url('./resources/images/chefs.jpg'); */
		background-size:cover;
		color:black;
	}
	#myVideo {
	  position: fixed;
	  right: 0;
	  bottom: 0;
	  min-width: 100%; 
	  min-height: 100%;
	}
	#jum{
		background-image:url('./resources/images/restaurant.jpg');
	}


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
	
	<!--//////////////////////////////////////////////////////////////////  -->
	<div class="container">
		<div class="jumbotron">
			<p class="text-center">��ģ �ϻ󿡼� ����������.</p>
			<p class="text-center">. . . . . . . . .</p>
			<h2 class="text-center">�ְ��� ȣ����<br>������ ���� ��ٸ��� �ֽ��ϴ�.</h2>
			<p class="text-center"> . . . . . . . . .</p>
			<p class="text-center">��ȸ���� ������ �ɰ̴ϴ�.</p>
			<br><br><br><br><br><br><br>

			<div class="jumbotron" id="jum" style="
    height: 496px;
">
				
			</div>
			
			<!-- <a href="login.do" class="btn btn-primary btn-lg" role="button">�α���</a><br><br><br>
			<a href="getBoardList.do" class="btn btn-primary btn-lg" role="button">�� ��� �ٷΰ���</a>
			<a href="dataTransform.do" class="btn btn-primary btn-lg" role="button">�� ��� ��ȯ ó��</a> -->
		<hr>
<!-- 		<div class="row">
			<div class="col-md-4">
				<h4>�ְ��� ����</h4>
				<p>�׻� ���Ӱ� ���ִ� �丮�� ����<br>���Ӿ��� ���� �����ϰ�<br>����մϴ�.</p>
				<p class="text-center"> . . . . . . . . .</p>
				<img src="images/chefs.jpg" id="imagepreview" style="width:256px; height:256px;">
				
				
			</div>
			<div class="col-md-4">
				<h4>�����ΰ� �Բ�...</h4>
				<p>���� ȣ���� ������ ���Բ�<br>�������� ����� �����ϰ� �ֽ��ϴ�.<br>����ϴ� ����� ��Ƽ�� ��ܺ�����.</p>
				<p class="text-center"> . . . . . . . . .</p>
				<img src="images/chefs.jpg" id="imagepreview" style="width:256px; height:256px;">
			</div>
			<div class="col-md-4">
				<h4>�ְ��� �߰�</h4>
				<p>�Ѱ��� ���̴� View�� ���� <br>Ŀ�� ������...</p>
				<p class="text-center"> . . . . . . . . .</p>
				<img src="images/chefs.jpg" id="imagepreview" style="width:256px; height:256px;">
			</div>
		</div> -->
		<div class="row">
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail" style="
    height: 770px;
">
		      <img src="./resources/images/chefs.jpg" alt="..." style="height: 500px;">
		      <div class="caption">
		        <h3>�ְ��� ����</h3>
		        <p>�׻� ���Ӱ� ���ִ� �丮�� ����<br>���Ӿ��� ���� �����ϰ�<br>����մϴ�.</p>
		      </div>
		    </div>
		  </div>
		   <div class="col-sm-6 col-md-4">
		    <div class="thumbnail" style="
    height: 770px;
">
		      <img src="./resources/images/champagne.jpg" alt="..." style="height: 500px;">
		      <div class="caption">
		        <h3>�����ΰ� �Բ�...</h3>
		        <p>���� ȣ���� ������ ���Բ�<br>�������� ����� �����ϰ� �ֽ��ϴ�.<br>����ϴ� ����� ��Ƽ�� ��ܺ�����.</p>
		      </div>
		    </div>
		  </div>
		   <div class="col-sm-6 col-md-4">
		    <div class="thumbnail" style="
    height: 770px;
">
		      <img src="./resources/images/coffee.jpg" alt="..." style="height: 500px;">
		      <div class="caption">
		        <h3>�ְ��� �߰�</h3>
		        <p>�Ѱ��� ���̴� View�� ���� <br>Ŀ�� ������...</p>
		        
		      </div>
		    </div>
		  </div>
		</div>
		</div>
		<hr>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title"><span class="glyphicon glyphicon-hand-right"></span>
					&nbsp;&nbsp;about TSȣ��
				</h3>
			</div>
			<div class="panel-body">
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="media-object" src="./resources/images/use.jpg" alt="�̿�ȳ�"></a>
					</div>
					
					<div class="media-body">
						<h2 class="media-heading"><a href="introduce.jsp?lectureName=C">&nbsp;&nbsp;�̿�ȳ�</a>&nbsp;<span class="label label-primary">INFO</span> </h4>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TSȣ���� 100%���� ���
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="media-object" src="./resources/images/reservation.jpg" alt="����"></a>
					</div>
					<div class="media-body">
						<h2 class="media-heading"><a href="lecture.jsp?lectureName=Java">&nbsp;&nbsp;���ǿ���</a>&nbsp;<span class="label label-danger">HOT</span> </h4>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ְ��� TSȣ�� ���ǿ��� �Ϸ�����
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="media-object" src="./resources/images/staff.jpg" alt="������"></a>
					
					</div>
					<div class="media-body">
						<h2 class="media-heading"><a href="lecture.jsp?lectureName=Android">&nbsp;&nbsp;������</a>&nbsp;<span class="label label-info">HELP</span> </h4>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TSȣ���� �����ڿ��� �����ϱ�
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	
	<!--////////////////////////////////////////////////////////////////////  -->
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