<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<style>
#myVideo {
  position: fixed;
  right: 0;
  bottom: 0;
  min-width: 100%; 
  min-height: 100%;
  z-index:-5;
}
footer{
		position:absolute;
		bottom:0;
		width:100%;
}
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
<%@include file="nav.jsp"%>

<div class="container">
<h1>ȸ������</h1><br>
<div class="wrap-loading display-none">

    <div><img src="./resources/images/loading.gif" /></div>

</div>  
<form name="member">
	<table class="table table-striped table-bordered table-hover">
		<tr>
			<th>���̵�</th>
			<td><input type="text" id="id" value="${user.id}" disabled></td>
		</tr>
		<tr>
			<th>�̸���</th>
			<td><input type="text" id="email" name="email" value="${user.email}"></td>
		</tr>
		<tr>
			<th>��й�ȣ</th>
			<td><input type="password" id="password" name="password" value="${user.password}"placeholder="��й�ȣ ����"></textfield></td>
		</tr>
		<tr>
			<th>��й�ȣ Ȯ��</th>
			<td><input type="password" id="confirm-password"></td>
		</tr>
	</table>
</form>
	<input type="button" id="cancel" value="���" class="btn pull-right btn-default">
	<input type="button" id="modify" value="��������" class="btn pull-right btn-success">
</div>

<%@include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>
<script>
	$(document).ready(function(){
		$("#modify").click(function(){
			var getMail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			var userPw = $("#password").val();
			var userPw2 = $("#confirm-password").val();
			var email = $("#email").val();
			var userId = $("#id").val();
			
			//�̸��� ��ȿ�� �˻�
			if(email == ""){
				alert("�̸����� �Է��ϼ���.");
				$("#email").focus();
				return;
			}
			
	        if(getMail.test($("#email").val())==false){
	          alert("�̸������Ŀ� �°� �Է����ּ���")
	          $("#email").val("");
	          $("#email").focus();
	          return;
	        }
	        
	        //��й�ȣ ��ȿ�� �˻�
			if(userPw == ""){
				alert("��й�ȣ�� �Է��ϼ���.");
				$("#password").focus();
				return;
			}
			
			if(userPw2 == ""){
				alert("��й�ȣ Ȯ���� �Է��ϼ���.");
				$("#confirm-password").focus();
				return;
			}
			
			//��й�ȣ �Ȱ�����
	        if($("#password").val() != ($("#confirm-password").val())){ 
	        	alert("��й�ȣ Ȯ���� �ٽ��Է� �ϼ���. ");
		        $("#password").val("");
		        $("#confirm-password").val("");
		        $("#confirm-password").focus();
	        	return;
	       }

		   $.ajax({
			   type : 'post',
				url : "updateMember.do",
				contentType : "application/json",
				data : JSON.stringify({"id":userId,"email":email,"password":userPw}),
				dataType : "text",
				success : function(result){
	        		alert("������ �Ϸ� �Ǿ����ϴ�");
	        	},
	        	beforeSend:function(){
	        	        $('.wrap-loading').removeClass('display-none');
	        	  },

	        	complete:function(){
	        	        $('.wrap-loading').addClass('display-none');
	        	},
	        	error : function(request,status,error){
	        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	        		alert("ȸ�������� ���� ���� �ʾҽ��ϴ�");
	        	}
		   });
		});
	});
</script>
</body>
</html>