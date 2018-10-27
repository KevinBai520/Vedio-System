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
    <style type="text/css">
        .NewContainer370
		{
			DISPLAY: inline; FLOAT: left; MARGIN-LEFT: 10px; 
		}
		
		.NewContainer370 .BoxHeader 
		{
			MIN-HEIGHT: 24px; MARGIN: 0px; WIDTH: 100%; TEXT-ALIGN: left
		}
		.NewContainer370 .BoxHeader .BoxHeader-center 
		{
			 BORDER-RIGHT: #c9e4ea 1px solid; BORDER-TOP: #c9e4ea 1px solid; PADDING-LEFT: 10px;
			 FONT-WEIGHT: bold; FLOAT: left; BACKGROUND-IMAGE: url(<%=path %>/img/cs-lan-dh-bg.jpg); 
			 VERTICAL-ALIGN: middle; BORDER-LEFT: #c9e4ea 1px solid;
			 WIDTH: 210px; /* 需要改的宽度- */ 
			 COLOR: #404040; LINE-HEIGHT: 24px; HEIGHT: 30px
		}
		
		
		.NewContainer370 .Slot 
		{
			BORDER-RIGHT: #c9e4ea 1px solid; PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left;
			PADDING-BOTTOM: 5px; MARGIN: 0px; BORDER-LEFT: #c9e4ea 1px solid; 
			WIDTH: 200px;   /* 需要改的宽度- */ 
			height:180px; PADDING-TOP: 5px; BORDER-BOTTOM: #c9e4ea 1px solid; TEXT-ALIGN: left
		}
		
		.c1-bline{border-bottom:#999 1px dashed;border-top:1px;}
		.f-right{float:right}
		.f-left{float:left}
		.clear{clear:both}
    </style>
  </head>
  
  <body>
                <div class="NewContainer370" style="margin-top: 10px;">
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10">音乐类别</div>
					</div>
					<div class="Slot" style="height: 230px;">
						<c:forEach items="${sessionScope.leibieList }" var="leibie" varStatus="ss">
						   <div class="c1-bline" style="padding:px 5px;">
						       <div class="f-left">
							     <img src="<%=path %>/img/head-mark4.gif" align="middle" class="img-vm" border="0"/> 
						         <a href="<%=path %>/yinyueByLeibie.action?leibieId=${leibie.id }">${leibie.mingcheng}</a>
						       </div>
						      <hr />
						      <div class="clear"></div>
						  </div>
						</c:forEach>
                    </div>
				</div>
				<div class="NewContainer370" style="margin-top: 10px;">
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10"></div>
					</div>
					<div class="Slot" style="height: 100px;">
						<form action="<%=path %>/yinyueRes.action" name="fd" method="post">
						    <table align="left" border="0" cellpadding="1" cellspacing="1">
								<tr align='right'>
									<td style="width: 50px;" align="right">
										名称：										    
									</td>
									<td align="left">
										<input name="mingcheng" type="text" style="width: 80px;"/>
									</td>
								</tr>
								<tr align='right'>
									<td style="width: 50px;" align="right">
										歌手：										    
									</td>
									<td align="left">
										<input name="geshou" type="text" style="width: 80px;"/>
										<input type="submit" value="查询"/>&nbsp; 
									</td>
								</tr>
							</table>
						</form>
                    </div>
				</div>
				<div class="NewContainer370" style="margin-top: 10px;">
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10">日历</div>
					</div>
					<div class="Slot">
						<jsp:include flush="true" page="/qiantai/rili/rili.jsp"></jsp:include>        
                    </div>
				</div>
  </body>
</html>
