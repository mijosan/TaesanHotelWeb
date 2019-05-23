<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<table class="table table-hover">
			<tr>
				<th colspan="2">
					${board.title}
				</th>
			</tr>
			<tr>
				<td>
					${board.writer} ��${board.regDate }
				</td>
				<td class="text-right">
					��ȸ ${board.cnt} �� ��� <span class="c_cnt"></span>
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
			
			<!--��� �ۼ�-->
			<tr>
				<td colspan="2">
					<strong>Comments</strong>&nbsp;<span class="c_cnt"></span>
				</td>
			</tr>
			<c:if test="${sessionScope.user !=null }">
			<tr>
				<td style="width: 100%" colspan="2">
                    <textarea style="width: 100%" rows="3" cols="30" id="commentArea" name="commentArea" placeholder="����� �Է��ϼ���"></textarea>
                	<input type="button" class="btn pull-right btn-success" value="���" id="commentBtn">
                </td>
			</tr>
			</c:if>
			
			<!--��� â-->
		</table>
		<div id="commentList">
		
		</div>
	</div>
	
	<!--������ư�� �������� �������� �� ���� �۹�ȣ�� �ۼ���(�����ҷ��� ID�� �۾�ID ���ϱ����Ͽ� ���)-->
	<input type="hidden" name="seq" value="${board.seq}">
	<input type="hidden" name="writer" value="${board.writer}">
	
	<!--����� �������� �������� ��-->
	<input type="hidden" name="originNo" value="${board.originNo}">
	<input type="hidden" name="groupOrd" value="${board.groupOrd+1}">
	<input type="hidden" name="groupLayer" value="${board.groupLayer+1}">
	<input type="hidden" name="ck" value="responseWrite">
	
</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script>
	$(document).ready(function(){
		listReply();
		//��� ����
		$("#commentBtn").click(function(){
			comment();
			listReply();
		});
		
	});
	
	//��� ����
	$(document).on('click', "#deleteComment", function(){
		if(confirm("���� ���� �Ͻðڽ��ϱ� ?") == true){
			var c_seq = $(this).attr("alt");
			var param = {"c_seq":c_seq};
			$.ajax({
	        	type : 'post',
	        	url : 'deleteComment.do',
	        	data: JSON.stringify(param),//JSON ���ڿ� �������� �ٲ�
	        	contentType : "application/json",
	        	dataType : "json",
	        	 success : function(result){
	        		if(result == "success"){
	        		 	alert("����� ���� �Ǿ����ϴ�.");
	        		 	listReply();
	        		}else{
	        			alert("����� �������� �ʾҽ��ϴ�.");
	        		}
	        	},
	        	error : function(request,status,error){
	        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	        		alert("����� �������� �ʾҽ��ϴ�");
	        	}
	        	
	        });
	    }
	    else{
	        return ;
	    }
	});
	
	//��� ����
	$(document).on('click', "#updateComment", function(){
		if(confirm("���� ���� �Ͻðڽ��ϱ� ?") == true){
	        
	    }
	    else{
	        return ;
	    }
	});
		
 /*
 * ��� ����ϱ�(Ajax)
 */
function comment(){
    var c_content=$("#commentArea").val();
    var b_seq="${board.seq}";
    var param = {"c_content": c_content,"b_seq":b_seq};//json ����

    $.ajax({
        type:'POST',
        url : "commentInsert.do",
        data: JSON.stringify(param),//JSON ���ڿ� �������� �ٲ�
        contentType : "application/json", //������ �����͸� ������
        success : function(data){
           alert("����� ��� �Ǿ����ϴ�.");
           listReply();
        },
        error:function(request,status,error){
        	alert("����� ��ϵ��� �ʾҽ��ϴ�.");
       }
        
    });
}

function listReply(){
	$.ajax({
		type:'get',
		url: "commentList.do?b_seq=${board.seq}",
	    contentType : "application/json",
	    dataType: "json", // �������� �������ִ� ������ ����
	    success : function(result){
	    	$(".c_cnt").html(result[0].c_cnt);
	        var output="<table class='table table-hover'>";
	        for(var i in result){
	        	console.log(result);
	        	//�ٹٲ� ó�� + ����
	        	var comment = result[i].c_content;
	        	comment = comment.replace(/\n/gi,"<br>");
	        	comment = comment.replace(/  /gi,"&nbsp;&nbsp;");
	        	
	        	output += "<tr>";
	        	output += "<td class='col-md-2'>"+"<mark>"+result[i].c_writer+"</mark>";
	        	output += "<td class='col-md-9'>"+comment+"<br><small>"+result[i].c_regdate+"</small><img src='./resources/images/replyIcon.png'></td>";
	        	output += "<td class='col-md-3'><img src='./resources/images/pen.png' id='updateComment'>&nbsp;<img src='./resources/images/trash.png' id='deleteComment' alt='"+result[i].c_seq+"'></td>";
	        	output += "</tr>";	
	        }
	        output +="</table>";
	        $("#commentList").html(output);
	    },
	    error:function(request,status,error){
	        alert("����� �ҷ��ü� �����ϴ�.");
	    }
	});
} 

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