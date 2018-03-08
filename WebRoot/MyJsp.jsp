<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
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
																			<INPUT onblur=checkUserId();
																				style="WIDTH: 180px; HEIGHT: 18px" id=user_id
																				name=user_id maxLength=20 value=<%=user_id_tmp%>>
																			&nbsp;&nbsp;&nbsp;&nbsp;
																			<input type="button" onclick="check_userid()"
																				value="检测可用">
																			<LABEL style="COLOR: red" id=lbl_user_id></LABEL>
																		</TD>
																	</TR>
																	<TR>
																		<TD style="PADDING-RIGHT: 15px; FONT-SIZE: 14px"
																			height=34 align=right>
																			用户名
																		</TD>
																		<TD align=left>
																			<INPUT onblur=checkUserName();
																				style="WIDTH: 120px; HEIGHT: 18px" id=user_name
																				name=user_name maxLength=20
																				value=<%=user_name_tmp%>>
																			<LABEL style="COLOR: red" id=lbl_user_name></LABEL>
																		</TD>
																	</TR>
																	<TR>
																		<TD style="PADDING-RIGHT: 15px; FONT-SIZE: 14px"
																			height=34 align=right>
																			密码
																		</TD>
																		<TD align=left>
																			<INPUT onblur=checkPwd(); type=password
																				style="WIDTH: 230px; HEIGHT: 18px" id=pwd name=pwd
																				maxLength=32 value=<%=pwd_tmp%>>
																			<LABEL style="COLOR: red" id=lbl_pwd></LABEL>
																		</TD>
																	</TR>
																	<TR>
																		<TD style="PADDING-RIGHT: 15px; FONT-SIZE: 14px"
																			height=34 align=right>
																			重复密码
																		</TD>
																		<TD align=left>
																			<INPUT onblur=checkPwd2(); type=password
																				style="WIDTH: 230px; HEIGHT: 18px" id=su_pwd
																				name=su_pwd maxLength=32 value=<%=pwd_tmp%>>
																			<LABEL style="COLOR: red" id=lbl_su_pwd></LABEL>
																		</TD>
																	</TR>
																	<TR>
																		<TD style="PADDING-RIGHT: 15px; FONT-SIZE: 14px"
																			height=34 align=right>
																			用户描述
																		</TD>
																		<TD align=left>
																			<INPUT onblur=checkUserDis();
																				style="WIDTH: 200px; HEIGHT: 18px" id=user_dis
																				name=user_dis maxLength=20 value=<%=user_dis_tmp%>>
																			<LABEL style="COLOR: red" id=lbl_user_dis></LABEL>
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
																					ArrayList list_branch = (ArrayList) Others.get_branch();
																					for (int i = 0; i < list_branch.size(); i++) {
																						branch = (Branch) list_branch.get(i);
																				%>

																				<option value="<%=branch.getBranch()%>">
																					<%=branch.getBranch_name()%>
																				</option>
																				<%
																					}
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
																									onclick="formsubmit()" type=button value="提 交"
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
  </body>
</html>
