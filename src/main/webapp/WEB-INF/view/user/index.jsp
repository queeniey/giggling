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
         <tr class="success">
           <td>
             1
           </td>
           <td>
             TB - Monthly
           </td>
           <td>
             01/04/2012
           </td>
           <td>
             <a href="#" class="btn btn-default btn-info">编辑</a>
             <a href="#" class="btn btn-default btn-danger">删除</a>
           </td>
         </tr>
       </tbody>
     </table>
     <ul class="pagination">
        <li><a href="#">&laquo;</a></li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&raquo;</a></li>
    </ul>
   </div>
 </div>
 <!-- 文章列表 -->




 

 <!-- 文章列表 -->

</div>
</jsp:body>
</t:layout>
