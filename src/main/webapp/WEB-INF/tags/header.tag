<%@ tag description="main header" pageEncoding="UTF-8" %>
<%@ attribute name="current" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<base target="_self">
<header>
<script type="text/javascript" src="content/js/lib/jquery-1.11.1.min.js"></script>

<a href="${basePath }" id="logo">
	<span class="logo1"><span>幸福的猫</span></span><span class="logo2"> / </span><span class="logo3"><span>GIGGLING</span></span>
</a>		
<ul id="menu-menu" class="menu">
	<li id="menu-item-1379" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item menu-item-home menu-item-1379">
		<a href="${basePath }">首页</a></li>
	<li id="menu-item-1378" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1378">
	<a href="${basePath }/about/">关于我</a></li>
	<li id="menu-item-1377" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1377">
	<a href="${basePath }/tag/">文章集</a></li>
	
</ul>
	<!-- <div id="search-wrap">
		<a href=""><img id="rss" src="content/img/icon/rss.gif" alt="rss"></a>
		<img id="search" src="content/img/icon/search.gif" alt="search">
		<div id="search-form">
			<form role="search" method="get" id="searchform" action="http://myfairland.net/">
			    <input type="text" placeholder="搜索本站" name="s" id="searchinput">
			</form>
		</div>
	</div> -->
	<div class="clear"></div>
	<!-- /header -->
</header>
