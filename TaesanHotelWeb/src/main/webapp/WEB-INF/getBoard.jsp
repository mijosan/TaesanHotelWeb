<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>${board.title}</title>
	<style>
		.co{
			color:blue;
		}
	</style>
</head>
<body>
<%@include file="nav.jsp" %>
<form id="insertBoardFrm" action="updateBoard.do" method="post" enctype="multipart/form-data"> <!--update.do ���� MultipartFile�� �������� �̷��� ����������Ѵ�.-->
	<div class="container">
		<table class="table table-hover" style="margin-bottom: 430px;">
			<tr>
				<th colspan="2">
					${board.title }
				</th>
			</tr>
			<tr>
				<td>
					${board.writer} ��${board.regDate }
				</td>
				<td class="text-right">
					��ȸ ${board.cnt} �� ��� 208
				</td>
			</tr>
			<tr>
				<td colspan="2">
					${board.content}
				</td>
			</tr>
			<tr>
				<td>
					÷������
				</td>
				<td class="text-right">
					<a href="download.do?originalFileName=${board.originalFileName}">${board.fileName}(<span class="co">${board.fileSize}</span>)</a>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn btn-default pull-left" value="���" onclick="history.back()">
					<input type="button" class="btn btn-default pull-left" value="���" onclick="goForm2()">
					
				</td>
				<td>
					<input type="button" class="btn btn-default pull-right" value="����" onclick="location.href='deleteBoard.do?seq=${board.seq}&writer=${board.writer}'">
					<input type="button" class="btn btn-default pull-right" value="����" onclick="goForm()">
					<%-- <input type="button" class="btn btn-default pull-right" value="����" onclick="location.href='updateBoard.do?seq=${board.seq}&writer=${board.writer}'"> --%>
				</td>		
			</tr>

		</table>
	</div>
	
	<!--������ư�� �������� �������� �� ���� �۹�ȣ�� �ۼ���(�����ҷ��� ID�� �۾�ID ���ϱ����Ͽ� ���)-->
	<input type="hidden" name="seq" value="${board.seq}">
	<input type="hidden" name="writer" value="${board.writer}">
	
	<!--����� �������� �������� ��-->
	<input type="hidden" name="originNo" value="${board.originNo}">
	<input type="hidden" name="groupOrd" value="${board.groupOrd}">
	<input type="hidden" name="groupLayer" value="${board.groupLayer}">
	<input type="hidden" name="ck" value="responseWrite">
	
</form>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script>
	function goForm(){ //���� ��ư
		var insertBoardFrm = document.getElementById('insertBoardFrm');
		insertBoardFrm.submit();
	}
	function goForm2(){ //��� ��ư(action�� �ٸ����ϱ� ���� ���)
		var responseWrite = document.getElementById('insertBoardFrm');
		responseWrite.action = "writeCheck.do";
		responseWrite.submit();
	}
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
	</script>

<%@include file="footer.jsp" %>
</body>
</html>