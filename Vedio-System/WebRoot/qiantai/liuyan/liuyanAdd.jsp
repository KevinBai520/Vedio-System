<%@page import="java.text.SimpleDateFormat"%>
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
           function check()
              {
                  if( document.form1.xingming.value=="")
	               {
	                   alert("请输入您的姓名");
	                   return false;
		           }
	               if( document.form1.neirong.value=="")
	               {
	                   alert("请输入信息内容");
	                   return false;
	               }
	               document.form1.submit();
              } 
    </script>
  </head>
  
  <body>
     <div id="main_content">
		<div id="top_banner">
       		<jsp:include flush="true" page="/qiantai/top1.jsp"></jsp:include>
        </div>
        
        <div id="page_content">
            <jsp:include flush="true" page="/qiantai/tp2.jsp"></jsp:include>
            <div id="left_section">
                <!-- 11 -->
            	<!-- <div class="title">企业介绍</div> -->
                <div class="text_content">
                    <form action="<%=path %>/liuyanAdd.action" name="form1" method="post">
							       <table width="100%" align="center" border="0" cellpadding="4" cellspacing="4">
										<tr align='center'  height="22">
										    <td width="25%" align="right">
										        您的姓名：
										    </td>
										    <td width="75%" align="left">
										         <input type="text" name="xingming" size="20"/>
										    </td>
										</tr>
										<tr align='center'  height="22">
										    <td width="25%" align="right">
										       您的住址：
										    </td>
										    <td width="75%" align="left">
										         <input type="text" name="zuzhi" size="20"/>
										    </td>
										</tr>
										<tr align='center'  height="22">
										    <td width="25%" align="right">
										        联系方式：
										    </td>
										    <td width="75%" align="left">
										         <input type="text" name="dianhua" size="20"/>
										    </td>
										</tr>
										<tr align='center'  height="22">
										    <td width="25%" align="right">
										        电子邮箱：
										    </td>
										    <td width="75%" align="left">
										         <input type="text" name="youxiang" size="20"/>
										    </td>
										</tr>
										<tr align='center'  height="22">
										    <td width="25%" align="right">
										        信息内容：
										    </td>
										    <td width="75%" align="left">
										         <textarea rows="3" cols="40" name="neirong"></textarea>
										    </td>
										</tr>
										<tr align='center'  height="22">
										    <td width="25%" align="right">
										        提交时间：
										    </td>
										    <td width="75%" align="left">
										         <input type="text" name="shijian" size="20" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())%>"/>
										    </td>
										</tr>
										<tr align='center'  height="22">
										    <td width="25%" align="right">
										        &nbsp;
										    </td>
										    <td width="75%" align="left">
										       <input type="button" value="提交" onclick="check()" style="width: 70px;"/>&nbsp; 
										       <input type="reset" value="重置" style="width: 70px;"/>&nbsp;
										    </td>
										</tr>
								 </table>
						      </form>          
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
