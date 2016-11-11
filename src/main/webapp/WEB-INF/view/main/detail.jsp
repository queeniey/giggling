<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="date" uri="/tags"%>
<t:layout >
	<jsp:attribute name="header">
		<title>${blog}</title>
        <link href="img/u.png" type="image/png" rel="icon">
        <meta name="keywords" content="阅读，分享" />
        <meta name="description" content="阅读，分享">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" type="text/css" href="content/css/main-index.css">

        <script type="text/javascript" src="content/js/lib/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="content/js/lib/jquery-imagesLoaded.js"></script>
        
    </jsp:attribute>
	<jsp:body>
    	<div id="wrapper1"><div id="wrapper2"><div id="content">

			<t:header />
			<div class="main_post">
				<span class="main_post_top"></span>
				<h1 class="storytitle">
					<a href="${basePath }/detail?id=${vo.id }">${vo.title }</a>
				</h1>
				<div class="main_postinfo">
					<a href="#ds-thread">暂无评论</a> <!-- | 标签： -->
					<c:forEach items="${tags}" var="tag">
						<a href="${basePath }/tagArticle?id=${tag.id } rel="tag">${tag.name }</a>
					</c:forEach> | 作者：${vo.author } | 
					<date:date pattern="yyyy-MM-dd hh:mm" value="${vo.add_time!=null?vo.add_time*1000 : 0}"></date:date>
				</div>
				
				<img src="content/img/line.gif" alt="line" class="line">		
						
						<div class="post-content">
							
				${vo.content }
				
				
				<p id="copyright">
				<small class="main_postinfo">本文作者：
				<a href="http://myfairland.net/">${vo.author }</a> | 本文地址: 
				<a href="${url }">${url }</a>
				<br>本站文章除特殊标明者外均为原创，版权所有，如需转载，请以超链接形式注明作者和原始出处及本声明</small></p>
				
				
				
				
				<div class="yarpp-related">
				
				
				
				<style type="text/css" media="screen">
				.yarpp-related { margin-bottom: 15px;}
				.yarpp-related h4 {margin-bottom: 20px;}
				.yarpp-related .item {
					float:left; 
					margin: 0 10px 0 0;
					width:149px
				}
				.yarpp-related a {text-decoration:none}
				.yarpp-related .img-wrapper { 
					background: #eee;
					border-radius: 10px;
					height: 149px;
					margin-bottom: 5px;
					overflow: hidden;
					width: 149px;
				}
				.yarpp-related img {border:none}
				
				</style>
				
				
				
				
				
				<!-- <h4>你可能感兴趣：</h4>
				<div>
							<div class="item"><a href="http://myfairland.net/mythbusters-9/" rel="bookmark">
							<div class="img-wrapper">
								<span class="photospan"><img class="thumbnail" src="http://myfairland.net/wp-content/uploads/2012/06/Image4-149x149.png" style="display: inline; width: 149px;"></span>			</div>
							<div class="title">
								Mythbusters 流言终结者剧情简介：第九季流言及结论			</div>
						</a></div>
							<div class="item"><a href="http://myfairland.net/mythbusters-10/" rel="bookmark">
							<div class="img-wrapper">
											</div>
							<div class="title">
								Mythbusters 流言终结者剧情简介：第十季流言及结论			</div>
						</a></div>
							<div class="item"><a href="http://myfairland.net/mythbusters-8/" rel="bookmark">
							<div class="img-wrapper">
								<span class="photospan"><img class="thumbnail" src="http://myfairland.net/wp-content/uploads/2011/11/Image12-149x149.png" style="display: inline; width: 149px;"></span>			</div>
							<div class="title">
								Mythbusters 流言终结者剧情简介：第八季流言及结论			</div>
						</a></div>
							<div class="item"><a href="http://myfairland.net/midnight-restaurant/" rel="bookmark">
							<div class="img-wrapper">
								<span class="photospan"><img class="thumbnail" src="http://myfairland.net/wp-content/uploads/2010/06/3.jpg" style="display: inline; width: 149px;"></span>			</div>
							<div class="title">
								深夜食堂			</div>
						</a></div>
					</div> -->
				<div style="clear:both"></div>
				</div>
				<div id="bdshare" class="bdshare_b" style="float: none;height: 24px;margin: 0 0 20px 250px;">
				<img src="content/img/share.png">
					</div>
						</div>
						
						<!-- prev and next post -->
						<!-- <div class="navigation">
							上一篇：<a href="http://myfairland.net/office-library-not-registered/" rel="prev">Office“库没有注册”问题</a><br>
							下一篇：<a href="http://myfairland.net/movie-201303/" rel="next">看片总结 2013 年 3 月 007 系列</a>		
							</div> -->
						
						<span class="main_post_bottom"></span>
					</div>
					
					<div class="main_post">
						<span class="main_post_top2"></span>
							<!-- 多说评论框 start -->
							<div class="ds-thread" data-thread-key="${vo.id }" data-title="${vo.title }" data-url="${url }"></div>
							<!-- 多说评论框 end -->
							<!-- 多说公共JS代码 start (一个网页只需插入一次) -->
							<script type="text/javascript">
							var duoshuoQuery = {short_name:"giggling"};
								(function() {
									var ds = document.createElement('script');
									ds.type = 'text/javascript';ds.async = true;
									ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
									ds.charset = 'UTF-8';
									(document.getElementsByTagName('head')[0] 
									 || document.getElementsByTagName('body')[0]).appendChild(ds);
								})();
								</script>
							<!-- 多说公共JS代码 end -->
						<span class="main_post_bottom"></span>
						
					</div>
		
		</div></div></div>
		
		
		
		
		
		
		

	</jsp:body>
</t:layout>
