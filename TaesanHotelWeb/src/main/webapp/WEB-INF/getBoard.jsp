<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<%@include file="nav.jsp" %>
	<div class="container">
		<table class="table table-hover">
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
				<td  class="text-right">
					${board.fileName}
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="button" class="btn btn-default pull-right" value="���" onclick="history.back()">
				</td>	
			</tr>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
<%@include file="footer.jsp" %>
</body>
</html>