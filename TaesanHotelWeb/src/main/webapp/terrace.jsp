<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>���ǿ���</title>
<style>
	#thumbnail-preview-indicators {
  position: relative;
  overflow: hidden;
}
#thumbnail-preview-indicators .slides .slide-1, 
#thumbnail-preview-indicators .slides .slide-2,
#thumbnail-preview-indicators .slides .slide-3, 
#thumbnail-preview-indicators .slides .slide-4,
#thumbnail-preview-indicators .slides .slide-5{
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
}
    #thumbnail-preview-indicators,
    #thumbnail-preview-indicators .slides,
    #thumbnail-preview-indicators .slides .slide-1, 
    #thumbnail-preview-indicators .slides .slide-2,
    #thumbnail-preview-indicators .slides .slide-3,
    #thumbnail-preview-indicators .slides .slide-4,
    #thumbnail-preview-indicators .slides .slide-5 {
      height: 480px;
    }
#thumbnail-preview-indicators .slides .slide-1 {
  background-image: url(http://www.shilla.net/images/contents/accmo/TE/R00000001JNP_KR.jpg); 
}
#thumbnail-preview-indicators .slides .slide-2 {
  background-image: url(http://www.shilla.net/images/contents/accmo/TE/R00000001JNP_KR.jpg);
}
#thumbnail-preview-indicators .slides .slide-3 {
  background-image: url(http://www.shilla.net/images/contents/accmo/TE/R00000001JNU_KR.jpg);
}
#thumbnail-preview-indicators .slides .slide-4 {
  background-image: url(http://www.shilla.net/images/contents/accmo/TE/R00000001JNZ_KR.jpg);
}
#thumbnail-preview-indicators .slides .slide-5 {
  background-image: url(http://www.shilla.net/images/contents/accmo/TE/R00000001JO4_KR.jpg);
}
#thumbnail-preview-indicators .carousel-inner .item .carousel-caption {
  top: 20%;
  bottom: inherit;
}
#thumbnail-preview-indicators .carousel-indicators li,
#thumbnail-preview-indicators .carousel-indicators li.active {
  position: relative;
  width: 100px;
  height: 8px;  
}
#thumbnail-preview-indicators .carousel-indicators li > .thumbnail {
  position: absolute;
  top: 0;
  width: 100px;
  display: none;
  opacity: 0;
  left: 50%;
  margin-top: -80px;
  margin-left: -50px;
}
#thumbnail-preview-indicators .carousel-indicators li:hover > .thumbnail,
#thumbnail-preview-indicators .carousel-indicators li.active > .thumbnail {
  display: block;
  opacity: .8;
}
#thumbnail-preview-indicators .carousel-indicators li.active > .thumbnail:hover{
  opacity: 1;
}
@media screen and (max-width : 480px) {    
    #thumbnail-preview-indicators .carousel-indicators li,
    #thumbnail-preview-indicators .carousel-indicators li.active {
      width: 50px;
      height: 8px;
      position: relative;
    }
    #thumbnail-preview-indicators .carousel-indicators li > .thumbnail {
       width: 50px;
       left: 50%;
       margin-top: -50px;
       margin-left: -25px;
    }
}
@font-face{

	font-family:"GoodFont2"; /*��Ʈ �йи� �̸� �߰�*/
	
		src:url("./resources/fonts/NANUMPEN.TTF");
	}
.fontClass{
	font-family:"GoodFont2";
}
</style>
</head>
<body>
<%@include file="./WEB-INF/nav.jsp" %>
<div class="container">
<span class="fontClass">
<h1>Terrace Room</h1>
	<div id="thumbnail-preview-indicators" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#thumbnail-preview-indicators" data-slide-to="0" class="active">
              <div class="thumbnail">
                <img class="img-responsive" src="http://www.shilla.net/images/contents/accmo/TE/R00000001JNP_KR.jpg">
              </div>
            </li>
            <li data-target="#thumbnail-preview-indicators" data-slide-to="1">
            <div class="thumbnail">
                <img class="img-responsive" src="http://www.shilla.net/images/contents/accmo/TE/R00000001JNP_KR.jpg">
              </div>
            </li>
            <li data-target="#thumbnail-preview-indicators" data-slide-to="2">
            <div class="thumbnail">
                <img class="img-responsive" src="http://www.shilla.net/images/contents/accmo/TE/R00000001JNU_KR.jpg">
              </div>
            </li>
            <li data-target="#thumbnail-preview-indicators" data-slide-to="3">
            <div class="thumbnail">
                <img class="img-responsive" src="http://www.shilla.net/images/contents/accmo/TE/R00000001JNZ_KR.jpg">
              </div>
            </li>
            <li data-target="#thumbnail-preview-indicators" data-slide-to="4">
            <div class="thumbnail">
                <img class="img-responsive" src="http://www.shilla.net/images/contents/accmo/TE/R00000001JO4_KR.jpg">
              </div>
            </li>
          </ol>
          <div class="carousel-inner">
            <div class="item slides active">
              <div class="slide-1"></div>
              <div class="container">
                <div class="carousel-caption">
                  <h1>���� �ѿ��� �˳����� �״�� �츰 �׶� ��</h1>
                  <p>Responsive thumbnail preview in carousel indicators.</p>
                  <p><a class="btn btn-lg btn-primary" href="reservation.jsp?room=terrace" role="button">�����ϱ�</a></p>
                </div>
              </div>
            </div>
            <div class="item slides">
              <div class="slide-2"></div>
              <div class="container">
                <div class="carousel-caption">
                  <h1>��ǳ������ Ź�ڿ� �Բ�</h1>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                  <p><a class="btn btn-lg btn-primary" href="reservation.jsp?room=terrace" role="button">�����ϱ�</a></p>
                </div>
              </div>
            </div>
            <div class="item slides">
              <div class="slide-3"></div>
              <div class="container">
                <div class="carousel-caption">
                  <h1>ǰ���ִ� ������ �θ�Բ�</h1>
                  <p>Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                  <p><a class="btn btn-lg btn-primary" href="reservation.jsp?room=terrace" role="button">�����ϱ�</a></p>
                </div>
              </div>
            </div>
            <div class="item slides">
              <div class="slide-4"></div>
              <div class="container">
                <div class="carousel-caption">
                  <h1>û������ �ְ�� ����� ��ġ</h1>
                  <p>Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                  <p><a class="btn btn-lg btn-primary" href="reservation.jsp?room=terrace" role="button">�����ϱ�</a></p>
                </div>
              </div>
            </div>
            <div class="item slides">
              <div class="slide-5"></div>
              <div class="container">
                <div class="carousel-caption">
                  <h1>One more for good measure.</h1>
                  <p>Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                  <p><a class="btn btn-lg btn-primary" href="reservation.jsp?room=terrace" role="button">�����ϱ�</a></p>
                </div>
              </div>
            </div>
          </div>
          <a class="left carousel-control" href="#thumbnail-preview-indicators" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
          <a class="right carousel-control" href="#thumbnail-preview-indicators" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
      </div>
      </div>
</span>     
<br><br><br><br>
<%@include file="./WEB-INF/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>

</body>
</html>