<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>�ۼ���</title>
<style>

</style>
</head>
<body>
<%@include file="nav.jsp" %>
<form id="insertBoardFrm" action="updateBoard.do" method="post" enctype="multipart/form-data">
	<div class="container">
		<table class="table table-hover">
             <tr>
                  <th>����</th>
                  <td><input style="width: 100%" type="text" id="title" name="title" value="${boardVO.title}"/></td>
             </tr>
              <tr>
                   <th>����</th>
                   <td><textarea name="content" id="editor" style="width: 100%; height: 400px;">${boardVO.content}</textarea></td>
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
              	<th>
              		��������
             	</th>
             	<td>
              		<a href="download.do?originalFileName=${board.originalFileName}">${board.fileName}</a>
              	</td>
              </tr>
			  <tr>
					<td>
					</td>
					<td>
						<input class="btn btn-default pull-right" type="button" value="���" onclick="history.back()"/>
						<input id="insertBoard" class="btn btn-default pull-right" type="button" value="����"/>
						<input type="hidden" name="upck" value="upck">
						<input type="hidden" name="writer" value="${board.writer}">
						
						<!--���ε� �����ʾ����� ������ �� �״�� �����ϱ� ����-->
						<input type="hidden" name="fileName" value="${board.fileName}">
						<input type="hidden" name="originalFileName" value="${board.originalFileName}">
						<input type="hidden" name="seq" value="${board.seq}">
						<input type="hidden" name="fileSize" value="${board.fileSize}">
					</td>
				</tr>
         </table>
	</div>
	</form>
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