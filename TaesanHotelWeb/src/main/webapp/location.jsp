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
		background-color:white;
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
	
	</style>
</head>
<body>
	<video autoplay muted loop id="myVideo">
 		<source src="./resources/videos/Introduce.mp4" type="video/mp4">
	</video>
	
	
	<%@include file="./WEB-INF/nav.jsp" %>
	
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
			<div class="panel-heading" style="background-color:#e7e7e7; border-color:white">
				<h2 class="panel-title" style="color:black;">
					TSȣ�� ã�ƿ��ô±�
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
	<%@include file="./WEB-INF/footer.jsp" %>
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