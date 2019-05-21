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
					��ȸ ${board.cnt} �� ��� ${cCnt}
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
					<strong>Comments</strong><span id="cCnt"> ${cCnt}</span>
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
        dataType: "json", // �������� �������ִ� ������ ����
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
	    success : function(result){
	        var output="<table>";
	        for(var i in result){
	        	output += "<tr>";
	        	output += "<td class='col-md-2'>"+"<mark>"+result[i].c_writer+"</mark>";
	        	output += "<td class='col-md-10'>"+result[i].c_content+"<br><small>"+result[i].c_regdate+"</small></td>";
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
    
</script>

<%@include file="footer.jsp" %>
</body>
</html>