<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        <script language="javascript">
           function yinyueDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/yinyueDel.action?id="+id;
               }
           }
           
           function yinyuePre(id)
           {
                   window.location.href="<%=path %>/yinyuePre.action?id="+id;
           }
		   function out()
	       {
			  document.all.tip.style.display = "none";
		   }		
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="9" background="<%=path %>/images/tbg.gif">&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="4%">序号</td>
					<td width="20%">名称</td>
					<td width="10%">歌手</td>
					<td width="10%">发布时间</td>
					
					<td width="10%">点击量</td>
					<td width="10%">上传者</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.yinyueList" id="yinyue" status="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ss.index+1"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yinyue.mingcheng"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#yinyue.geshou"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#yinyue.shijian"/>
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#yinyue.dianji"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#yinyue.huiyuan.loginname"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="yinyueDel(<s:property value="#yinyue.id"/>)"/>
						<input type="button" value="编辑" onclick="yinyuePre(<s:property value="#yinyue.id"/>)"/>
					</td>
				</tr>
				</s:iterator>
			</table>
			
		    <div id="tip" style="position:absolute;display:none;border:0px;width:80px; height:80px;">
				<TABLE id="tipTable" border="0" bgcolor="#ffffee">
					<TR align="center">
						<TD><img id="photo" src="" height="80" width="80"></TD>
					</TR>
				</TABLE>
			</div>
	</body>
</html>
