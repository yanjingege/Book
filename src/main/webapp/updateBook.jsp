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
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<title>修改图书</title>
</head>
<body background="images/03.jpg">	
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
			
		 	<div class="form-group">
				<label for="zhuangtai" class="col-sm-4 control-label">状态:</label>
				<div class="col-sm-4">
					<input type="radio" checked name="zhuangtai" value="未借出" />未借出
					<input type="radio" name="zhuangtai" value="借出" />借出
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