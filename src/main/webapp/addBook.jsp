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
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<title>添加图书</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	$(function() {
		$("#login").bootstrapValidator({

			feedbackIcons : {
				valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
			},
			fields : {
				name : {
					validators : {
						notEmpty : {
							message : '书名不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{1,20}$/,
							message : '书名必须是1~20个汉字'
						},
					}
				},
				price : {
					validators : {
						notEmpty : {
							message : '书的价格不能为空'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '书的价格必须是数字'
						},

					}
				},

				chuban : {
					validators : {
						notEmpty : {
							message : '出版社不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{5,10}$/,
							message : '出版社必须是5~10位汉字'
						},
					}
				},
				zhuangtai : {
					validators : {
						notEmpty : {
							message : '必须选择书籍的状态'
						},
					}
				},

				jieshuren : {
					validators : {
						notEmpty : {
							message : '借书人不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{2,10}$/,
							message : '借书人的名字必须是2~10位汉字'
						},
					}
				},

				fname : {
					validators : {
						notEmpty : {
							message : '图书分类不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{2,10}$/,
							message : '分类的名字必须是2~10位汉字'
						},
					}

				}
			}

		});
	});
</script>
</head>
<body background='images/03.jpg'>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="login" action="add" method="post">
					<h3 class="text-center text-success">添加图书</h3>

					<div class="form-group">
						<label>图&nbsp;书&nbsp;名&nbsp;称:</label> <input type="text"
							name="name" class="form-control" />
					</div>

					<div class="form-group">
						<label>图&nbsp;书&nbsp;价&nbsp;格:</label> <input type="text"
							name="price" class="form-control" />
					</div>
					
					<div class="form-group">
						<label>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</label> <input
							type="text" name="chuban" class="form-control" />
					</div>


					<div class="form-group">
						<label>状&nbsp;&nbsp;态：</label>
						<div class="radio">
							<label class="radio-inline"><input type="radio"
								name="zhuangtai" value="未借出" />未借出</label> <label class="radio-inline"><input
								type="radio" name="zhuangtai" value="借出" />借出</label>
						</div>
					</div>
					<div class="form-group">
						<label>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</label> <input
							type="text" name="jieshuren" class="form-control" />
					</div>

					<div class="form-group">

						<label for="Fenlei" class="col-sm-4 control-label">分&nbsp;&nbsp;类&nbsp;&nbsp;名&nbsp;&nbsp;称</label>

						<input name="Fenlei" id="Fenlei" class="form-control" />


					</div>

					<div>
						<label>分类Id</label> <select name="Fenlei" class="form-control">

							<c:forEach items="${flist}" var="f">

								<option value="${f.fid}">${f.fname}</option>

							</c:forEach>
						</select>
					</div>
					<br> <br>
					<div class="form-group">
						<div class="col-sm-12">
							<center>
								<button type="submit" class="btn btn-info">添加图书</button>
							</center>
						</div>
					</div>

					<br> <br>
					<div class="form-group">
						<div class="col-sm-12">
							<center>
								<button type="reset" class="btn btn-info">重置</button>
							</center>
						</div>
					</div>

				</form>

			</div>

		</div>

	</div>

	<!-- 
	<form action="addBook" method="post">
		<table align="center" width="500px" height="550px"
			cellspacing="0">
			<br>
			<tr height="20%">
				<td colspan="2" align="center"><font size="7" face="幼圆">添加图书</font></td>
			</tr>
			<td colspan=2 valign="top">
			<table class="table table-striped table-hover table-bordered"   width="500px" height="300px"
					align="center" cellspacing="0">							
			<tr>
				<td align="center"><font size="4" >选择分类:</font></td>
				<td align="center"><select name="fname" id="fenleiList">
						<option>---请选择您要添加的分类---</option>
					
				</select></td>
			</tr>
			<tr align="center">
				<td align="center"><font size="4" >图书名称:</font></td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr align="center">
				<td><font size="4">图书价格:</font></td>
				<td><input type="text" name="price" /></td>
			</tr>
			<tr align="center">
				<td><font size="4">出版社:</font></td>
				<td colspan="2"><input type="text" name="chuban" /></td>
			</tr>
			<tr align="center">
				<td><font size="4">状态:</font></td>
				<td colspan="2"><input type="radio" name="zhuangtai" checked
					value="未借出"/>未借出<input type="radio" name="zhuangtai" value="借出"/>借出</td>
			</tr>
			<tr align="center">
				<td><font size="4">借书人:</font></td>
				<td colspan="2"><input type="text" value="无" name="jieshuren" /></td>
			</tr>
			<tr align="center">
				<td colspan="2" align="center"><input type="submit"class="btn btn-primary btn-sm" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" class="btn btn-success btn-sm"  value="重填" /></td>
			</tr>
			
			</table>
		</table>
	</form>    -->
</body>
</html>