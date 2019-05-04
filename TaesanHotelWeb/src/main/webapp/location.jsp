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
	#myBtn {
  display: none; /* Hidden by default */
  position: fixed; /* Fixed/sticky position */
  bottom: 20px; /* Place the button at the bottom of the page */
  right: 30px; /* Place the button 30px from the right */
  z-index: 99; /* Make sure it does not overlap */
  border: none; /* Remove borders */
  outline: none; /* Remove outline */
  background-color: red; /* Set a background color */
  color: white; /* Text color */
  cursor: pointer; /* Add a mouse pointer on hover */
  padding: 15px; /* Some padding */
  border-radius: 10px; /* Rounded corners */
  font-size: 18px; /* Increase font size */
}
#myBtn:hover {
		  background-color: #555; /* Add a dark-grey background on hover */
		}
	/*hover ���*/
	.scale {
	  transform: scale(1);
	  -webkit-transform: scale(1);
	  -moz-transform: scale(1);
	  -ms-transform: scale(1);
	  -o-transform: scale(1);
	  transition: all 0.3s ease-in-out;   /* �ε巯�� ����� ���� �߰�*/
	}
	.scale:hover {
	  transform: scale(1.2);
	  -webkit-transform: scale(1.2);
	  -moz-transform: scale(1.2);
	  -ms-transform: scale(1.2);
	  -o-transform: scale(1.2);
	}


/*//////////////////////////////////////////////  */

	.jumbotron{
		background-color:white;
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
		/* background-image:url('./resources/images/background.jpg'); */
		background-color:white;
	}
	@font-face{

	font-family:"GoodFont"; /*��Ʈ �йи� �̸� �߰�*/
	
	src:url("./resources/fonts/KBIZHanmaumMyungjo.ttf"); /*��Ʈ ���� �ּ�*/
	}
	
	@font-face{

	font-family:"GoodFont2"; /*��Ʈ �йи� �̸� �߰�*/
	
		src:url("./resources/fonts/NANUMPEN.TTF");
	}

	body{
		font-family:"GoodFont";
		background-color:#e7e2f5;
	}
	footer{
		background-color:#e7e2f5;
	}
	h1{
		font-family:"GoodFont2";
	}
	#myVideo {
  position: fixed;
  right: 0;
  bottom: 0;
  min-width: 100%; 
  min-height: 100%;
  z-index:-5;
}
	/*navbar  */
	.navbar-default .navbar-brand:hover,
	.navbar-default .navbar-brand:focus{
		color:black;
		font-size:25px;
	}
	.navbar-default .navbar-nav > li > a:hover,
	.navbar-default .navbar-nav > li > a:focus{
		color:black;
		font-size:20px;
	}

	
	
	.navbar-default .navbar-nav > .active > a,
	.navbar-default .navbar-nav > .active > a:hover,
	.navbar-default .navbar-nav > .active > a:focus{
		color:black;
		background-color:black;
	}
	.redcolor{
		color:#FF6347;
	}
	</style>
