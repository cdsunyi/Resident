<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.List"%>
<%@ page language="java" import="dao.*,obj.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户密码修改</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <SCRIPT type=text/javascript>
	function upwd(user_id){
	var pwd = document.getElementById('pwd').value;
	var su_pwd = document.getElementById('su_pwd').value;
	if(pwd!=su_pwd){
		alert('两次密码输入不一致！');
	}else{
	   if (window.confirm("确定修改密码?")){
		var url ="./updatepwd.jsp?user_id="+user_id+"&pwd="+pwd;
		request.open("GET", url, false);
		request.onreadystatechange = updatePage;
		request.send(null);
	   }
	  }
   }
   
   //AJAX实现后台通信
	var request = false;
	try {
	  request = new XMLHttpRequest();
	} catch (trymicrosoft) {
	  try {
	    request = new ActiveXObject("Msxml2.XMLHTTP");
	  } catch (othermicrosoft) {
	    try {
	      request = new ActiveXObject("Microsoft.XMLHTTP");
	    } catch (failed) {
	      request = false;
	    }
	  }
	};

	if (!request){
  		alert("Error initializing XMLHttpRequest!"); 
  	}
  	
  //加入处理函数

   //加入处理函数结束
   
  function updatePage() {   
      if (request.readyState == 4) {
       if (request.status == 200) {
           
          //更新要显示的数组 
          var str=request.responseText;
          alert(str);
          window.location.reload(); 
                   
       } else
         alert("返回状态： " + request.status);
     }
   }  
   
   function updatePage_lisheng() {   
      if (request.readyState == 4) {
       if (request.status == 200) {
           
          //更新要显示的数组 
          var str=request.responseText;
          alert(str);
                   
       } else
         alert("返回状态：  " + request.status);
     }
   }  
   
 //AJAX实现后台通信结束
   </SCRIPT>
  </head>
 <%
  	  	String user_id = (String)session.getAttribute("user_id");
		  if(user_id==null || user_id.length()<1){
		    response.sendRedirect("../index.jsp");
		    return;
		   }
		List list = ManDatabase.get_userinfo(user_id);
		User_info user_info = (User_info)list.get(0);
		String pwd = user_info.getPwd();
  %>
  <body>
  <center>
    <form action="updatepwd.jsp" method="post" name="myform">
    	<table width="100%">
    		
    		<tr>
    			<td align="right">
    				密码
    			</td>
    			<td align="left">
    				<input type="password" name="pwd" id="pwd" value="<%=pwd %>">
    			</td>
    		</tr>
    		<tr>
    			<td align="right">
    				重复密码
    			</td>
    			<td align="left">
    				<input type="password" name="su_pwd" id="su_pwd" value="<%=pwd %>">
    			</td>
    		</tr>
    		<tr>
    			<td align="right">
    				<input type="button" value="提交" onclick="javascript:return(upwd('<%=user_id %>'));">
    			</td>
    			<td align="left">
    				<input type="reset" value="重填">
    			</td>
    		</tr>
    	</table>
    </form>
  </center>
  </body>
</html>
