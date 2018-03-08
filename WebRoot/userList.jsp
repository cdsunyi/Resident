<%@ page language="java" import="java.util.*,dao.*,obj.*" pageEncoding="utf-8"%>
<jsp:include page="/js/js.jsp" />
<jsp:include page="/js/time.jsp"/>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String user_id_t = (String)session.getAttribute("user_id");
	if(user_id_t==null || user_id_t.length()<1){
		response.sendRedirect("#");
		return;
	}
	String branch_n = (String) session.getAttribute("branch");//当前登录用户所属部门
	String time = Other.time("yyyy-MM-dd");
	String investorid_s = "";
	String where = "";
	//数据来源
	ArrayList userlist = ManDatabase.getUser();//GetData.getSelectStock(" where isbuy='0' and owner='"+user_id+"' "+where+" order by p2 asc");
%>
<%
		//每页显示记录数
		int PageSize = 18;
		int StartRow = 0; //开始显示记录的编号（从第1行开始显示，第0行为标题）
		int PageNo = 0;//需要显示的页数
		int CounterStart = 0;//每页页码的初始值
		int CounterEnd = 0;//显示页码的最大值
		int RecordCount = 0;//总记录数;
		int MaxPage = 0;//总页数
		int PrevStart = 0;//前一页
		int NextPage = 0;//下一页
		int LastRec = 0;
		int LastStartRecord = 0;//最后一页开始显示记录的编号 
		String url_this = "./OnePercentSimple/MySelectStock.jsp";
		//获取需要显示的页数，由用户提交
		if (request.getParameter("PageNo") == null) { //如果为空，则表示第1页
			if (StartRow == 0) {
				PageNo = StartRow+1; //设定为1
			}
		} else {
			PageNo = Integer.parseInt(request.getParameter("PageNo")); //获得用户提交的页数
			StartRow = (PageNo - 1) * PageSize; //获得开始显示的记录编号
		}
		//因为显示页码的数量是动态变化的，假如总共有一百页，则不可能同时显示100个链接。而是根据当前的页数显示
		//一定数量的页面链接

		//设置显示页码的初始值!!
		if (PageNo % PageSize == 0) {
			CounterStart = PageNo - (PageSize - 1);
		} else {
			CounterStart = PageNo - (PageNo % PageSize) + 1;
		}
		CounterEnd = CounterStart + (PageSize - 1);
		
		
		int p_no = 2;
		if(p_no!=1 || p_no!=2){
			p_no = PageNo;
		}
		RecordCount = userlist.size();    //获取总记录数
		//获取总页数
		MaxPage = RecordCount % PageSize;
		if (RecordCount % PageSize == 0) {
			MaxPage = RecordCount / PageSize;
		} else {
			MaxPage = RecordCount / PageSize + 1;
		}
	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>非居民金融-用户管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		a{TEXT-DECORATION:none}
		A.a04:link,A.a04:visited {text-decoration:none;color:#264600}
		A.a04:active,A.a04:hover {text-decoration:underline;color:#004C51}
	</style>
	
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	.STYLE1 {font-size: 12px}
	.STYLE3 {font-size: 12px; font-weight: bold; }
	.STYLE4 {
		color: #03515d;
		font-size: 12px;
	}
	-->
	</style>
  </head>
<script type="text/javascript">
	function delMySelectStock(id){
	   if (window.confirm("是否删除自选股?")){
		       var url ="./OnePercentSimple/ajax_delMySelectStock.jsp?id="+id;
		   	   request.open("GET", url, false);
			   request.onreadystatechange = updatePage;
			   request.send(null);
	   }
   }
</script> 
<script type="text/javascript">
  	function u_zcw(id,zcw,p3){
   		//设置操作字体的颜色
		document.getElementById(zcw).style.color='#EA0000';
		var p3 =  prompt("请输入支撑位：",p3);           //将输入的合同档案号赋给变量 duty ，
		 //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值
		if(p3!=null){        //如果返回的有内容
			var url ="OnePercentSimple/ajax_updatezcw.jsp?id="+id+"&p3="+p3;
			request.open("GET", url, false);
			request.onreadystatechange = updatePage;
			request.send(null); 
		}else{
			
		}
		//设置操作字体的颜色
		document.getElementById(zcw).style.color='#000000';
  }
</script>
<script>
	var  highlightcolor='#c1ebff';
	//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
	var  clickcolor='#51b2f6';
	function  changeto(){
	source=event.srcElement;
	if  (source.tagName=="TR"||source.tagName=="TABLE")
	return;
	while(source.tagName!="TD")
	source=source.parentElement;
	source=source.parentElement;
	cs  =  source.children;
	//alert(cs.length);
	if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
	for(i=0;i<cs.length;i++){
		cs[i].style.backgroundColor=highlightcolor;
	}
	}
	
	function  changeback(){
	if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
	return
	if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
	//source.style.backgroundColor=originalcolor
	for(i=0;i<cs.length;i++){
		cs[i].style.backgroundColor="";
	}
	}
	
	function  clickto(){
	source=event.srcElement;
	if  (source.tagName=="TR"||source.tagName=="TABLE")
	return;
	while(source.tagName!="TD")
	source=source.parentElement;
	source=source.parentElement;
	cs  =  source.children;
	//alert(cs.length);
	if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
	for(i=0;i<cs.length;i++){
		cs[i].style.backgroundColor=clickcolor;
	}
	else
	for(i=0;i<cs.length;i++){
		cs[i].style.backgroundColor="";
	}
	}
</script>
 <body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
					<td height="30" background="./tab/images/tab_05.gif" width="100%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12" height="30">
									<font size="2"><img width="12" height="30"
											src="./tab/images/tab_03.gif"> </font>
								</td>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="46%" valign="middle">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="5%">
															<div align="center">
																<font size="2"><img width="16" height="16"
																		src="./tab/images/tb.gif"> </font>
															</div>
														</td>
														<td width="95%" class="STYLE1">
															<font size="2"><span class="STYLE1">当前位置</span>：[非居民金融]-[用户管理]</font>
														</td>
													</tr>
												</table>
											</td>
											<!-- 可删 -->
											<td width="54%">
												<table border="0" align="right" cellpadding="0"
													cellspacing="0">
													<tr>
														<td width="60">
															<table width="87%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<font size="2"><input type="checkbox"
																					name="checkbox62" value="checkbox"> </font>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<font size="2">全选</font>
																		</div>
																	</td>
																</tr>
															</table>
														</td>
														<td width="60">
															<table width="90%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<font size="2"><img width="14" height="14"
																					src="./tab/images/22.gif"> </font>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<font size="2"><a href="user.jsp"  class="a04">新增</a></font>
																		</div>
																	</td>
																</tr>
															</table>
														</td>
														<td width="60">
															<table width="90%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<font size="2"><img width="14" height="14"
																					src="./tab/images/33.gif"> </font>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<font size="2">修改</font>
																		</div>
																	</td>
																</tr>
															</table>
														</td>
														<td width="52">
															<table width="88%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<font size="2"><img width="14" height="14"
																					src="./tab/images/11.gif"> </font>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<font size="2">删除</font>
																		</div>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
											<!-- 可删 -->
										</tr>
									</table>
								</td>
								<td width="16">
									<font size="2"><img width="16" height="30"
											src="./tab/images/tab_07.gif"> </font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
  <!--  -->
  <tr>
    <td><div align="left"> 
    </div><table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
        	<tr>
				<td height="30" background="./tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">用户ID</span></div></td>	
				<td height="30" background="./tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">用户名</span></div></td>
				<td height="30" background="./tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">用户描述</span></div></td>
				<td height="30" background="./tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">营业部</span></div></td>	
				<td height="30" background="./tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">编  辑</span></div></td>
			</tr>
<%
        int maxdata = StartRow+PageSize;
		if(maxdata>userlist.size()){
			maxdata=userlist.size();
		}
		for(int i = StartRow;i<maxdata;i++){
			User_info usr = (User_info) userlist.get(i);
			String user_id = usr.getUser_id();
			String user_name = usr.getUser_name();
			String user_dis = usr.getUser_dis();
			String branch = usr.getBranch();
%>
          <tr>
          	<td height="30" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=user_id %></span></div></td>
          	<td height="30" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=user_name %></span></div></td>
            <td height="30" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=user_dis %></span></div></td>
			<td height="30" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=branch %></span></div></td>
			<td height="30" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">
			<a href="user.jsp?user_id=<%=user_id%>&ty=update">修改</a>
			</span></div></td>
          </tr>
<%
		}
 %>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
  
  
  <!-- 显示页面页码等 -->
  <tr>
    <td height="35" background="./tab/images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="./tab/images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;共有 <font color="red"><%=RecordCount%> </font>条记录，当前第 <font color="red"> <%=PageNo%>/<%=MaxPage%> </font>页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
<%
			if (PageNo != 1) {
					PrevStart = PageNo - 1;
 %>
                  <td width="40"><a href="<%=url_this %>?PageNo=1"  class=a04/><img src="./tab/images/first.gif" width="37" height="15" border="0"/></a></td>
                  <td width="45"><a href="<%=url_this %>?PageNo=<%=PrevStart %>"  class=a04 /><img src="./tab/images/back.gif" width="43" height="15" border="0"/></a></td>
<%
			}
			if (PageNo < MaxPage) { //如果当前页不是最后一页，则显示下一页链接
					NextPage = PageNo + 1;
 %>
                  <td width="45"><a href="<%=url_this %>?PageNo=<%=NextPage %>"  class=a04/><img src="./tab/images/next.gif" width="43" height="15" border="0"/></a></td>
<%
			}
			if (PageNo < MaxPage) {
				LastRec = RecordCount % PageSize;
				if (LastRec == 0) {
					LastStartRecord = RecordCount - PageSize;
				} else {
					LastStartRecord = RecordCount - LastRec;
				}
%>
                  <td width="40"><a href="<%=url_this %>?PageNo=<%=MaxPage %>"  class=a04/><img src="./tab/images/last.gif" width="37" height="15" border="0"/></a></td>
<%
				}
 %>
                  <td width="100"><div align="center"><span class="STYLE1">转到第
                    <input name="p_no" type="text" value="<%=p_no %>" size="4" style="height:15px; width:30px; border:1px solid #999999;" /> 
                    页 </span></div></td>
                  <td width="40"><img src="./tab/images/go.gif" onclick="javascript:jump();"  width="37" height="15" border="0"/></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="./tab/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
<!-- 显示页面页码等结束 -->
</table>
</body>
</html>
