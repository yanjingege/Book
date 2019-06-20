<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<title></title>
</head>
<body background='images/03.jpg'>
	<div class="container">
			<h1 align="center">修改用户信息</h1>
			<hr width="1000px">
			
		<form action="http://localhost/book/user" class="form-horizontal" method="post">
		<!-- 做一个隐藏域 -->
		<input type="hidden" name="id" value="${u.id }" />
		<!-- PUT -->
		<input type="hidden" name="_method" value="PUT" /> 
		
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">姓名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" name="name"
						value="${u.name}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="username" class="col-sm-4 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="username"
						name="username" value="${u.username}">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">密码</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="password"
						name="password" value="${u.password}">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">手机号码</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="phone" name="phone"
						value="${u.phone}">
				</div>
			</div>
			<div class="form-group">
				<label for="entryday" class="col-sm-4 control-label">注册时间</label>
				<div class="col-sm-4">
					<input type="date" class="form-control" id="time" name="time"
						value="<fmt:formatDate value="${u.time}" pattern="yyyy-MM-dd" />" >
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="submit" class="btn btn-primary btn-block">修改用户</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>