<!DOCTYPE html>
<!-- saved from url=(0042)http://d.tzb.com/admin.php?c=index&a=login -->
<html lang="zh-CN" slick-uniqueid="3">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>管理员登录</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="" name="description">
  <meta content="" name="author">
  <link href="content/css/lib/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="content/css/lib/components.min.css" rel="stylesheet" type="text/css">
  <link href="content/css/lib/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="content/css/login.css" rel="stylesheet" type="text/css">
  <style>@-moz-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-webkit-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-o-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}embed,object{animation-duration:.001s;-ms-animation-duration:.001s;-moz-animation-duration:.001s;-webkit-animation-duration:.001s;-o-animation-duration:.001s;animation-name:nodeInserted;-ms-animation-name:nodeInserted;-moz-animation-name:nodeInserted;-webkit-animation-name:nodeInserted;-o-animation-name:nodeInserted;}</style>
</head>
    <body>
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

                     <input class="form-control placeholder-no-fix valid" type="text" autocomplete="off" placeholder="用户名" name="username" aria-required="true" aria-invalid="false" aria-describedby="username-error">
                 </div>
             </div>
             <div class="form-group">
                 <label class="control-label visible-ie8 visible-ie9">密码</label>
                 <div class="input-icon"> <i class="fa fa-lock"></i>

                     <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password">
                 </div>
             </div>
             <div class="form-actions">
                 <button type="submit" class="btn green pull-right">登录</button>
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
</body>
</html>
