<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>���ǰԽ���</title>
<style>

</style>
</head>
<body>
	<%@include file="nav.jsp" %>
	<!--�Խ��� ���̺�-->
<div class="container">
	<table class="table table-hover">
		<tr>
			<th style="width:20%">��ȣ</th>
			<th style="width:20%">����</th>
			<th>�ۼ���</th>
			<th>��¥</th>
			<th>��ȸ��</th>
		</tr>
		<tbody>
		<c:forEach items="${boardList}" var="board"><!-- DispatcherServlet��ü�� ���� Model�� ���޹��� ex)mav.addObject("boardList",boardService.getBoardList(vo)) -->
			<tr>
				<td>${board.seq}</td>
				
				<td>
					<a href="getBoard.do?seq=${board.seq}&message=success"> 

						${board.title}
					
					</a>
				</td>
				
				<td>${board.writer}</td>
				<td>${board.regDate}</td>
				<td>${board.cnt}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<a class="btn btn-default pull-right" href="writeCheck.do">�۾���</a>	
	<!--����¡-->

	<div class="text-center">
		<ul class="pagination">
		<!--����������-->
		<c:if test="${page.prev}">
			<li class="page-item">
      			<a class="page-link" href="javascript:page(${page.startPage-1})" aria-label="Previous">
        			<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span>
      			</a>
   			</li>
   		</c:if>
   		
   		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="idx">
			<li <c:out value="${page.pagenum == idx ? 'class=active' : ''}"/>><a href="javascript:page(${idx})">${idx}</a></li>
		</c:forEach>
			
		<!--����������-->
		<c:if test="${page.next}">
			 <li class="page-item">
     			<a class="page-link" href="javascript:page(${page.endPage+1})" aria-label="Next" onClick="fn_paging('${pagination.pageCnt }')">
        			<span aria-hidden="true">&raquo;</span>
        			<span class="sr-only">Next</span>
     			</a>
   			 </li>
   		</c:if>
		</ul>
	</div>	
	<!--����¡-->
	
	
	<!-- �˻� ���� -->
	<form action="getBoardList.do" method="post">
		<table class="table table-default">
			<tr>
				<td align="center">
					<select name="searchCondition">
					<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}">${option.key}
					</c:forEach>
					</select>
					<input name="searchKeyword" type="text"/>
					<input type="submit" value="�˻�" class="btn btn-default"/>
				</td>
			</tr>
		</table>
	</form>
</div>

<br><br><br>
	<!--�Խ��� ���̺�-->
	<%@include file="footer.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script>
		function page(idx){
			var pagenum = idx;
			location.href="getBoardList.do?pagenum="+pagenum;
		}
	</script>
</body>
</html>