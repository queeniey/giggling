<%@ tag description="admin header" pageEncoding="UTF-8" %>
<%@ attribute name="cur" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="content/lib/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="content/js/lib/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="content/lib/bootstrap/js/bootstrap.min.js"></script>

<!-- 后台导航栏 -->
  <div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation">
				<div class="navbar-header">
           <a class="navbar-brand" href="#">GIGGLING</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li <c:if test="${cur==l}">class="active"</c:if>>
							 <a href="">文章列表</a>
						</li>
						<li <c:if test="${cur==2}">class="active"</c:if>>
							 <a href="user/addArticle">添加文章</a>
						</li>
            <li <c:if test="${cur==3}">class="active"</c:if>>
							 <a href="#">草稿箱</a>
						</li>
            <li <c:if test="${cur==4}">class="active"</c:if>>
							 <a href="#">标签列表</a>
						</li>
            <li <c:if test="${cur==5}">class="active"</c:if>>
							 <a href="#">添加标签</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#">退出</a>
						</li>
						<li><a></a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
  <!-- 后台导航栏 -->

