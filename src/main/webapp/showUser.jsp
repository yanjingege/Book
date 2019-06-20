<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<meta name="viewport" content="width=device-width; initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<title>查看用户</title>
<script type="text/javascript">
	window.onload = function() {
		var selectAll = document.getElementById("selectAll");
		selectAll.onclick = function() {
			var chek = document.getElementsByName("ids");
			for (var i = 0; i < chek.length; i++) {
				chek[i].checked = true;
			}
		};
		var noSelectAll = document.getElementById("noSelectAll");
		noSelectAll.onclick = function() {
			var chek = document.getElementsByTagName("input");
			for (var i = 0; i < chek.length; i++) {
				chek[i].checked = false;
			}
		};
		var fanxuan = document.getElementById("fanxuan");
		fanxuan.onclick = function() {
			var chek = document.getElementsByName("ids");
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					chek[i].checked = false;
				} else {
					chek[i].checked = true;
				}
			}
		};

		var deleteUser = document.getElementById("deleteUser");

		deleteUser.onclick = function() {

			var chek = document.getElementsByName("ids");

			alert(chek.length);

			var flag = false;

			for (var i = 0; i < chek.length; i++) {

				if (chek[i].checked == true) {

					flag = true;

					break;

				}

			}

		if (flag == false) {
			alert("请至少选择一项进行删除！")
			location.href = "http://localhost/book/users/1"
			return;
		}

		var str = "";
		for (var i = 0; i < chek.length; i++) {
			if (chek[i].checked == true) {
				str += chek[i].value + ",";
			}
		}

		str = str.slice(0, str.length - 1);
		//alert(str);
		var queren = confirm("您确认要删除这些用户吗");
		if (queren == true) {
			var $url = "http://localhost/book/user/" + str;
			//alert($url);
			$("#deleteForm").attr("action", $url);
			$("#deleteForm").submit();
			return false;
		} else {
			location.reload();
		}
	};

	//导出全部
	var outAll = document.getElementById("outAll1");
	var chek = document.getElementsByName("ids");
	outAll.onclick = function() {

		var flage = confirm("你确定导出所有用户的信息？");

		if (flage) {

			window.location.href = "http://localhost/book/outAll1";
		}
	};

	var outSelect = document.getElementById("outSelect1");
	var chek = document.getElementsByName("ids");
	outSelect.onclick = function() {

		var flag = false;
		for (i = 0; i < chek.length; i++) {
			if (chek[i].checked == true) {
				flag = true;
				break;
			}
		}
		if (flag == false) {
			alert("请至少选择一项")
			return;

		} else {
			var str = "";
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					str += chek[i].value + ",";
				}
			}

			str = str.slice(0, str.length - 1);
			//alert(str);
			var flage = confirm("您确定导出选中的用户信息？");
			if (flage) {
				location.href = "http://localhost/book/outSelect1/" + str;
			}
		}
	};

};
</script>
</head>

<body background='images/03.jpg'>
	<div class="container">
		<h1 align="center">查看用户</h1>
		<hr width="1000px">
		<table class="table table-bordered table-hover table-striped">
			<tr>
				<th>勾选</th>
				<th>编号</th>
				<th>姓名</th>
				<th>用户名</th>
				<th>密码</th>
				<th>手机号码</th>
				<th>注册时间</th>
				<th>点击修改</th>
			</tr>
			<c:forEach items="${pb.beanList}" var="u" varStatus="s">
				<tr align="center">
					<td><input type="checkbox" name="ids" value="${u.id}" /></td>
					<td>${s.index+1 }</td>
					<td>${u.name}</td>
					<td>${u.username}</td>
					<td>${u.password}</td>
					<td>${u.phone}</td>
					<td><fmt:formatDate value="${u.time}" pattern="yyyy-MM-dd"/></td>
					<td><a href="http://localhost/book/user/${u.id }"
						class="btn btn-primary">修改</a></td>
				</tr>
			</c:forEach>
			<tr align="center">
				<td colspan="9"><button id="selectAll"
						class="btn btn-success btn-sm">全选</button>
					<button id="noSelectAll" class="btn btn-success btn-sm">全不选</button>
					<button id="fanxuan" class="btn btn-success btn-sm">反选</button>
					<button id="deleteUser" class="btn btn-success btn-sm">删除</button>
					<button id="outSelect1" class="btn btn-success btn-sm">导出选中</button>
					<button id="outAll1" class="btn btn-success btn-sm">导出全部</button></td>
			</tr>
		</table>
		<!-- 准备一个隐藏表单 -->
		<form action="" method="post" id="deleteForm">
			<input type="hidden" name="_method" value="DELETE">
		</form>
		<center>
			<a href="1">首页</a> &nbsp;&nbsp;
			<c:if test="${pb.pageNow>1 }">
				<a href="${pb.pageNow-1 }">上一页</a>
			</c:if>
			&nbsp;
			<!-- 分两种情况：
		         如果页数小于10：
		         如果页数大于10：         
		        -->
			<c:choose>
				<c:when test="${pb.pages<=10 }">
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="${pb.pages }"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="begin" value="${pb.pageNow-5 }"></c:set>
					<c:set var="end" value="${pb.pageNow+4 }"></c:set>
					<c:if test="${begin<=1 }">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="10"></c:set>
					</c:if>
					<c:if test="${end>=pb.pages }">
						<c:set var="begin" value="${pb.pages-9 }"></c:set>
						<c:set var="end" value="${pb.pages }"></c:set>
					</c:if>
				</c:otherwise>
			</c:choose>
			<!-- 循环十个数 -->
			<c:forEach begin="${begin }" end="${end }" var="i">
				<c:choose>
					<c:when test="${pb.pageNow==i }">
						<span>${i}</span>
					</c:when>
					<c:otherwise>
						<a href="${i }">[${i }]</a>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			&nbsp;
			<c:if test="${pb.pageNow<pb.pages }">
				<a href="${pb.pageNow+1 }">下一页</a>
			</c:if>
			&nbsp;&nbsp; <a href="${pb.pages }">尾页</a>

		</center>
		<br>
		<p align="center">第${pb.pageNow }页/共${pb.pages }页</p>
		<br>
	</div>
</body>
</html>