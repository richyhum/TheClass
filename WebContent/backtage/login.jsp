<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link href="../css/style.css" rel="stylesheet" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<head>
<title>班级管理系统-登录</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<script type="text/javascript">

	function login(){
		var studentName=$("#studentName").val();
		var password=$("#password").val();
		if(studentName==null||studentName==""){
			alert("用户名不能为空！");
			return;
		}
		if(password==null||password==""){
			alert("密码不能为空！");
			return;
		}
		$("#adminLogin").submit();			
		
	}
</script>

<body style="background:url(../img/bgd.jpg)">
<div class="container">
	<div class="row">
		<div class="col-md-12">
	<section id="content">
		<form id="adminLogin" action="${pageContext.request.contextPath}/student/validate.spring" method="post">
			<h1>Login Form</h1>
			<div>
				<input type="text" placeholder="Username" value="${student.studentName}" id="studentName" name="studentName" />
			</div>
			<div>
				<input type="password" placeholder="Password" value="${student.password }" id="password" name="password" />
			</div>
			<div>
				<div class="login-btn col-xs-4 col-sm-4 col-md-offset-2 col-md-4 col-lg-4">
					<button class="btn btn-default" onclick="javascript:login();return false;">LOG IN</button>
				</div>
				<div class="reset-btn col-xs-4 col-sm-4 col-md-4 col-lg-4"> 
					<input type="reset" value="RESET" class="btn btn-default" />
				</div> 
			</div>
		</form>
		<div class="button">
			<a href="#">@SOFTWARE TECH 152</a>
		</div>
		</div>
	</section>
	</div>
</div>
</body>
</html>