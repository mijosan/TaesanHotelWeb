<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <title>���ǿ���</title>
  <meta charset="EUC-KR">
  <link rel="stylesheet" href="./resources/css/bootstrap.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="./resources/js/bootstrap.js"></script>
  <script>
  $( function() {
	    var dateFormat = "mm/dd/yy",
	      from = $( "#from" )
	        .datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 3
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	      to = $( "#to" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 3
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate( this ) );
	      });
	 
	    function getDate( element ) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	 
	      return date;
	    }
	    var from;
 	    var to;
 	    var milli;
 	    var milliBetween;
 	    var days;
 	    var room;
 	    var people;
 	    var peoplePrice;
 	  	var price;
	
	    $("#confirm").click(function(){
	    	from = new Date($("#from").val());
	 	    to = new Date($("#to").val());
	 	    milli = 1000 * 60 * 60 * 24;
	 	    milliBetween = to.getTime() - from.getTime();
	 	    days = milliBetween / milli;	   
	 	    room = $("#room").val();	    
	 	    people = $("#sel1").val();
	 	    
	 	    if(people == "���� 1~2��"){
	 	    	peoplePrice = 5;
	 	    }else if(people == "���� 3~4��"){
	 	    	peoplePrice = 10;
	 	    }else if(people == "���� 5~6��"){
	 	    	peoplePrice = 15;
	 	    }else if(people == "���� 7~8��"){
	 	    	peoplePrice = 20;
	 	    }

	 	    var picture;
	 	    if(room == "standard"){
	 	    	price = 20 * days + peoplePrice;
	 	    	picture = "http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R0000000GO0L_KR.jpg";
	 	    }else if(room == "deluxe"){
	 	    	price = 25 * days + peoplePrice;
	 	    	picture = "http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000000TGX_KR.jpg";
	 	    }else if(room == "premier"){
	 	    	price = 30 * days + peoplePrice;
	 	    	picture = "http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000008REF_KR.gif";
	 	    }else if(room == "terrace"){
	 	    	price = 35 * days + peoplePrice;
	 	    	picture = "http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000000PL1_KR.jpg";
	 	    }
			
	 	    
			if($("#from").val() == ""){
				$(".modal-body").html("<h3>üũ�� ��¥�� �������ּ���.</h3>");
				$(".modal-footer").html("<button type='button' class='btn btn-secondary' data-dismiss='modal'>�ݱ�</button>");
			}else if($("#to").val() == ""){
				$(".modal-body").html("<h3>üũ�ƿ� ��¥�� �������ּ���.</h3>");
				$(".modal-footer").html("<button type='button' class='btn btn-secondary' data-dismiss='modal'>�ݱ�</button>");
			}else{
				$(".modal-body").html("<img src='"+picture+"'><br><span class='glyphicon glyphicon-ok' aria-hidden='true'/> �� ���� : "+room+" Room<br><br>"+"<span class='glyphicon glyphicon-ok' aria-hidden='true'/> ���� �Ⱓ : "+$("#from").val()+" ~ "+$("#to").val()+"("+days+"��"+")<br>"
				 		+"<br><span class='glyphicon glyphicon-ok' aria-hidden='true'/> ���� �ο� : "+people+"<br><h3>������ �� "+price+"���� �Դϴ�.<br><br>�̴�� �����Ͻðھ�� ?</h3>");

				$(".modal-footer").html("<button type='button' id='payBtn' class='btn btn-danger'>����</button> <button type='button' class='btn btn-secondary' data-dismiss='modal'>�ݱ�</button>");
				
			}
	 	    
	 	  
	    });
	    
	    $(document).on('click', "#payBtn", function(){
	    	$(".modal-body").append("<input type='hidden' name='r_date' value='"+$('#from').val()+" ~ "+$('#to').val()+"("+days+"��"+")'>");
	    	$(".modal-body").append("<input type='hidden' name='r_price' value='"+price+"'>");
	    	$("#reservationForm").submit();
	    });
	   
	    
	  });
  		
  </script>
  <style>
  	@font-face{

	font-family:"GoodFont"; /*��Ʈ �йи� �̸� �߰�*/
	
	src:url("./resources/fonts/KBIZHanmaumMyungjo.ttf"); /*��Ʈ ���� �ּ�*/
	}
  	.container{
		font-family:"GoodFont";
		background-color:#e7e7e7;
	}
  </style>
</head>

<body>
<%@include file="./WEB-INF/nav.jsp" %>
<form id="reservationForm" action="reservation.do" method="post">
	<div class="container">
		<h2>Check In <span class='glyphicon glyphicon-calendar' aria-hidden='true'/></h2><br>
        <input type="text" id="from" class="form-control">
        
        <h2>Check Out <span class='glyphicon glyphicon-calendar' aria-hidden='true'/></h2><br>
        <input type="text" id="to" class="form-control">
        
        <h2>Room <span class='glyphicon glyphicon-ok' aria-hidden='true'/></h2><br>
        <input type="text" name="r_name" id="room" value="${param.room}" readonly class="form-control">
        
        <h2>�ο����� <span class='glyphicon glyphicon-ok' aria-hidden='true'/></h2><br>
        <div class="form-group">
		  <select class="form-control" id="sel1" name="r_people">
		    <option>���� 1~2��</option>
		    <option>���� 3~4��</option>
		    <option>���� 5~6��</option>
		    <option>���� 7~8��</option>
		  </select>
		</div>
		
		<button type="button" id="confirm"class="btn btn-primary btn-block" data-toggle="modal" data-target="#exampleModalLong" >
		  	Ȯ��
		</button>
		<br>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">���� ����</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <!--�˾� ���� ���°�-->
		        
		        <!--�˾� ���� ���°�-->
		      </div>
		      <div class="modal-footer">
		      	<button type="button" id="payBtn" class="btn btn-danger">����</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">�ݱ�</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</form>
	<br><br><br><br>
<%@include file="./WEB-INF/footer.jsp" %>
</body>
</html>