<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="http://localhost/book/bootstrap/css/bootstrap.css" />
<script type="text/javascript"
	src="http://localhost/book/bootstrap/js/jQuery.js"></script>
<script type="text/javascript"
	src="http://localhost/book/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="http://localhost/book/bootstrap/css/bootstrapValidator.css" />
<script type="text/javascript"
	src="http://localhost/book/bootstrap/js/bootstrapValidator.js"></script>
<title>修改用户信息</title>

<script type="text/javascript" src="http://localhost/book/js/ajax.js"></script>
<script type="text/javascript">
$(function(){/* 文档加载，执行一个函数*/
    $('#f2')
    .bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {/*input状态样式图片*/
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {/*验证：规则*/
           fname: {//验证input项：验证规则
                message: 'The fname is not valid',
               
                validators: {
                    notEmpty: {//非空验证：提示消息
                        message: '分类名不能为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 15,
                        message: '分类名长度必须在2到15之间'
                    },
                    threshold :  2 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                    remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
                        url: 'http://localhost/book/queryone',//验证地址
                        message: '分类名已存在',//提示消息
                        delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                        type: 'GET',//请求方式
                      
                        	data:function(validator){
      						  
      						  return{
      							  
      							  fname:$("input[name=fname]").val()
      						  };
      					  }
                    },
                    regexp: {
                        regexp: /^[\u4e00-\u9fa5]{1,15}$/,
                        message: '分类名必须由汉字组成'
                    }
                }
            },
        }
    });
});
</script>
	

</head>
<body>
	<div class="container">
		<h1 align="center">图书管理系统----分类修改页面</h1>

         <hr width="1000px">

	<form  id="f2" action="http://localhost/book/fenleiupdate"  class="form-horizontal" method="post">
	 <!-- PUT -->
        <input type="hidden" name="_method" value="PUT">
         <!-- 做一个隐藏域，monsterId -->
         <input type="hidden" name="fid" value="${s.fid}">
        
         
			<div class="form-group">
				<label for="fname" class="col-sm-4 control-label">分类名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control  input-sm" 
						name="fname"  value="${s.fname}">
				</div>
				</div>
				
			<div class="form-group" align="center">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="submit" class="btn btn-primary">修改</button>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>