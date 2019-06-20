<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<title>添加用户</title>
<script type="text/javascript" src="js/ajax.js">
	
</script>


</head>
<body background='images/03.jpg'>
  <div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="login" action="add" method="post">
					<h1 align="center">添加用户</h1>
					<div class="form-group">
						<label>姓名</label> <input type="text"
							name="name" class="form-control" />
					</div>
					<div class="form-group">
						<label>用户名</label> <input
							type="text" name="username" class="form-control" />
					</div>		
                    <div class="form-group">
						<label>密码</label> <input
							type="text" name="password" class="form-control" />
					</div>

					<div class="form-group">
						<label>手机号码:</label> <input type="text"
							name="phone" class="form-control" />
					</div>
					<div class="form-group">
						<label>注册时间</label> <input
							type="date" name="time" class="form-control" />
					</div>
					
					<div class="form-group">
						<button type="submit" class="btn btn-success btn-block">添加</button>
						<button type="reset" class="btn btn-primary btn-block">重填</button>
					</div>
				</form>
			</div>
		</div>
	</div>	 
</body>
</html>