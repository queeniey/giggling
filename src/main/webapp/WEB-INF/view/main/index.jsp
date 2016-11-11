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
		
			<!-- posts -->
			<div id="posts">
				<!-- pagination -->
				<a href="${basePath }?page=${pNu -1 }"><img class="previouspostslink" src="content/img/icon/previous.gif"></a>
				<a href="${basePath }?page=${pNu +1 >pcount?pNu:pNu +1 }">
				<img class="nextpostslink" src="content/img/icon/arrow.gif"></a>
		
				<c:forEach items="${list}" var="vo">
					<div class="post">
						<a href="${basePath }/detail?id=${vo.id }">
							<div class="inside">
								<!-- show thumbnail of the post, if any -->
								<span class="photospan">
									<img class="thumbnail" src="${vo.thumb }" onerror="javascript:$(this).remove();" style="display: inline; width: 149px;">
								</span>
								<div class="overflow">
									<h2 class="storytitle">${vo.title }</h2>
									<p><c:out value="${vo.desc }"/></p>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
				<!-- /a single post -->
			</div> <!-- /posts -->
		
		
			<div id="footer">
				<div class="widget">
					<div class="textwidget"><a href="/accept-donation/" style="margin-right: 10px;"><span style="font-size: 20px;"></span></a>
				</div>
				</div><div class="widget">或曰：“以德报怨，何如？”子曰：“何以报德？以直报怨，以德报德。”——《论语》 </div>
			</div>
		
		</div></div></div>
	</jsp:body>
</t:layout>
