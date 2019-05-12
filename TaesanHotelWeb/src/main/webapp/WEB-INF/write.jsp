<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>�۾���</title>
</head>
<body>
<%@include file="nav.jsp" %>
	<div class="container">
		<table class="table table-hover">
			<form id="insertBoardFrm" action="insertBoard.do" method="post" enctype="multipart/form-data">
             <tr>
                  <th>����</th>
                  <td><input style="width: 100%" type="text" id="title" name="title" /></td>
             </tr>
              <tr>
                   <th>����</th>
                   <td><textarea name="content" id="editor" style="width: 100%; height: 400px;"></textarea></td>
              </tr>
              <tr>
              	<th>
              		���ε�
              	</th>
              	<td>
              		<input type="file" name="uploadFile"/>
              	</td>
              </tr>
			  <tr>
					<td>
					</td>
					<td>
						<input class="btn btn-default pull-right" type="button" value="���"
						onclick="history.back()"
						/>
						<input id="insertBoard" class="btn btn-default pull-right" type="button" value="���"/>
					</td>
				</tr>
			</form>
         </table>
	</div>
	<br><br><br>
<%@include file="footer.jsp" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="./resources/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function(){
        //��������
        var obj = [];              
        //����Ʈ������ �����ӻ���
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "./resources/editor/SmartEditor2Skin.html",
            htParams : {
                // ���� ��� ����
                bUseToolbar : true,            
                // �Է�â ũ�� ������ ��� ����
                bUseVerticalResizer : true,    
                // ��� ��(Editor | HTML | TEXT) ��� ����
                bUseModeChanger : true,
            }
        });
        //���۹�ư
        $("#insertBoard").click(function(){
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //�� submit
            $("#insertBoardFrm").submit();
        });
    });
</script>
</body>
</html>