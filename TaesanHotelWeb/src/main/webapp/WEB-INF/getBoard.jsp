<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>${board.title}</title>

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
					<a href="download.do?originalFileName=${board.originalFileName}">${board.fileName}</a>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn btn-default pull-left" value="���" onclick="history.back()">
				</td>
				<td>
					<input type="button" class="btn btn-default pull-right" value="����" onclick="location.href='deleteBoard.do?seq=${board.seq}&writer=${board.writer}'">
					<input type="submit" class="btn btn-default pull-right" value="����">
					<%-- <input type="button" class="btn btn-default pull-right" value="����" onclick="location.href='updateBoard.do?seq=${board.seq}&writer=${board.writer}'"> --%>
				</td>		
			</tr>
		</table>
	</div>
	
	<!--������ư�� �������� �������� �� ���� �۹�ȣ�� �ۼ���(�����ҷ��� ID�� �۾�ID ���ϱ����Ͽ� ���)-->
	<input type="hidden" name="seq" value="${board.seq}">
	<input type="hidden" name="writer" value="${board.writer}">
</form>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script>
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