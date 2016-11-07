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
		<link rel="stylesheet" type="text/css" href="content/js/lib/summernote/summernote.css">
        <script type="text/javascript" src="content/js/lib/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="content/js/lib/summernote/summernote.js"></script>
    </jsp:attribute>
	<jsp:body>
    	<div id="customSummerNote" style="display: none;"></div>
		<script>
		$(function(){
	      $("#customSummerNote").summernote({
	        placeholder:"这里输入您要添加的内容",
	        lang:"zh-CN",

	        toolbar: [
	          ['style', ['color','fontsize','bold', 'underline', 'clear','strikethrough','link']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['insert',['picture','table','video']],
	          ['misc',['fullscreen']]
	        ]
	      });
	    });
		</script>
	</jsp:body>
</t:layout>
