<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:layout>
	<jsp:attribute name="header">
		<title>登录</title>
		<link rel="stylesheet" type="text/css" href="content/css/login.css" />
        <link rel="stylesheet" type="text/css" href="content/lib/bootstrap/css/bootstrap.min.css">
        <script type="text/javascript" src="content/js/lib/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="content/js/lib/public/public.js"></script>
	</jsp:attribute>
	<jsp:body>
		<t:common />
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">账号</label>
							<div class="col-sm-9">
								<input id="account" name="account" type="text" class="form-control" id="inputEmail3" placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">密码</label>
							<div class="col-sm-9">
								<input id="pwd" name="pwd" type="password" class="form-control" id="inputPassword3" placeholder="Password">
							</div>
						</div>
						<!-- <div class="form-group"><div class="checkbox"><div class="col-sm-offset-3 col-sm-9">
							<label><input type="checkbox">Remember me</label>
						</div></div></div> -->
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<span id="loginSubmit" class="btn btn-default">登陆</span>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script>
			$("#loginSubmit").click(function(){
				var ac = $("#account").val(), pwd = $("#pwd").val();
				if(ac && ac.length>4 && pwd && pwd.length>5){
					$.post(basePath + '/loginsubmit',{'account':ac, 'pwd':pwd}, function(rst){
						if(rst.status==1){
							window.location.href = basePath + '/user/index';
						}else{
							alert(rst.msg);
						}
					});
				}else{
					alert("请输入正确的账号密码");
				}
				
				
			});
			
		</script>
	</jsp:body>
</t:layout>
