<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	/*navbar  */
	.navbar-default .navbar-brand:hover,
	.navbar-default .navbar-brand:focus{
		color:black;
		font-size:25px;
	}
	.navbar-default .navbar-nav > li > a:hover,
	.navbar-default .navbar-nav > li > a:focus{
		color:black;
		font-size:20px;
	}

	
	
	.navbar-default .navbar-nav > .active > a,
	.navbar-default .navbar-nav > .active > a:hover,
	.navbar-default .navbar-nav > .active > a:focus{
		color:black;
		background-color:black;
	}

</style>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">TSȣ��</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="location.jsp">��ġ<span class="sr-only"></span></a></li>
					<li><a href="introduce.jsp">�̿�ȳ�</a></li>
					<li><a href="instructor.jsp">���ǿ���</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">������<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="getBoardList.do">���ǰԽ���</a></li>
					</ul>
					</li>
				</ul>
				<!-- <form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="������ �Է��ϼ���">
					</div>
					<button type="submit" class="btn btn-default">�˻�</button>
				</form> -->
				<c:choose>
					<c:when test="${sessionScope.user == null }">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false">�����ϱ�<span class="caret"></span></a>
								<ul class="dropdown-menu">
								<li><a href="loginForm.jsp">�α���</a></li>
								<li><a href="registerForm.jsp">ȸ������</a></li>
							</ul>
							</li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false">${user.id} ��<span class="caret"></span></a>
								<ul class="dropdown-menu">
								<li><a href="loginForm.jsp">ȸ������</a></li>
								<li><a href="registerForm.jsp">���ǿ��� ��Ȳ</a></li>
								<li role="presentation" class="divider"></li>
								<li><a href="logout.do">�α׾ƿ�</a></li>
							</ul>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
</body>
</html>