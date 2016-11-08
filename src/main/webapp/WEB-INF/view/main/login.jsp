<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:layout>
	<jsp:attribute name="header">
		<title>登录</title>
		<script type="text/javascript" src="content/js/lib/jquery-1.11.1.min.js"></script>
		<!-- <link rel="stylesheet" type="text/css" href="content/css/login.css" />
        <link rel="stylesheet" type="text/css" href="content/lib/bootstrap/css/bootstrap.min.css">
        <script type="text/javascript" src="content/js/lib/public/public.js"></script> -->
        <link href="content/css/lib/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="content/css/lib/components.min.css" rel="stylesheet" type="text/css">
  <link href="content/css/lib/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="content/css/login.css" rel="stylesheet" type="text/css">
  <style>@-moz-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-webkit-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-o-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}embed,object{animation-duration:.001s;-ms-animation-duration:.001s;-moz-animation-duration:.001s;-webkit-animation-duration:.001s;-o-animation-duration:.001s;animation-name:nodeInserted;-ms-animation-name:nodeInserted;-moz-animation-name:nodeInserted;-webkit-animation-name:nodeInserted;-o-animation-name:nodeInserted;}</style>
	</jsp:attribute>
	<jsp:body>
		<t:common />
		    <div class="login">
		     <div class="logo"></div>
		     <div class="content">
		         <form class="login-form" action="" method="post" novalidate="novalidate">
		              <h3 class="form-title">管理员登录</h3>
		
		             <div class="alert alert-danger display-hide" style="padding:10px;">
		                 <button class="close" data-close="alert"></button> <span> 请输入用户和密码。 </span>
		
		             </div>
		             <div class="form-group">
		                 <label class="control-label visible-ie8 visible-ie9">用户名</label>
		                 <div class="input-icon"> <i class="fa fa-user"></i>
		
		                     <input id="account" name="account" class="form-control placeholder-no-fix valid" type="text" autocomplete="off" placeholder="用户名" name="username" aria-required="true" aria-invalid="false" aria-describedby="username-error">
		                 </div>
		             </div>
		             <div class="form-group">
		                 <label class="control-label visible-ie8 visible-ie9">密码</label>
		                 <div class="input-icon"> <i class="fa fa-lock"></i>
		
		                     <input id="pwd" name="pwd" class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password">
		                 </div>
		             </div>
		             <div class="form-actions">
		                 <span id="loginSubmit" class="btn green pull-right">登录</span>
		             </div>
		         </form>
		     </div>
		     <div class="copyright">2016 ©giggling</div>
		    </div>
		    <script type="text/javascript">
		    	//此行代码必须放在引入seajs之前，否则无效
		    	var base_path = "./content/";
		    </script>
		    <script src="content/js/lib/seajs.js" type="text/javascript"></script>
		    <script src="content/js/lib/seajs-css.js" type="text/javascript"></script>
		    <script src="content/js/lib/seajs-config.js" type="text/javascript"></script>
		    <script type="text/javascript">
		      seajs.use("js/lib/jquery.min",function(a,b){
		       	 seajs.use("./content/js/lib/jquery.validate.min");
		         seajs.use("./content/js/lib/bootstrap.min");
		         seajs.use("./content/js/lib/jquery.backstretch.min");
		         seajs.use("./content/js/lib/jquery-validation-additional");
		         seajs.use("./content/js/login");
		       });
		    </script>
		  <div class="backstretch" style="left: 0px; top: 0px; z-index: -999999; position: fixed;"></div>
		
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
