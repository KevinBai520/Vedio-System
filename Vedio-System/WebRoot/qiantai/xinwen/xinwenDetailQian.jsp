<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/qiantai.css" />
	
	<style rel="stylesheet" type="text/css">
		
	</style>
	
	<script type="text/javascript">
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
            	<!-- <div class="title">企业介绍</div> -->
                <div class="text_content">
                    <table width="100%" border="0">
					    <tr>
					       <td align="center">信息标题：${requestScope.xinwen.biaoti }<hr/></td>
					    </tr>
					    <tr>
					       <td align="center" style="word-break:break-all;">信息内容：<c:out value="${requestScope.xinwen.neirong }" escapeXml="false"></c:out><hr/></td>
					    </tr>
					    <tr>
					       <td align="center">发布时间:${requestScope.xinwen.shijian }<hr/></td>
					    </tr>
					</table>   
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
