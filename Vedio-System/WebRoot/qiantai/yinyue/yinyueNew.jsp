<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!docTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/qiantai.css" />
	
	<style rel="stylesheet" type="text/css">
		.c1-bline{border-bottom:#999 1px dashed;border-top:1px;}
		.f-right{float:right}
		.f-left{float:left}
		.clear{clear:both}
	</style>
	
	<script type="text/javascript">
           function go(index)
           {
               document.form123.index.value=index;
               document.form123.action="<%=path %>/yinyueNew.action"
               document.form123.submit();
           }  
    </script>
  </head>
  
  <body>
     <div id="main_content">
		<div id="top_banner">
       		<jsp:include flush="true" page="/qiantai/top1.jsp"></jsp:include>
        </div>
        
        <div id="page_content">
            <jsp:include flush="true" page="/qiantai/top2.jsp"></jsp:include>
            <div id="left_section">
                <!-- 11 -->
				            	<!-- <div class="title">KEW在线音乐分享</div> -->
				                <div class="text_content">
				                    <c:forEach items="${requestScope.page.data}" var="yinyue" varStatus="sta">
									   <div class="c1-bline" style="padding:7px 0px;">
									       <div class="f-left">
										     <img src="<%=path %>/img/head-mark4.gif" align="middle" class="img-vm" border="0"/> 
									             <a href="<%=path %>/yinyueDetailQian.action?id=${yinyue.id}">${yinyue.mingcheng}</a>
									       </div>
									      <div class="f-right">${yinyue.shijian}</div>
									      <div class="clear"></div>
									  </div>
									</c:forEach>    
				                </div>
                <!-- 11 -->
            </div>
            <div id="right_section">
            	<jsp:include flush="true" page="/qiantai/right.jsp"></jsp:include>
            </div>
            <div class="clear"></div>   
        </div>
		<div id="footer">
		    	<div class="copyright" align="center">
		           <a href="<%=path %>/login.jsp" style="text-decoration: none;color: white">系统后台</a>
		        </div>
		</div>
     </div>
  </body>
</html>
