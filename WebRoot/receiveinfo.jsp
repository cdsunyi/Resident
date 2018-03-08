<%@ page language="java"
	import="java.util.*,dao.*,obj.*,java.sql.*"
	pageEncoding="GB2312"%>
<jsp:include page="/css/style.css" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>非居民金融-登录</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	</head>

	<script type="text/javascript">
    function load(){
      var obj=document.getElementById("info");
      var info=obj.value;
      if (info.length>1){
      alert(info);
      };   
    };
    </script>

	<body onload="load()">
		<%
			String user_id = request.getParameter("para1");
			// String pwd = (new MD5(request.getParameter("pwd"))).compute();
			String pwd = request.getParameter("para3");
			boolean b = false;
			String info = "";
			//String url=request.getHeader("Referer"); 
			User_info user = new User_info();
			List list_user = ManDatabase.get_userinfo(user_id);
			System.out.println("userid-------:"+user_id+" "+pwd);
			user = (User_info) list_user.get(0);
			if (user.getPwd().equals(pwd)) {
				session.setAttribute("user_id", user.getUser_id());
				session.setAttribute("branch", user.getBranch());
			} else {
				info = "对不起,非居民金融系统的用户名或密码绑定不正确!";
			}
		%>
		<input type="hidden" id="info" value="<%=info%>">
	</body>
</html>
