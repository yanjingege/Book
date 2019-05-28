<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<title>查看管理员信息</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">

</script>

</head>
<body align="center" background='images/03.jpg'>	
<br>
<br>
<p align="center"><font size="7" face="幼圆">查看管理员信息</font></p>
	<table align="center" width="500px" height="300px"
			cellspacing="0">
		<br>	
		<td colspan=2 valign="top">
		<form class="form-horizontal" action="show" method="get" >
				<table class="table table-striped table-hover table-bordered"   width="500px" height="280px"
					align="center" cellspacing="0">							
		<tr>
				<td align="center"><font size="4">编&nbsp;&nbsp;&nbsp;号:</font></td>
				<td id="id"></td>
			</tr>
			<tr>
				<td align="center"><font size="4">姓&nbsp;&nbsp;&nbsp;名:</font></td>
				<td id="name"></td>
			</tr>
			<tr>
				<td align="center"><font size="4">头&nbsp;&nbsp;&nbsp;像:</font></td>
				<td id="touxiang"></td>
			</tr>		
			<tr>
				<td align="center"><font size="4">手&nbsp;&nbsp;&nbsp;机:</font></td>
				<td id="phone"></td>
			</tr>
			<tr>
				<td align="center"><font size="4">账&nbsp;&nbsp;&nbsp;号:</font></td>
				<td id="username"></td>
			</tr>
			<tr>
				<td align="center"><font size="4">密&nbsp;&nbsp;&nbsp;码:</font></td>
				<td><input type="password" id="password" disabled="disabled" /></td>
			</tr>
			<c:catch item=${m.beanlist } val="m">
			<tr>
			<td>${m.id }</td>
			<td>${m.name }</td>
			<td>${m.touxiang }</td>
			<td>${m.phone }</td>
			<td>${m.username }</td>
			<td>${m.password }</td>
			</tr>
			</c:catch>
			</table>
			</form>
	</table>
</body>
</html>