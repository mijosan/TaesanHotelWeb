<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<html>
<head>
<meta charset="EUC-KR">
<title>���� �� �� ����</title>
<style>
 /*CheckBox*/
.checkbox label:after, 
.radio label:after {
    content: '';
    display: table;
    clear: both;
}

.checkbox .cr,
.radio .cr {
    position: relative;
    display: inline-block;
    border: 1px solid #a9a9a9;
    border-radius: .25em;
    width: 1.3em;
    height: 1.3em;
    float: left;
    margin-right: .5em;
}

.radio .cr {
    border-radius: 50%;
}

.checkbox .cr .cr-icon,
.radio .cr .cr-icon {
    position: absolute;
    font-size: .8em;
    line-height: 0;
    top: 50%;
    left: 20%;
}

.radio .cr .cr-icon {
    margin-left: 0.04em;
}

.checkbox label input[type="checkbox"],
.radio label input[type="radio"] {
    display: none;
}

.checkbox label input[type="checkbox"] + .cr > .cr-icon,
.radio label input[type="radio"] + .cr > .cr-icon {
    transform: scale(3) rotateZ(-20deg);
    opacity: 0;
    transition: all .3s ease-in;
}

.checkbox label input[type="checkbox"]:checked + .cr > .cr-icon,
.radio label input[type="radio"]:checked + .cr > .cr-icon {
    transform: scale(1) rotateZ(0deg);
    opacity: 1;
}

.checkbox label input[type="checkbox"]:disabled + .cr,
.radio label input[type="radio"]:disabled + .cr {
    opacity: .5;
}
  /*CheckBox*/
  
  /*ajax �ε�â*/
  .wrap-loading{ /*ȭ�� ��ü�� ��Ӱ� �մϴ�.*/

    position: fixed;

    left:0;

    right:0;

    top:0;

    bottom:0;

    background: rgba(0,0,0,0.2); /*not in ie */

    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */

    

}

    .wrap-loading div{ /*�ε� �̹���*/

        position: fixed;

        top:50%;

        left:50%;

        margin-left: -21px;

        margin-top: -21px;

    }

    .display-none{ /*���߱�*/

        display:none;

    }
</style>
</head>
<body>
<div class="wrap-loading display-none">

    <div><img src="./resources/images/loading.gif" /></div>

</div>  
	<%@include file="nav.jsp" %>
	<!--�Խ��� ���̺�-->
	
	<div class="container" >
	<ul class="nav nav-tabs">
	  <li><a href="getMyBoardList.do">���� �� �� ����</a></li>
	  <li class="active"><a href="getMyCommentList.do">���� �� ��� ����</a></li>
	</ul>
	
	  <!--���� �� ��� ����-->
	
	   	<table class="table table table-striped table-bordered table-hover">
		<tr>
			<th style="width:80%" class="text-center">����</th>
			<th class="text-center">��¥</th>
		</tr>
		<tbody>
		<c:forEach items="${commentList}" var="comment">
			<tr>
				<td>
					<div class="checkbox">
			          <label>
			            <input type="checkbox" value="${comment.c_seq}" class="ckBox" name="ckBox">&nbsp;&nbsp;&nbsp;
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
				            <a href="getBoard.do?seq=${comment.b_seq}&message=success">
								${comment.c_content}
							</a>
			          </label>
			        </div>
				</td>
				<td class="text-center" style="vertical-align: middle;">${comment.c_regdate }</td>

			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table class="table table-hover">
		<tr>
			<td>
				<div class="checkbox">
					<label>
						<input type="checkbox" id="allCheck"> ��ü����
						<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
					</label>
				</div>
			</td>
			<td style="text-align:right;">
				<a class="btn btn-default" id="deleteBtn">����</a>
				<a class="btn btn-default" href="writeCheck.do">�۾���</a>	
			</td>
		</tr>	
	</table>
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
	  </div>

	<!--�Խ��� ���̺�-->
	<%@include file="footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script>
	
		function page(idx){
			var pagenum = idx;
			location.href="getMyCommentList.do?pagenum="+pagenum;
		}

	$(document).ready(function(){
		$("#allCheck").click(function(){
			$(".ckBox").prop("checked",this.checked);
		});
		
		
		$("#deleteBtn").click(function(){
			if(confirm("���� ���� �Ͻðڽ��ϱ�?")){
				$("input[name=ckBox]:checked").each(function(){
					var seq = $(this).val();
					
					$.ajax({
						type : 'post',
						url : "deleteMyComment.do",
						contentType : "application/json",
						data : JSON.stringify({"c_seq":seq}),
						dataType : "text",
						success : function(result){	
				        	location.reload();
			        	},
			        	beforeSend:function(){
			        	        $('.wrap-loading').removeClass('display-none');
			        	  },

			        	complete:function(){
			        	        $('.wrap-loading').addClass('display-none');
			        	},
			        	error : function(request,status,error){
			        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			        		swal("���� ���� �����ʾҽ��ϴ�.", "", "error");
			        	}
					});
				});
			}else{
				
			}
		});
		
	});
	</script>
</body>
</html>