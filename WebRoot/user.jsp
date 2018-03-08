<%@ page language="java" import="java.util.*,dao.*,obj.*" pageEncoding="utf-8"%>
<jsp:include page="/js/js.jsp" />
<jsp:include page="/js/time.jsp"/>
   <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String user_id_t = (String)session.getAttribute("user_id");
	//if(user_id_t==null || user_id_t.length()<1){
	//	response.sendRedirect("index.jsp");
	//	return;
	//}
	String user_id = request.getParameter("user_id");
	String tp = "add";
	String id_tmp = "";
	String user_id_tmp = "";
	String user_name_tmp = "";
	String pwd_tmp = "";
	String user_dis_tmp = "";
	String branch_tmp = "";
	if (user_id == null || user_id.equals("")) {
		
	} else {
		tp = "update";
		ArrayList list_user = (ArrayList) ManDatabase.get_userinfo(new String(
				user_id.getBytes("iso8859-1"), "utf-8"));
		User_info user = (User_info) list_user.get(0);
		id_tmp = user.getId();
		user_id_tmp = user.getUser_id();
		user_name_tmp = user.getUser_name();
		pwd_tmp = user.getPwd();
		user_dis_tmp = user.getUser_dis();
		branch_tmp = user.getBranch();
	}
	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>非居民金融-个人客户</title>
    
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
	
	.FixedHeaderColumnsTableDiv {
	overflow: auto;
	position: relative;
}

.FixedCell {
	position: relative;
	top: expression(this .     offsetParent .     scrollTop);
	left: expression(this .     parentElement .     offsetParent .     scrollLeft)
		;
	z-index: 1800;
}

.FixedHeaderRow1 {
	position: relative;
	top: expression(this .     offsetParent .     scrollTop);
	background-color: #ccc;
	z-index: 300;
}

