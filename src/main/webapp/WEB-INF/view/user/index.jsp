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
        <script type="text/javascript" charset="utf-8" src="content/lib/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="content/lib/ueditor/ueditor.all.min.js"> </script>
	    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	    <script type="text/javascript" charset="utf-8" src="content/lib/ueditor/lang/zh-cn/zh-cn.js"></script>
        
    </jsp:attribute>
	<jsp:body>
		<t:common />
		<div>
			<span>文章标题</span>
			<input id="title" />
		</div>
		<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
		<div>
			<button id="submit">提交发布</button>
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
			$.post(basePath + '/user/submitArtical',{'content':ue.getContent(),'title':$("#title").val()}, function(rst){
				if(rst.status == 1){
					
				}
				alert(rst.msg);
			});
		});
		</script>
	</jsp:body>
</t:layout>
