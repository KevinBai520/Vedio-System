<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
    String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <script type="text/javascript" src="<%=path %>/js/popup_shuaxin.js"></script>
	 <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
     <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
     <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
     <script type="text/javascript">
	   function userlogin()
       {
            var url="<%=path %>/qiantai/userlogin/userlogin.jsp";
            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:330,height:140});
            pop.setContent("contentUrl",url);
            pop.setContent("title","会员登录");
            pop.build();
            pop.show();
       }
       
       function userLogout()
       {
            loginService.userLogout(callback111);
       }
       
       
       function callback111(data)
	   {
		    alert("成功退出系统");
		    var url="<%=path %>/index.action";
		    window.location.href=url;
	   }
	   
	   
	   function gerenzhuye()
		{
		    var targetWinUrl="<%=path %>/auser/index.jsp";
			var targetWinName="newWin";
			var features="width="+screen.width+" ,height="+screen.height+" ,toolbar=yes, top=0, left=0, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=yes";
			var new_win=window.open(targetWinUrl,targetWinName,features);
		}
        
    </script>
  </head>
  
  <body>
            <div>
                <ul class="menu">
                    <li><a href="<%=path %>/yinyueNew.action" class="nav" 
                        style="width: 60px;font-family: 微软雅黑;font-size: 12px;">音乐列表</a>
                    </li>
                    <li><a href="<%=path %>/yinyueDianji.action" class="nav" 
                        style="width: 50px;font-family: 微软雅黑;font-size: 12px;">排行榜</a>
                    </li>
                    <li><a href="<%=path %>/xinwenAll.action" class="nav" 
                        style="width: 60px;font-family: 微软雅黑;font-size: 12px;">新闻资讯</a>
                    </li>
                    <li><a href="<%=path %>/qiantai/userreg/userreg.jsp" class="nav" 
                        style="width: 60px;font-family: 微软雅黑;font-size: 12px;">会员注册</a>
                    </li>
                    <li><a href="<%=path %>/qiantai/liuyan/liuyanAdd.jsp" class="nav" 
                        style="width: 60px;font-family: 微软雅黑;font-size: 12px;">留言反馈</a>
                    </li>
                    
                    
                    
                    <c:if test="${sessionScope.userType !=1 }">
                    <li><a href="#" onclick="userlogin()" class="nav"
                        style="width: 60px;font-family: 微软雅黑;font-size: 12px;">会员登录</a>
                    </li> 
                    </c:if>
                    
                    <c:if test="${sessionScope.userType ==1 }">    
                    <li><a href="#" class="nav"
                        style="width: 80px;font-family: 微软雅黑;font-size: 12px;">欢迎你：${sessionScope.huiyuan.xingming }</a>
                    </li>
                    <li><a href="#" onclick="userLogout()" class="nav"
                        style="width: 60px;font-family: 微软雅黑;font-size: 12px;">注销退出</a>
                    </li>
                    <li><a href="#" onclick="gerenzhuye()" class="nav"
                        style="width: 60px;font-family: 微软雅黑;font-size: 12px;">个人中心</a>
                    </li>
                    <li><a href="<%=path %>/shoucangMine.action" class="nav"
                        style="width: 60px;font-family: 微软雅黑;font-size: 12px;">我的收藏夹</a>
                    </li> 
                    </c:if>                    
                </ul>
            </div>
  </body>
</html>
