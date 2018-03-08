<%@ page language="java" import="java.util.*,obj.*,dao.*" pageEncoding="utf-8"%>
<%
	String res = "";
	String tp = request.getParameter("tp");
	String id = request.getParameter("id");
	String user_id = new String(request.getParameter("user_id").getBytes("gbk"), "gb2312");
	String user_name = new String(request.getParameter("user_name").getBytes("gbk"), "gb2312");
	String pwd = request.getParameter("pwd");
	String user_dis = new String(request.getParameter("user_dis").getBytes("gbk"), "gb2312");
	String branch = new String(request.getParameter("branch").getBytes("gbk"), "gb2312");
	User_info user = new User_info();
	user.setUser_id(user_id);
	user.setUser_name(user_name);
	user.setPwd(pwd);
	user.setUser_dis(user_dis);
	user.setBranch(branch);
	if(tp.equals("add")){
		if(ManDatabase.check_userid(user_id)){
			res = "用户'"+user_id+"'已存在系统！"+user_name;
		}else{
			if(ManDatabase.insert_user(user)){
				res = "用户'"+user_id+"'添加成功！";
			}else{
				res = "用户'"+user_id+"'添加异常。";
			}
		}
	}else if(tp.equals("update")){
		if(ManDatabase.update_user(user,id)){
			res = "用户'"+user_id+"'修改成功！";
		}else{
			res = "用户'"+user_id+"'修改异常。";
		}
	}
	response.getWriter().write(res); 
%>
 