.FixedDataColumn {
	position: relative;
	left: expression(this .     parentElement .     offsetParent .    
		parentElement .  
		  scrollLeft);
	z-index: 200;
	background-color: #FFFFFF;
}
	</style>
  </head>
 
 <script type="text/javascript">
	function openReasonWin(select) {
		//新窗口的文档名称 
		var srcFile = "select.jsp";
		//高度，位置等 
		var winFeatures = "dialogHeight:588px;dialogLeft:300px;"; 
		//把输入页面的reason input传给弹出窗口 
		var obj =document.getElementById(select); 
		//将input作为对象传递给新窗口
		//ok,open new windows 
		/* 设置传给子窗口的值 obj.value="要传递的值"; */
		window.showModalDialog(srcFile, obj, winFeatures); 
	}
	
	function display(){
		var radionum =document.getElementsByName("p2");
		var p2;
		for(var i=0;i<radionum.length;i++){
			if(radionum[i].checked){
				p2 =radionum[i].value;
				break;
			}
		}
		var traget=document.getElementById("div1");
		if(p2=="1"){
			traget.style.display="none";
		}else{
			traget.style.display="";
		}
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
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript">
  	function infoSubmit(){
  		$.ajax({
  			cache: false,
  			type: "POST",
  			url:"user_do.jsp", //把表单数据发送到ajax.jsp
  			data:$('#ajaxFrm').serialize(), //要发送的是ajaxFrm表单中的数据
  			async: false,
  			error: function(request) {
  			alert("发送请求失败！");
  			},
  		success: function(data) {
  		alert(data);
  		//$("#ajaxDiv").html(data); //将返回的结果显示到ajaxDiv中
  		}
  		});
  		}
  </script>
 <body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="./tab/images/tab_05.gif" width="100%">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="./tab/images/tab_03.gif" width="12" height="30" /></td>
        <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="left">
            <table width="20%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="./tab/images/tb.gif" width="16" height="16" /></div></td>
                <td width="80%" class="STYLE1"><span class="STYLE1">当前位置</span>：[非居民金融]-[用户管理]</td>
              </tr>
            </table>
            </td>
 
          </tr>
        </table>
        </td>
        <td width="16"><img src="./tab/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table>
    </td>
  </tr>
  <!--  -->
  <tr>
    <td><div align="left"> 
    </div><table width="100%" border="0" cellspacing="0" cellpadding="0">
    	<tr>
            <td height="30" background="./tab/images/bg.gif"  bgcolor="#FFFFFF" colspan="6" align="right"><div align="left"> 
            </div>
            </td>
          </tr>
       <tr>
        <td align="center"><div align="center"> 
        </div><div class="FixedHeaderColumnsTableDiv"	style="width: 1250px;"><div align="center"> 
        </div>
        <form method="post" id="ajaxFrm" name="ajaxFrm">
        <TABLE border=0 cellSpacing=0 cellPadding=0 width=960
													align=center>
													<TBODY>
														<TR bgColor=#eeeeee>
															<TD style="LINE-HEIGHT: 200%" colSpan=2>
																<P
																	style="TEXT-ALIGN: left; MARGIN-BOTTOM: 5px; FONT-SIZE: 14px">
																	<STRONG>用户信息</STRONG>
																</P>
															</TD>
														</TR>

														<TR>
															<TD height=18 colSpan=2>
																<table id=table1>
																	<TR>
																		<INPUT type=hidden id=tp name=tp value=<%=tp %>>
																		<INPUT type=hidden id=id name=id value=<%=id_tmp %>>
																			&nbsp;&nbsp;&nbsp;&nbsp;
																		<TD style="PADDING-RIGHT: 15px; FONT-SIZE: 14px"
																			height=34 width=140 align=right>
																			用户ID
																		</TD>
																		<TD width=660 align=left>
																			<INPUT 
																				style="WIDTH: 180px; HEIGHT: 18px" id=user_id
																				name=user_id maxLength=20 value=<%=user_id_tmp%>>
																		</TD>
																	</TR>
																	<TR>
																		<TD style="PADDING-RIGHT: 15px; FONT-SIZE: 14px"
																			height=34 align=right>
																			用户名
																		</TD>
																		<TD align=left>
																			<INPUT 
																				style="WIDTH: 120px; HEIGHT: 18px" id=user_name
																				name=user_name maxLength=20
																				value=<%=user_name_tmp%>>
																		</TD>
																	</TR>
																	<TR>
																		<TD style="PADDING-RIGHT: 15px; FONT-SIZE: 14px"
																			height=34 align=right>
																			密码
																		</TD>
																		<TD align=left>
																			<INPUT  type=password
																				style="WIDTH: 230px; HEIGHT: 18px" id=pwd name=pwd
																				maxLength=32 value=<%=pwd_tmp%>>
																		</TD>
																	</TR>
																	<TR>
																		<TD style="PADDING-RIGHT: 15px; FONT-SIZE: 14px"
																			height=34 align=right>
																			重复密码
																		</TD>
																		<TD align=left>
																			<INPUT type=password
																				style="WIDTH: 230px; HEIGHT: 18px" id=su_pwd
																				name=su_pwd maxLength=32 value=<%=pwd_tmp%>>
																		</TD>
																	</TR>
																	<TR>
																		<TD style="PADDING-RIGHT: 15px; FONT-SIZE: 14px"
																			height=34 align=right>
																			用户描述
																		</TD>
																		<TD align=left>
																			<INPUT 
																				style="WIDTH: 200px; HEIGHT: 18px" id=user_dis
																				name=user_dis maxLength=20 value=<%=user_dis_tmp%>>
																		</TD>
																	</TR>
																	<TR>
																		<TD style="PADDING-RIGHT: 15px; FONT-SIZE: 14px"
																			height=34 align=right>
																			营业部
																		</TD>
																		<TD align=left>

																			<SELECT style="WIDTH: 114px" name=branch id=branch>
																				<%
																					if (branch_tmp.length() > 0) {
																				%>
																				<option value="<%=branch_tmp%>">
																					<%=branch_tmp%>
																				</option>
																				<%
																					}
																				%>
																				<option value="广发期货总部">广发期货总部</option>
    			 
															    			 	<option value="广州营业部">广州营业部</option>
															    			 
															    			 	<option value="北京营业部">北京营业部</option>
															    			 
															    			 	<option value="郑州营业部">郑州营业部</option>
															    			 
															    			 	<option value="珠海营业部">珠海营业部</option>
															    			 
															    			 	<option value="上海营业部">上海营业部</option>
															    			 
															    			 	<option value="青岛营业部">青岛营业部</option>
															    			 
															    			 	<option value="大连营业部">大连营业部</option>
															    			 
															    			 	<option value="机构业务一部">机构业务一部</option>
															    			 
															    			 	<option value="机构业务二部">机构业务二部</option>
															    			 
															    			 	<option value="机构业务三部">机构业务三部</option>
															    			 
															    			 	<option value="金融衍生品部">金融衍生品部</option>
															    			 
															    			 	<option value="创新业务部">创新业务部</option>
															    			 
															    			 	<option value="南宁营业部">南宁营业部</option>
															    			 
															    			 	<option value="福州营业部">福州营业部</option>
															    			 
															    			 	<option value="无锡营业部">无锡营业部</option>
															    			 
															    			 	<option value="佛山营业部">佛山营业部</option>
															    			 
															    			 	<option value="江门营业部">江门营业部</option>
															    			 
															    			 	<option value="中山营业部">中山营业部</option>
															    			 
															    			 	<option value="东莞营业部">东莞营业部</option>
															    			 
															    			 	<option value="武汉营业部">武汉营业部</option>
															    			 
															    			 	<option value="杭州营业部">杭州营业部</option>
															    			 
															    			 	<option value="肇庆营业部">肇庆营业部</option>
															    			 
															    			 	<option value="西安营业部">西安营业部</option>
															    			 
															    			 	<option value="哈尔滨营业部">哈尔滨营业部</option>
															    			 
															    			 	<option value="深圳营业部">深圳营业部</option>
															    			 
															    			 	<option value="汕头营业部">汕头营业部</option>
															    			 
															    			 	<option value="广发期货（香港）有限公司">广发期货（香港）有限公司</option>
															    			 
															    			 	<option value="成都营业部">成都营业部</option>
															    			 
															    			 	<option value="贵阳营业部">贵阳营业部</option>
															    			 
															    			 	<option value="昆明营业部">昆明营业部</option>
															    			 
															    			 	<option value="宁波营业部">宁波营业部</option>
															    			 
															    			 	<option value="厦门营业部">厦门营业部</option>
															    			 
															    			 	<option value="商品机构业务部">商品机构业务部</option>
															    			 
															    			 	<option value="无锡硕放营业部">无锡硕放营业部</option>
															    			 
															    			 	<option value="国际业务部">国际业务部</option>
															    			 
															    			 	<option value="上海分公司">上海分公司</option>
															    			 	
															    			 	<option value="机构PB部">机构PB部</option>
															    			 	
															    			 	<option value="深圳分公司">深圳分公司</option>
															    			 	
															    			 	<option value="资产管理部">资产管理部</option>
															    			 	
															    			 	<option value="北京分公司">北京分公司</option>
																				<%
																				%>
																			</SELECT>
																		</TD>
																	</TR>

																	<TR>
																		<TD height=30>
																			&nbsp;
																		</TD>
																		<TD>
																			<TABLE style="MARGIN-TOP: 24px; MARGIN-BOTTOM: 30px"
																				border=0 cellSpacing=0 cellPadding=0 width="100%">
																				<TBODY>
																					<TR>
																						<TD vAlign=top width="15%">
																							<DIV
																								style="WIDTH: 84px; BACKGROUND: url(images/btnSubmitOn.gif) no-repeat; HEIGHT: 30px; CURSOR: pointer"
																								onmouseover="style.background='url(images/btnSubmitOver.gif) repeat-x'"
																								onmouseout="style.background='url(images/btnSubmitOn.gif) repeat-x'">
																							</DIV>
																						</TD>
																						<TD width="85%" align=center>
																							<DIV>
																								<INPUT
																									style="BORDER-RIGHT-WIDTH: 0px; WIDTH: 60px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 30px; BORDER-LEFT-WIDTH: 0px"
																									onclick="infoSubmit()" type=button value="提  交"
																									id=bu>
																							</DIV>
																						</TD>
																					</TR>
																				</TBODY>
																			</TABLE>
																		</TD>
																	</TR>
																</table>
															</TD>
														</TR>
													</TBODY>
												</TABLE>
        </form>
        </div>
        </td>
      </tr>
    </table>
    </td>
  </tr>
  <!-- 显示页面页码等 -->
  
<!-- 显示页面页码等结束 -->
</table>
</body>
</html>
