<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<style>

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
<%@include file="./WEB-INF/nav.jsp"%>

<div class="container">

<!--�ε��̹���-->
<div class="wrap-loading display-none">

    <div><img src="./resources/images/loading.gif" /></div>
</div>  

<div class="panel panel-default">
	<div class="panel-heading">���̵� ã��</div>
	<div class="panel-body">
		<table class="table table table-striped table-bordered table-hover">
			<tr>
				<th>�̸��� �ּ�</th>
				<td><input type="text" id="email" placeholder="���Խ� ����Ͽ��� �̸����� �����ּ���" style="width:87%"> <input type="button" id="emailBtn" value="������ȣ �ޱ�" class="btn btn-success"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" id="numText" placeholder="������ȣ 6�ڸ� ���� �Է�" style="width:87%"> <input type="button" id="confirmBtn"value="Ȯ��" class="btn btn-success"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" id="password" style="width:87%" disabled></td>
			</tr>
		</table>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">��й�ȣ ã��</div>
	<div class="panel-body">
	
	</div>
</div>

</div>

<%@include file="./WEB-INF/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>
<script>
	$(document).ready(function(){
		var number; //������ȣ
		
		/* �̸��� ������ȣ  */
		$("#emailBtn").click(function(){
			var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			var email = $("#email").val();
			
			//�̸��� ��ȿ�� �˻�
			if(email == ""){
				alert("�̸����� �Է��ϼ���.");
				$("#divInputEmail").addClass("has-error")
                $("#divInputEmail").removeClass("has-success")
				$("#email").focus();
				return;
			}else{
				$("#divInputEmail").addClass("has-success")
                $("#divInputEmail").removeClass("has-error")
				
			}
			
	        if(!getMail.test($("#email").val())){
	          alert("�̸������Ŀ� �°� �Է����ּ���")
	          $("#email").val("");
	          $("#divInputEmail").addClass("has-error")
              $("#divInputEmail").removeClass("has-success")
	          $("#email").focus();
	          return;
	        }else{
	        	$("#divInputEmail").addClass("has-success")
                $("#divInputEmail").removeClass("has-error")
	        }
			$.ajax({
				 type : 'post',
					url : "mail.do",
					contentType : "application/json",
					data : JSON.stringify({"email":$("#email").val()}),
					dataType : "json",
					success : function(data){

		        		if(data.result == "fail"){
		        			alert("��ϵ� �̸����� �����ϴ�.");
		        		}else{
		        			number = data.number;
		        		}
		        	},
		        	beforeSend:function(){
		        		$('.wrap-loading').removeClass('display-none');
		        	},

		        	complete:function(){
		        	    $('.wrap-loading').addClass('display-none');
		        	},
		        	error : function(request,status,error){
		        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		        		alert("������ ���� ���� �ʾҽ��ϴ�.");
		        	}
			});
		});
		
		//Ȯ�ι�ư
		$("#confirmBtn").click(function(){
			if($("#numText").val() == number){ //������ȣ�� ������ ���̵� ���
				$.ajax({
					 type : 'post',
						url : "idSearch.do",
						contentType : "application/json",
						success : function(data){
							for(var i=0;i<data.list.length;i++){
								$("#password").val($("#password").val()+", "+data.list[i]);
							}
			        	},
			        	beforeSend:function(){
			        		$('.wrap-loading').removeClass('display-none');
			        	},

			        	complete:function(){
			        	    $('.wrap-loading').addClass('display-none');
			        	},
			        	error : function(request,status,error){
			        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			        		alert("���̵� �ҷ����� ���߽��ϴ�.");
			        	}
				});
			}else if(number == null){ //������ȣ�� �߱޹������� ������
				alert("������ȣ�� �߱� �޾ƾ��մϴ�.");
			}else{//������ȣ�� Ʋ������
				alert("������ȣ�� Ʋ�Ƚ��ϴ�.");
			}
		})
	});

</script>
</body>
</html>