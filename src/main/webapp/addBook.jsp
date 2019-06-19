<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrapValidator.css" />
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<title>添加图书</title>
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
                     remote:{
					 		
					 		url:"validateName",
					 		message:'图书名已存在，请重新输入',
					 		type:'POST',
					 		data:function(validator){
					 			return {
					 			name:$("input[name=name]").val(),
					 			}
					 		}
					 		
					 	}

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
						}

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
						}
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
				<form id="login"  action="book"  method="post">
		           <br>
					<h3 class="text-center text-success"><font size="7" face="幼圆">添加图书</font></h3>
                   <hr>

					<div class="form-group">
						<label>图&nbsp;书&nbsp;名&nbsp;称:</label>
						 <input type="text" name="name"  class="form-control"/>
					</div> 
					
					<div class="form-group">
						<label>图&nbsp;书&nbsp;价&nbsp;格:</label>
						 <input type="text" name="price"  class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</label>
						 <input type="text" name="chuban" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</label> 
						
						<div class="radio">
							<label class="radio-inline">
							<input type="radio" name="zhuangtai" value="未借出" checked />未借出
							</label> 
							<label class="radio-inline">
							<input type="radio" name="zhuangtai" value="借出" />借出
							</label>
						</div>
					</div>
					
					<div class="form-group">
						<label>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</label> 
						<input type="text" name="jieshuren" class="form-control"  checked value="无"/> 
					</div>
					<br>
			
                   <ul class="nav">
						<li><b>请选择您想要添加的分类:</b></li>
						<li><select name="fId" class="form-control">
                            <c:forEach items="${flist }" var="f">
                               <option value="${f.fid }">${f.fname }</option>
                            </c:forEach>
                         </select></li>
					</ul>
					
			      <br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning" style="width:130px;">添加</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-danger" style="width:130px;">重填</button></li>
						</ul>
						</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>