</head>
<body>
	<video autoplay muted loop id="myVideo">
 		<source src="./resources/videos/Introduce.mp4" type="video/mp4">
	</video>
	
	
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
					<li><a href="location.jsp">��ġ<span class="sr-only"></span></a></li>
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
			<h2 class="text-center">KOREA TS HOTEL</h2>
			<p class="text-center" style="color:#FF6347; font-size:5em">. . . . . . . . .</p>
			<br><br>
			<h1 class="text-center">�ְ��� TSȣ�� ��ġ�ȳ�</h1>
			<p class="text-center" style="color:#FF6347; font-size:5em">. . . . . . . . .</p>
			<br><br>
			<br><hr><br>
			<!--īī�� ����api-->
			<div id="map" style="width:100%;height:350px;"></div>
			
			<!--printBtn-->
			<h3 class="text-left">�λ걤���� �ؿ�뱸 ����0�� 00(�쵿) (��. �λ걤���� �ؿ�뱸 ��0�� 0000) <img src="./resources/images/printBtn.jpg" style="padding-left: 131px;"onclick="window.print();"></h3>
			
			<!--īī�� ����api -->

		<hr>
					<div class="panel panel-primary" style="border-color:white">
			<div class="panel-heading" style="background-color:#e7e2f5; border-color:white">
				<h2 class="panel-title" style="color:black;"><span class="glyphicon glyphicon-hand-right" ></span>
					&nbsp;&nbsp;TSȣ�� ã�ƿ��ô±�
				</h2>
			</div>
			<div class="panel-body">
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="scale" src="./resources/images/airplane.jpg" alt="�����"></a>
					</div>
					
					<div class="media-body">
						<h2 class="media-heading">&nbsp;&nbsp;&nbsp;�װ���&nbsp;</h4>
						<br><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� ���׿��� 30~40�� �ҿ�(���� ������ ����), �ؿ�뼾��ȣ�� �� ����</h4>
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="scale" src="./resources/images/train.jpg" alt="ö����"></a>
					</div>
					<div class="media-body">
						<h2 class="media-heading">&nbsp;&nbsp;&nbsp;ö����&nbsp;</h4>
						<br><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� �� �λ�(2�ð� 30�� �ҿ�)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�λ꿪���� ����ö �̿� �� �� 30�� �ҿ�<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1ȣ�� - 2ȣ�� : ���鿪 ȯ�� - ���ҽ�Ƽ�� ���� - 3�� �ⱸ)</h4>
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="scale" src="./resources/images/highway.jpg" alt="��ӵ���"></a>
					
					</div>
					<div class="media-body">
						<h2 class="media-heading">&nbsp;&nbsp;&nbsp;��ӵ���&nbsp;</h4>
						<br><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) ���� �� ���� IC(5�ð� 20�� �ҿ�) �� BEXCO(20�� �ҿ�)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) ����, â�� �� ����������(40�� �ҿ�) ��BEXCO(50�� �ҿ�)</h4>
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="scale" src="./resources/images/bus.jpg" alt="bus"></a>
					
					</div>
					<div class="media-body">
						<h2 class="media-heading">&nbsp;&nbsp;&nbsp;�ó�����&nbsp;</h4>
						<br><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ö 2ȣ�� ���ҽ�Ƽ��(3�� �ⱸ �� �ǹ�/������ ������ ����)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���߹��� : 5-1, 39, 40, 63, 115, 141, 155, 181, 307, 1001, 1002, 1007, 139</h4>
						
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	
	
	<!--////////////////////////////////////////////////////////////////////  -->
<br>
	<footer>
		<div class="container">
			<div class="col-sm-8" style="text-align: center;"><h4>Taesan Hotel �λ� �ؿ�뱸 00��  (�쵿, ������ TSȣ��) 48060 �ݼ��� 051-000-0000<br><br>Copyright �� Choi Tasean. All Rights Reserved.</h4></div>
			<div class="col-sm-0"></div>
			<div class="col-sm-2"><h4 style="text-align:center;">�ٷΰ���</h4>
				<div class="list-group">
					<a href="location.jsp" class="list-group-item">��ġ</a>
					<a href="introduce.jsp" class="list-group-item">�̿�ȳ�</a>
					<a href="lecture.jsp" class="list-group-item">���ǿ���</a>
					<a href="lecture.jsp" class="list-group-item">������</a>
				</div>
			</div>
			<div class="col-sm-2"><h4 style="text-align:center;">SNS</h4>
				<div class="list-group">
					<a href="https://www.facebook.com" class="list-group-item">���̽���</a>
					<a href="https://www.youtube.com" class="list-group-item">��Ʃ��</a>
					<a href="https://blog.naver.com/mijosan" class="list-group-item">���̹�</a>
				</div>
			</div>
			<!-- <div class="col-sm-2"><h4 style="text-align:center;"><span class="glyphicon glyphicon-ok"></span>&nbsp;by ���»�</h4></div> -->
		</div>
	</footer>
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85a19cc21df636f17e4769c1205abe68"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };

var map = new daum.maps.Map(mapContainer, mapOption);

// ��Ŀ�� ǥ�õ� ��ġ�Դϴ� 
var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

// ��Ŀ�� �����մϴ�
var marker = new daum.maps.Marker({
    position: markerPosition
});

// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
marker.setMap(map);

var iwContent = '<div style="padding:5px;">KOREA TSȣ�� <br><a href="http://map.daum.net/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">ū��������</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">��ã��</a></div>', // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
    iwPosition = new daum.maps.LatLng(33.450701, 126.570667);


var infowindow = new daum.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
 
// ��Ŀ ���� ���������츦 ǥ���մϴ�. �ι�° �Ķ������ marker�� �־����� ������ ���� ���� ǥ�õ˴ϴ�
infowindow.open(map, marker);
</script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script>
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

	function scrollFunction() {
	  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	    document.getElementById("myBtn").style.display = "block";
	  } else {
	    document.getElementById("myBtn").style.display = "none";
	  }
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	  document.body.scrollTop = 0; // For Safari
	  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
	}
	</script>
</body>
</html>