<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"/>
	<title>RememberMe後台管理系統</title>
	
	<link rel="stylesheet" href="../styles/layout.css" type="text/css" media="screen" />
	<!--[if lt IE 9]>
	<link rel="stylesheet" href="../styles/ie.css" type="text/css" media="screen" />
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script src="../js/jquery-1.5.2.min.js" type="text/javascript"></script>
	<script src="../js/hideshow.js" type="text/javascript"></script>
	<script src="../js/jquery.tablesorter.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jquery.equalHeight.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="../js/jquery.tmpl.js"></script>
	<script type="text/javascript">

	$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});
</script>
<script>
$(function(){
 		var pageNumber = $(".pg").val();
		$(".pg_num").each(function(){
		var a = $(this).find("a").text()
		if(a.trim() == pageNumber){
		$(this).addClass("current_page")
		}
	})	
});
</script>
</head> 
<body>
	<jsp:include page="/includes/adminTop.jsp" />
	<jsp:include page="/includes/adminLeft.jsp" />
		<c:set var="s1" value="${dateCreate}"/>
		<c:set var="s2" value="${fn:substring(s1,0,16)}"/>
	
		<section id="main" class="column"> 
		
		<article class="module width_full">
		<header>
				<input type="hidden" class="pg" value="${currentPage}"/>
				<span class="head">產品管理區</span>
				<span class="sub1">目前總資料筆數: ${datas}</span>
				<span class="sub2">上次更動日期 : ${s2}</span>
				<span class="sub2">
				<a class="button" href="<c:url value='/admin/createProductData.jsp'/>">
				<img src="../icons/add_file.png"/>新增資料
				</a>	
				</span>		
		</header>
			<div class="module_content">
							
	        <hr>				
	        			<c:if test="${not empty select}">			
<table>
	<thead>
	<tr>
		<th>編號</th>
		<th>名字</th>
		<th>英文</th>
		<th>價格</th>
		<th>庫存量</th>
		<th>修改時間</th>
		<th></th>
		
	</tr>
	</thead>
	<tbody>
	<c:forEach var="element" items="${select}">
		<c:set var="s1" value="${element.updateDate}"/>
		<c:set var="s2" value="${fn:substring(s1,0,16)}"/>
	<tr class="tb_tr">
<%-- 	    <a href="${path}">${element.number}</a> --%>		
		<td class="getNum">${element.productId}</td>
		<td>${element.productNameTw}</td>
		<td>${element.productNameUs}</td>
		<td>${element.productPrice}</td>
		<td>${element.stock}</td>
		<td>${s2}</td>		
		<td>
		<a href="${pageContext.request.contextPath}/admin/modifyProductData.jsp?productId=${element.productId}&page=${currentPage}">
    			<button class="edit">修改</button>
    		</a>   		
 		<a href="${pageContext.request.contextPath}/products.controller/ModProduct?action=delete&productId=${element.productId}&page=${currentPage}">
  			<button class="delete">刪除</button>
   		</a> 
    		</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>
	<c:if test="${not empty pages}">
			  <ul class="pager">
			    
<%--  			    <c:set var="i" scope="session" value="${pages}"/>  --%>
<%-- 			  	<c:if test="${i != 1}"> --%>
<!-- 			   		 <li class="previous"><a href="javascript:;"><span aria-hidden="true"></span>上一頁</a></li> -->
<%-- 				</c:if> --%>
				
				<c:forEach var="j" begin="1" end="${pages}">
					<li class="pg_num">
						<a href="../products.controller/ProductManager?page=${j}">
							<c:out value="${j}"/>
						</a>
					</li>	
  				
  				</c:forEach>
  					
<%--   				<c:if test="${i != pages}"> --%>
<!-- 			    		<li class="next"><a href="javascript:;">下一頁<span aria-hidden="true"></span></a></li> -->
<%-- 			    </c:if> --%>
			 
			  </ul>
</c:if>
<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
				
				<div class="clear"></div>
			</div>
		</article><!-- end of stats article -->	 
	 	</section> 
</body>

</html>