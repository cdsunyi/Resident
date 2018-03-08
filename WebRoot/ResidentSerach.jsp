<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String user_id_t = (String)session.getAttribute("user_id");
//shixiaolin 20171026
/* if(user_id_t==null || user_id_t.length()<1){
	response.sendRedirect("index.jsp");
	return;
} */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>Insert title here</title>
<title>非居民自动识别</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"
	content="ie=edge" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="scripts/easyui/jquery.min.js"></script>
<script type="text/javascript" src="scripts/easyui/jquery.easyui.min.js">
</script>

<script type="text/javascript"
	src="scripts/easyui/locale/easyui-lang-zh_CN.js">
</script>

<link rel="stylesheet" href="scripts/easyui/themes/default/easyui.css"
	type="text/css" />

<link rel="stylesheet" href="scripts/easyui/themes/icon.css"
	type="text/css" />

<%--<script type="text/javascript" src="jquery-3.2.1.min.js">
</script>--%>

<script type="text/javascript" language="javascript"></script>

<script type="text/javascript">
	var globalpagesize = 10;

	function ResidentCheck(pageNumber, pageSize) {
		$('#tab').datagrid('loading');
		$.ajax({
			url : "ResidentSerach.do",
			type : "post",
			dataType : "text",
			data : {
				"PageNo" : pageNumber,
				"PageSize" : pageSize,
				"refresh" : 1
			},
			success : function(data) {
				showtable(data);
				$('#tab').datagrid('loaded');
			//alert("数据已刷新!");
			},
			error : function() {
				$('#tab').datagrid('loaded');
				alert("刷新数据失败!");
			}
		});
	}

	function showtable(data1) {
		var data = eval("(" + data1 + ")");
		if (data.total == 0) {
			alert("查询结果为0");
			$('#tab').datagrid('loadData', {
				"total" : 0,
				"rows" : []
			});
			$('#tab').datagrid('getPager').hide();
		} else {
			$('#tab').datagrid('loadData', data);
			if (data.total >= 2) {
				$('#tab').datagrid('getPager').show();
			} else {
				$('#tab').datagrid('getPager').hide();
			}
		}

		//$('#msgdlg').dialog('close');
		$('#tab').datagrid('loaded');
	/*	for ( var i = 0; i < obj.length; i++) {
	 item = "<tr><td>" + obj[i].name + "</td><td>" + obj[i].sex
	 + "</td></tr>";
	 item = "<tr>"+
	 "<td>"+obj[i].name+"</td>"+
	 "<td>"+obj[i].sex+"</td>"+
	 "<td>"+obj[i].name+"</td>"+
	 "<td>"+obj[i].sex+"</td>"+
	 "<td>"+obj[i].name+"</td>"+
	 "<td>"+obj[i].sex+"</td>"+
	 "<td>"+obj[i].name+"</td>"+
	 "<td>"+obj[i].sex+"</td>"+
	 "</tr>";
	 $("#tab").append(item);
	 }*/
	}

	$(document).ready(function() {

		var pager = $('#tab').datagrid('getPager');
		pager.pagination({
			total : 0,
			pageSize : globalpagesize,
			pageList : [ 2 ],
			showPageList : false,
			showRefresh : false,
			onSelectPage : function(pageNumber, pageSize) {
				//alert('onSelectPage pageNumber:' + pageNumber + ',pageSize:' + pageSize); 
				ResidentCheck(pageNumber, pageSize);
			}
		});
		//pager.hide();

	});
</script>


</head>
<body>

	<table id="tab" class="easyui-datagrid" toolbar="#tb" title="非居民自动识别"
		pagination='true' singleSelect="false">
		<thead>
			<tr>
				<th field="ck" checkbox="true"></th>
				<th field="userid" width="80" align="center">客户号</th>
				<th field="username" width="150" align="center">客户名称</th>
				<th field="identitycard" width="150" align="center">身份证明</th>
				<th field="address" fitColumns="true" align="center">
					客户居民地址或邮寄地址</th>
				<th field="phone" width="150" align="center">客户手提电话</th>
				<th field="investortype" width="100" align="center">客户类型</th>
				<th field="noresident" width="100" align="center">非居民标识</th>
				<th field="phonecountrycode" width="100" align="center">电话区号</th>
				<th field="checkrestultinfo" width="150" align="center">判定信息</th>
			</tr>
		</thead>
	</table>

	<div id="tb" style="padding: 3px">
<!-- 		<span>客户号:</span> <input id="investorid" class="easyui-textbox"
			style="line-height: 20px; border: 1px solid #ccc"> <span>营业部:</span>
		<input id="salesdepartment" class="easyui-combobox"
			data-options="multiple:false,valueField:'id', textField:'text'"
			style="line-height: 20px; border: 1px solid #ccc">  -->
			<span>&nbsp;非居民系统扫描 &nbsp;</span>
			<a class="easyui-linkbutton" iconCls="icon-search" onclick="ResidentCheck(0,10)">开始</a> 

	</div>
</body>
</html>