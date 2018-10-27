<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
	
	<script language="javascript">
		function check1()
	    {
	        if(document.form1.loginname.value=="")
	        {
	            alert("请输入账号");
	            return false;
	        }
	        if(document.form1.loginpw.value=="")
	        {
	            alert("请输入密码");
	            return false;
	        }
	        document.form1.submit();
	    }
        </script>
	
  </head>
  
  <body>
    
                    <form action="<%=path %>/huiyuanEditMe.action" name="form1" method="post">
												<table width="60%" border="1" align="left" cellpadding="0" cellspacing="1">
													<tr>
														<td width="10%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															账号：
														</td>
														<td width="90%" bgcolor="#FFFFFF">
															&nbsp;
															<input type="text" name="loginname" style="width: 200px;" value="${sessionScope.huiyuan.loginname }" readonly="readonly"/>
														    (账号只读)
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															密码：
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="password" name="loginpw" style="width: 200px;" value="${sessionScope.huiyuan.loginpw }"/>
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															姓名：
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="text" name="xingming" style="width: 200px;" value="${sessionScope.huiyuan.xingming }"/>
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															性别：
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="radio" name="xingbie" value="男" style="border: 0px;" checked="checked"/>男
															&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="radio" name="xingbie" value="女" style="border: 0px;" checked="checked"/>女
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															年龄：
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="text" name="nianling" style="width: 200px;" 
															onkeyup="value=value.replace(/[^\d]/g,'') " 
															onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
															value="${sessionScope.huiyuan.nianling }"/>
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															住址：
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="text" name="address" style="width: 200px;" value="${sessionScope.huiyuan.address }"/>
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
															电话：
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="text" name="dianhua" style="width: 200px;" value="${sessionScope.huiyuan.dianhua }"/>
														</td>
													</tr>
													<tr>
														<td height="30" align="right" bgcolor="#F9F9F9">
															&nbsp;
														</td>
														<td bgcolor="#FFFFFF">
															&nbsp;
															<input type="hidden" name="id" value="${sessionScope.huiyuan.id }"/>
															<input type="button" value="确定" onclick="check1();"/>
															<input type="reset" value="重置"/>
														</td>
													</tr>
												</table>
										  </form>     
                
  </body>
</html>
