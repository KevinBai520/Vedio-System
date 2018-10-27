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
        function down1(fujianPath,fujianYuashiMing)
        {
               <c:if test="${sessionScope.userType !=1}">
                    alert("请先登录");
               </c:if>
               <c:if test="${sessionScope.userType ==1}">
                    var url="<%=path %>/updown/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
			        url=encodeURI(url); 
	                url=encodeURI(url); 
	                window.open(url,"_self");
               </c:if>
        }  
        
        function shoucangAdd(yinyueId)
           {
                <c:if test="${sessionScope.userType!=1}">
	                  alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.userType==1}">
	                  var url="<%=path %>/shoucangAdd.action?yinyueId="+yinyueId;
	                  window.location.href=url; 
	            </c:if>
           }
           
           
            function pingjiaAll(yinyueId)
	        {
	            var strUrl = "<%=path %>/pingjiaAll.action?yinyueId="+yinyueId;
	            var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:300px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
	        }
        function pingjiaAdd(yinyueId)
        {
            var strUrl="<%=path %>/qiantai/pingjia/pingjiaAdd.jsp?yinyueId="+yinyueId;
            var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:300px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
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
            	<!-- <div class="title">企业介绍</div> -->
                <div class="text_content">
                    <fieldset style="width:95%; margin-left:5px;"><legend class="fieldtitle"></legend>
                         <p>名称：${requestScope.yinyue.mingcheng }</p>
		         <p>歌手：${requestScope.yinyue.geshou }</p>
		         <p>内容介绍：<c:out value="${requestScope.yinyue.jieshao }" escapeXml="false"></c:out></p>
		         <p>发布时间：${requestScope.yinyue.shijian }</p>
		         <p>点击量：${requestScope.yinyue.dianji }</p>
		         <p>
		             <object id="player" height="280" width="420" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">
							<param NAME="AutoStart" VALUE="-1">
							<!--是否自动播放-->
							<param NAME="Balance" VALUE="0">
							<!--调整左右声道平衡,同上面旧播放器代码-->
							<param name="enabled" value="-1">
							<!--播放器是否可人为控制-->
							<param NAME="EnableContextMenu" VALUE="-1">
							<!--是否启用上下文菜单-->
							<param NAME="url" VALUE="<%=path %>/${requestScope.yinyue.fujian}">
							<!--播放的文件地址-->
							<param NAME="PlayCount" VALUE="1">
							<!--播放次数控制,为整数-->
							<param name="rate" value="1">
							<!--播放速率控制,1为正常,允许小数,1.0-2.0-->
							<param name="currentPosition" value="0">
							<!--控件设置:当前位置-->
							<param name="currentMarker" value="0">
							<!--控件设置:当前标记-->
							<param name="defaultFrame" value="">
							<!--显示默认框架-->
							<param name="invokeURLs" value="0">
							<!--脚本命令设置:是否调用URL-->
							<param name="baseURL" value="">
							<!--脚本命令设置:被调用的URL-->
							<param name="stretchToFit" value="0">
							<!--是否按比例伸展-->
							<param name="volume" value="50">
							<!--默认声音大小0%-100%,50则为50%-->
							<param name="mute" value="0">
							<!--是否静音-->
							<param name="uiMode" value="mini">
							<!--播放器显示模式:Full显示全部;mini最简化;None不显示播放控制,只显示视频窗口;invisible全部不显示-->
							<param name="windowlessVideo" value="0">
							<!--如果是0可以允许全屏,否则只能在窗口中查看-->
							<param name="fullScreen" value="0">
							<!--开始播放是否自动全屏-->
							<param name="enableErrorDialogs" value="-1">
							<!--是否启用错误提示报告-->
							<param name="SAMIStyle" value>
							<!--SAMI样式-->
							<param name="SAMILang" value>
							<!--SAMI语言-->
							<param name="SAMIFilename" value>
							<!--字幕ID-->
					   </object>
                 </p>
                 <p>
                     <input type="button" value="下载该音乐" onclick="down1('${yinyue.fujian}','${yinyue.fujian}')"/>
                     <input type="button" value="收藏该音乐" onclick="shoucangAdd('${yinyue.id}')">
                     <input type="button" value="查看评价" style="width: 80px;height: 30px;" onclick="pingjiaAll(${requestScope.yinyue.id })"/>
					 <input type="button" value="我要评价" style="width: 80px;height: 30px;" onclick="pingjiaAdd(${requestScope.yinyue.id })"/>
											       
                 </p>
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
