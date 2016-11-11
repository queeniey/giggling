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
        <script type="text/javascript" charset="utf-8" src="content/lib/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="content/lib/ueditor/ueditor.all.min.js"> </script>
	    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	    <script type="text/javascript" charset="utf-8" src="content/lib/ueditor/lang/zh-cn/zh-cn.js"></script>
        <style>
        	.right_div{margin:10px 5px;}
        	.va_md{vertical-align: middle;}
        </style>
    </jsp:attribute>
	<jsp:body>
		<t:common />
	<div class="container">
	  <t:adminHead cur="2"/>
	  	 <!-- 添加文章 -->
		 <div class="row clearfix">
		   <div class="col-md-4 column">
		   		<input type="hidden" value="${vo.id }" class="va_md" id="article_id" />
			   <div class="right_div">
					<span>文章标题</span>
					<input class="va_md" id="title" value="${vo.title }" />
				</div>
				<div class="right_div">
					<span>文章摘要</span>
					<textarea class="va_md" id="desc">${vo.desc }</textarea>
				</div>
				<div class="right_div">
					<span>图片链接</span>
					<input class="va_md" id="thumb" value="${vo.thumb }" />
				</div>
				<div class="right_div">
					<span>添加标签</span>
					<div id="tag">
						<button type="button" class="btn btn-default btn-info btn-sm">生活</button>
		     			<button type="button" class="btn btn-default btn-sm">日记</button>
					</div>
				</div>
		   </div>
		   <button id="submit" type="button" class="btn btn-lg btn-block btn-primary" 
		   	style="width:200px; position: absolute;bottom: 25px;left: 10%;">提交</button>
		   	
		   <div class="col-md-8 column">
			<script id="editor" type="text/plain" style="width:600px;height:500px;">${vo.content }</script>
		   </div>
		   <hr>
		 </div>
		 <!-- 添加文章 -->
	 </div>
		<script>
		//实例化编辑器
	    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	    var ue = UE.getEditor('editor',{
	        toolbars: [
	                   ['source', 'undo', 'redo', 'bold','indent',
	                    'italic','formatmatch','horizontal',
	                    'simpleupload','fontfamily','fontsize'],
	                   [
	                    'emotion','justifyleft','justifyright',
	                    'justifycenter', //居中对齐
	                    'forecolor', //字体颜色
	                    'backcolor', //背景色
	                    'insertorderedlist', //有序列表
	                    'insertunorderedlist', //无序列表
	                    'fullscreen', //全屏
	                    'inserttable' //插入表格
	                    ]
	               ],
	               autoHeightEnabled: true,
	               autoFloatEnabled: true
        });
		$("#submit").click(function(){
			$.post(basePath + '/user/submitArtical', {'content':ue.getContent(),'title':$("#title").val(),'desc':$("#desc").val(),'thumb':$("#thumb").val(),'id':$("#article_id").val()}, function(rst){
				if(rst.status == 1){
					setTimeout(function(){
						location.href = basePath + "/user/index";
					}, 2000);
				}
				layer.msg(rst.msg);
				
			});
		});
		</script>
	</jsp:body>
</t:layout>
