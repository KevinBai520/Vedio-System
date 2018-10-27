<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="../js/jquery-3.2.0.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
	
	<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
	<script type="text/javascript">
	        function login()
	        {
	           if(document.userLogin.loginname.value=="")
	           {
	               alert("请输入账号");
	               return;
	           }
	           if(document.userLogin.loginpw.value=="")
	           {
	               alert("请输入密码");
	               return;
	           }
	           document.getElementById("indicator").style.display="block";
	           loginService.login(document.userLogin.loginname.value,document.userLogin.loginpw.value,1,callback);
	        }
	        
	        function callback(data)
			{
			    document.getElementById("indicator").style.display="none";
			    
			    if(data=="no")
			    {
			        //alert("账号或密码错误");
			        var url="<%=path %>/common/fail.jsp";
			        window.location.href=url;
			    }
			    if(data!="no")//返回的data就是用户的id
			    {
			        //alert("通过验证,登录成功");
			        //window.location.reload();
			        var url="<%=path %>/common/succ.jsp";
			        window.location.href=url;
			    }
			}
	        
	</script>
  </head>
  
  <body>
		<div class="container-fluid">
			<p>&nbsp;</p>
<form class="form-horizontal" name="userLogin" method="POST" action="">
<div class="control-group"><label class="control-label" contenteditable="false" >用户名</label>

<div class="controls"><input id="inputEmail" placeholder="Email" type="text" name="loginname" /></div>
</div>

<div class="control-group"><label class="control-label" contenteditable="false" >密码</label>

<div class="controls"><input id="inputPassword" placeholder="Password" type="password" name="loginpw" /></div>
</div>

<div class="control-group">
<div class="controls"><button class="btn" contenteditable="true" type="submit" onclick="login()">登陆</button>
<img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
</div>
</div>
</form>
			
		</div>
  </body>
</html>
