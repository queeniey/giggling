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
    </jsp:attribute>
	<jsp:body>
		<t:common />
<div class="container">

  <t:adminHead cur="1"/>



<!-- 文章列表 -->
 <div class="row clearfix">
   <div class="col-md-12 column">
     <table class="table table-hover">
       <thead>
         <tr>
           <th>
             编号
           </th>
           <th>
             标题
           </th>
           <th>
             添加时间
           </th>
           <th>
             操作
           </th>
         </tr>
       </thead>
       <tbody>
       	<c:forEach items="${list}" var="vo" varStatus="status">
         <tr class="success">
           <td>
             ${ (page-1)*psize + status.index + 1}
           </td>
           <td>
             ${ vo.title}
           </td>
           <td>
             <date:date pattern="yyyy-MM-dd hh:mm" value="${vo.add_time!=null?vo.add_time*1000 : 0}"></date:date>
           </td>
           <td>
             <a href="user/addArticle?id=${vo.id }" class="btn btn-default btn-info">编辑</a>
             <a href="javascript:void(0);" class="delBtn btn btn-default btn-danger" data-id="${vo.id }">删除</a>
           </td>
         </tr>
         </c:forEach>
       </tbody>
     </table>
     <ul class="pagination">
     	<c:forEach var="i" begin="1" end="${pcount }" step="1">
     		<li${page==i?' class="active"':'' }><a href="user/index?page=${i}">${i}</a></li>
     	</c:forEach>
        
     	<!-- <li><a href="#">&laquo;</a></li>
        <li class="active"><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&raquo;</a></li> -->
    </ul>
   </div>
 </div>
 <!-- 文章列表 -->




 

 <!-- 文章列表 -->

</div>

<script>
	$(".delBtn").click(function(){
		var _this = $(this),  id = _this.attr("data-id");
		layer.confirm('确定删除', {icon: 2, title:'提示'}, function(index){
			$.post("user/delArticle", {id:id}, function(rst){
				layer.msg(rst.msg);
				if(rst.status==1){
					_this.parents("tr").slideUp("slow");
					
				}
			});
		  	layer.close(index);
		});
		
	});
</script>
</jsp:body>
</t:layout>
