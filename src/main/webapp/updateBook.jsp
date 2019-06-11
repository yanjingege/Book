<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<meta charset="UTF-8">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<title>修改图书</title>
<script type="text/javascript" src="js/ajax.js"></script>
 
</head>
<body background='images/03.jpg'>	
					
	<div class="container">
		<form class="form-horizontal" action="http://localhost/book/updatebook" method="post">
              <input type="hidden" name="_method" value="PUT" /> 
			<h3 class="text-center text-success">
				<font color="black">修改图书</font>
			</h3>
		
		<!-- 做一个隐藏域 -->
	 
	    <input type='hidden' name="id" value="${b.id}" />
		
			
	
		
			<div class="form-group">
				<label for="fenlei" class="col-sm-4 control-label">分类名称:</label>
				<div class="col-sm-4">
					<input type="text"  name="fenleis.fname" id="fenleis.fname" class="form-control"
						value="${b.fenleis.fname}" />
				</div>

			</div>
		
		
	
		<div class="form-group">
				<label for="name" class="col-sm-4 control-label">图书名称:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" name="name"
						value="${b.name}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="price" class="col-sm-4 control-label">图书价格:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price"
						value="${b.price}">
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="chuban" class="col-sm-4 control-label">出版社:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="chuban" name="chuban"
						value="${b.chuban}">
				</div>
			</div>
			
		<!-- 	<div class="form-group">
				<label for="zhuangtai" class="col-sm-4 control-label">状态:</label>
				<div class="col-sm-4">
					<input type="radio" checked name="zhuangtai" value="未借出" />未借出
					<input type="radio" name="zhuangtai" value="借出" />借出
				</div>
			</div>   -->
			
			
			<div class="form-group">
				<label for="zhuangtai" class="col-sm-4 control-label">状态:</label>
				<div class="col-sm-4">
					<input class="form-control" id="zhuangtai" name="zhuangtai"
						value="${b.zhuangtai}">
				</div>
			</div>
			 
			 
			<div class="form-group">
				<label for="jieshuren" class="col-sm-4 control-label">借书人:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="jieshuren" name="jieshuren"
						value="${b.jieshuren}">
				</div>
			</div>
		
		
	  <div class="form-group">
				<label for="fId" class="col-sm-4 control-label">分类名:</label>
				<div class="col-sm-4">
					<select name="fId" id="fId" class="form-control" >
					<option value="0"  >请选择</option>
						<c:forEach  items="${f}"   var="f" >
						 <c:if test="${f.fid==b.fenleis.fid}">
								<option value="${f.fid}" selected="selected">${f.fname}</option>
							</c:if>
							<c:if test="${f.fid!=b.fenleis.fid }">
							 	<option value="${f.fid}">${f.fname}</option>
							 </c:if>
						</c:forEach>
					</select>
				</div>

			</div> 
		
		 
			<!-- <div class="form-group">
				<label class="col-sm-4 control-label"></label>
				<div class="col-sm-4">
				<button type="submit" class="btn btn-primary btn-block">修改</button>
				<button type="reset" class="btn btn-primary btn-block">重填</button>
				</div>
			</div>   -->
			
			
			 <br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning" style="width:130px;">修改</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-danger" style="width:130px;">重填</button></li>
						</ul>
					</div>
			

	</form> 
	 </div>
</body>
</html>