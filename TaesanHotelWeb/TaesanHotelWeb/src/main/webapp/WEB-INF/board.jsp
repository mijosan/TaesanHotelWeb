<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
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
<div class="container" >
<h1>������</h1><br>
	<table class="table table table-striped table-bordered table-hover">
		<tr>
			<th style="width:5%" class="text-center">��ȣ</th>
			<th style="width:60%" class="text-center">����</th>
			<th class="text-center">�ۼ���</th>
			<th class="text-center">��¥</th>
			<th class="text-center">��ȸ��</th>
			<th class="text-center">���ƿ�</th>
		</tr>
		<tbody>
		<c:forEach items="${boardList}" var="board"><!-- DispatcherServlet��ü�� ���� Model�� ���޹��� ex)mav.addObject("boardList",boardService.getBoardList(vo)) -->
			<tr>
				<td>${board.seq}</td>
				
				<td>
					<a href="getBoard.do?seq=${board.seq}&message=success"> 
						
						${board.title}
						<c:if test="${board.fileName != null}">
							<img src="./resources/images/fileIcon.png">
						</c:if>
						<c:if test="${board.c_cnt>0}">
							<span style="color:red">[${board.c_cnt}]</span>
						</c:if>
						<span id="newIcon${board.seq}"></span>
					</a>
				</td>
				
				<td class="text-center">${board.writer}</td>
				<td class="text-center">${board.regDate}</td>
				<td class="text-center">${board.cnt}</td>
				<td class="text-center"><img src="./resources/images/heart.PNG"> ${board.like_cnt}</td>
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
     			<a class="page-link" href="javascript:page(${page.endPage+1})" aria-label="Next">
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

	<!--�Խ��� ���̺�-->
	<%@include file="footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script>
	
		function page(idx){
			var pagenum = idx;
			location.href="getBoardList.do?pagenum="+pagenum;
		}
	$(document).ready(function(){
		var list = ${list};
		var boardList = new Array();
		
		$.each(list, function( index, value ) {
			boardList[index] = value
		});
		
		/* ���� ��¥���(day) */
		var now = new Date();

	      var year= now.getFullYear();
	      var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	      var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	              
	      var nowDays = new Date(year,mon,day);
	      
	      /* ���� ��¥���(day) */
	     
	      
	      
	      /* �Խ��� ��¥���(day) */
	     
	      var boardRegdate = new Array();
	      
	      
	      var list2 = ${list};
	      $.each(list2, function( index, value ) {
	    	  
	    	  boardRegdate[index] = new Date(value.regDate.substring(0,4),value.regDate.substring(5,7),value.regDate.substring(8,10));
	    	  boardRegdate[index] = nowDays.getTime() - boardRegdate[index].getTime();
	    	  boardRegdate[index] = boardRegdate[index] / (1000*60*60*24);
			  
			});
		  
	   
	     //new Icon �߰�
	     for(var i=0;i<boardRegdate.length;i++){
	    	 if(boardRegdate[i]<8){
	    		 $("#newIcon"+boardList[i].seq).html("<img src='./resources/images/newIcon.png'>");
	    	 }
	     }
		
		
	});
	</script>
</body>
</html>