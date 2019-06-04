<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>���ǿ��� ��Ȳ</title>
<style>
@font-face{

	font-family:"GoodFont"; /*��Ʈ �йи� �̸� �߰�*/
	
	src:url("./resources/fonts/KBIZHanmaumMyungjo.ttf"); /*��Ʈ ���� �ּ�*/
	}
	.container{
		font-family:"GoodFont";
	}
</style>
</head>
<body>
<%@include file="nav.jsp"%>
<div class="container" style="margin-bottom: 290px;">
<h2>���ǿ��� ��Ȳ</h2><br>
<table class="table table table-striped table-bordered table-hover">
	<tr>
		<th class="text-center">��¥</th>
		<th class="text-center">��������</th>
		<th class="text-center">����</th>
		<th class="text-center">���</th>
	</tr>
	<c:choose>
	<c:when test="${reservationList == null}">
	</table>
			<h2>������ ����� �����ϴ�.</h2>
	</c:when>
	<c:otherwise>
	<c:forEach items="${reservationList}" var="reservation">
	<tr>
		<td class="text-center" style="vertical-align: middle;">${reservation.r_date}<br><a data-toggle="modal" href="#exampleModalLong">(�ڼ��� ����)</a></td>
		<td>
			<div>
			<c:choose>
			<c:when test="${reservation.r_name == 'standard'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R0000000GO0L_KR.jpg">
			</c:when>
			<c:when test="${reservation.r_name == 'deluxe'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000000TGX_KR.jpg">
			</c:when>
			<c:when test="${reservation.r_name == 'premier'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000008REF_KR.gif">
			</c:when>
			<c:when test="${reservation.r_name == 'terrace'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000000PL1_KR.jpg">
			</c:when>
			</c:choose>
				<a href="${reservation.r_name}.jsp"> ${reservation.r_name} room</a> �� ${reservation.r_people} �� ${reservation.r_price} ����
			</div>
		</td>
		<td class="text-center" style="vertical-align: middle;">
			����Ϸ�
		</td>
		<td class="text-center" style="vertical-align: middle;">
			<input type="button" class="btn btn-danger" value="�������">
		</td>
	</tr>

<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">���� ����</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <c:choose>
			<c:when test="${reservation.r_name == 'standard'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R0000000GO0L_KR.jpg">
			</c:when>
			<c:when test="${reservation.r_name == 'deluxe'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000000TGX_KR.jpg">
			</c:when>
			<c:when test="${reservation.r_name == 'premier'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000008REF_KR.gif">
			</c:when>
			<c:when test="${reservation.r_name == 'terrace'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000000PL1_KR.jpg">
			</c:when>
			</c:choose><br><br>
		<span class='glyphicon glyphicon-ok' aria-hidden='true'/> �� ���� : ${reservation.r_name} room<br><br>
        <span class='glyphicon glyphicon-ok' aria-hidden='true'/> ���� �Ⱓ : ${reservation.r_date}<br><br>
        <span class='glyphicon glyphicon-ok' aria-hidden='true'/> ���� �ο� : ${reservation.r_people}<br><h3>������ �� ${reservation.r_price }���� �Դϴ�.</h3><br><br>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">�ݱ�</button>
      </div>
    </div>
  </div>
</div>
	</c:forEach>
	</c:otherwise>
	</c:choose>
</table>
</div>
<%@include file="footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>
</body>
</html>