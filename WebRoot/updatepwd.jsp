<%@ page language="java" import="java.util.*,dao.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//系统当前日期
	String user_id = request.getParameter("user_id");
	String pwd = request.getParameter("pwd");
	String res = "";
	if (ManDatabase.update_pswd(user_id,pwd)) {
		res = "密码修改成功！请重新绑定子系统账号。";
	} else {
		res = "密码修改失败！";
	}
	response.getWriter().write(res);
%>
