<%@ page language="java" import="java.util.*" 
 import="java.net.URLEncoder" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String user_id_t = (String)session.getAttribute("user_id");
if(user_id_t==null || user_id_t.length()<1){
	response.sendRedirect("index.jsp");
	return;
}//shixiaolin 20171026
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户信息查询</title>
     <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" content="ie=edge"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="scripts/easyui/jquery.min.js">
</script>

		<script type="text/javascript"
			src="scripts/easyui/jquery.easyui.min.js">
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

		<script type="text/javascript" language="javascript">
	
var globalpagesize = 10;	
		
//根据不同的浏览器创建不同的XMLHttpRequest对象  
function createXmlHttpRequest() {
	var xmlreq = false;
	if (window.XMLHttpRequest) {
		xmlreq = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		try { //创建较新版本的对象
			xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e1) {
			try {
				xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
			}
		}
	}
	return xmlreq;
}

function createQueryString(PageNo,PageSize) {
	var investorid = $("#investorid").val();
	//var identitycard = $("#identitycard").val();
	//获取下拉列表的id
	//var salesdepartment = $("#salesdepartment").combobox('getValue');
	var salesdepartment = $("#salesdepartment").combobox('getText');
	//var queryString = "investorid=" + investorid + "&identitycard=" + identitycard+ "&salesdepartment=" + salesdepartment;
	if(salesdepartment.length <1){
		salesdepartment = "<%=session.getAttribute("branch")%>"; 
		//salesdepartment = "广发期货总部"; shixiaolin
	}
	
	var queryString = "investorid=" + investorid + "&salesdepartment="
			+ salesdepartment + "&PageNo="
			+ PageNo +"&PageSize="
			+ PageSize +"&refresh="
			+ 0;	
	//alert(queryString);
	return queryString;
}

function userNameCheck(PageNo,PageSize) {
	
	/*$.messager.progress({
		//title:"hellp",
		//msg:"111",
		//text:"hhh",
		interval:500
		
	}); */
	//$.messager.progress('close');
	//刷新分页 的页数           
    var dg =$('#tab');
    var opts = dg.datagrid('options');
    var pager = dg.datagrid('getPager');
    opts.pageNumber = PageNo; 
    opts.pageSize = PageSize; 
    var _pageNumber =opts.pageNumber;
    var _pageSize =opts.pageSize;
    //alert("dg.options:pageNumber=" + _pageNumber + " pageSize=" + _pageSize + "\n");
	
	pager.pagination('refresh', {
       	pageNumber: _pageNumber,
       	pageSize:   _pageSize
       });
    
	var investoridchecknull = $('#investorid').val();
	var salesdepartmentchecknull = $('#salesdepartment').val();
	if((investoridchecknull.length <1)&&(salesdepartmentchecknull.length<1)){
		alert("请输入查询信息!");
		return;
	}
			
	//$('#msgdlg').dialog('open');
	$('#tab').datagrid('loading');
	//var userid = document.all.username.value;//获得text的值
	var queryString = createQueryString(PageNo,PageSize);
	//alert(queryString);

	var request = createXmlHttpRequest();//创建request 对象
	var url = encodeURI("userqueryservlet.do?" + queryString);//统一编码
	//request.open("post", "userqueryservlet.do?" + queryString);//建立到服务器的新请求
	request.open("post", url);//建立到服务器的新请求
	request.send();//向服务器发送请求
	request.onreadystatechange = function()//指定当readyState属性改变时的事件处理句柄
	{
		if (request.readyState == 4)//提取当前HTTP的就绪状态,状态4表示：响应已完成，可以访问服务器响应并使用它
			if (request.status == 200)//HTTP状态,我们期望的状态码是 200，它表示一切顺利。
			//如果就绪状态是 4 而且状态码是 200，就可以处理服务器的数据了，而且这些数据应该就是要求的数据
			{
				var value = request.responseText;//服务器返回响应文本
				showtable(value);
			}
	}
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
		if(data.total>=2){
			$('#tab').datagrid('getPager').show();
		}else{
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

function refreshdata(data){
	$('#tab').datagrid('loading');
	var btanchstr = getbrachstr();
	$.ajax({
		url : "userqueryservlet.do",
		type : "post",
		dataType : "text",
		data : {
			"investorid" : data,
			"salesdepartment" : btanchstr,
			"PageNo": 1,
			"PageSize":globalpagesize,
			"refresh":1
		},
		success:function(data){
			showtable(data);
			$('#tab').datagrid('loaded');
			alert("数据已刷新!");
		},
		error:function(){
			$('#tab').datagrid('loaded');
			alert("刷新数据失败!");
		}
		
	});
	
}

function getbrachstr(){
	var salesdepartment = $("#salesdepartment").combobox('getText');
	//var queryString = "investorid=" + investorid + "&identitycard=" + identitycard+ "&salesdepartment=" + salesdepartment;
	if(salesdepartment.length <1){
		salesdepartment = "<%=session.getAttribute("branch")%>"; 
	}
	//salesdepartment = encodeURI(encodeURI(salesdepartment));
	return salesdepartment;
}

function dialog_change(){
	var dialoginvestorid =  $('#dialog_investorid').val();
	var dialognoresident =  $('#dialog_noresident').combobox('getValue');	
	var dialogcertno =  $('#dialog_certno').val();
		
	$.ajax( {
		url : "userupdateresident.do",
		type : "post",
		dataType : "text",
		data : {
			"investorid" : dialoginvestorid,
			"residenttype" : dialognoresident,
			"dialogcertno":dialogcertno
		},
		success : function(data) {
			if(data == 1){
				alert("修改成功!");
			}else{
				alert("数据修改失败!");
			}
			
			refreshdata(dialoginvestorid);
		},
		error:function(){
			alert("修改失败!");
		}
	});
	$('#dlg').dialog('close');
}

function changeinfo() {
	var ids = [];
	var rows = $('#tab').datagrid('getSelections');
	if (rows.length == 0) {
		alert("选择一条信息才能修改!");
	} else if (rows.length > 1) {
		alert("一次只能选择一条信息修改!");
	} else {
		var data = [{"id":2000,"text":"居民","selected":"true"},{"id":1000,"text":"非居民"}];
		$('#dlg').dialog('open');
		$('#dialog_investorid').textbox('setValue',rows[0].userid);
		$('#dialog_certno').textbox('setValue',rows[0].identitycard);
		$('#dialog_noresident').combobox({
			data:data,
			valueField : 'id',
			textField : 'text'
		});

	}

}

function doSearch() {
	$('#tb').datagrid('load', {
		investorid : $('#investorid').val(),
		salesdepartment : $('#salesdepartment').val()
	});
	//alert(investorid+" "+salesdepartment);
}

function getsalesdepartment() {
	var saledepartmentstr="<%=session.getAttribute("branch")%>"; 
	//var saledepartmentstr = "广发期货总部";///shixiaolin 20171026
	//var saledepartmentstr = "上海营业部";
if (saledepartmentstr != "广发期货总部") {	
		//$("#salesdepartment").combobox('setValue',saledepartmentstr); //设置默认显示内容
		data = [{id:1,text:saledepartmentstr}];
		$("#salesdepartment").combobox({
			data : data,
			valueField : 'id',
			textField : 'text',
		});
	} else {
		$.ajax( {
			//如果加载json文件 中文显示乱码 解决方法：记事本打开.json文件 文件 - 另存为 看到下面编码格式了吧 选择UTF-8 就可以了
			url:"combobox_department.json",
			//url : "branchjson.do", //从数据库获取需要这步
			type : "post",
			datatype : "json",
			
			success : function(data) {
				//var data = eval("(" + data1 + ")"); //从数据库获取需要这步
				$('#salesdepartment').combobox( {
					//data : data.rows, //从数据库获取需要这步
					data : data,
					valueField : 'id',
					textField : 'text',
					/*onLoadSuccess : function() { //加载完成后,设置选中第一项
						alert(data);
						var val = $(this).combobox("getData");
						for ( var item in val[0]) {
							if (item == "id") {
								$(this).combobox("select", val[0][item]);
							}
						}
					}*/
				});
			},
			error: function(){
				alert("加载营业部列表失败！");
			}
		});

	}
}

function showtextinfo(){

	alert("onclick");
}



$(document).ready(function() {

	getsalesdepartment();
	//点击客户号 设置营业部显示为空
	$("input",$("#investorid").next("span")).click(function(){
    	$("#salesdepartment").combobox('setValue','');
    });
    //点击营业部 设置客户号显示为空
    $(".combo").click(function(){
   		 $("#investorid").textbox('setValue','');
		//$(this).prev().combobox("showPanel");
	})

	var pager = $('#tab').datagrid('getPager');
	pager.pagination({
		total:0,
		pageSize:globalpagesize,
		pageList:[2],
		showPageList:false,
		showRefresh:false,
		onSelectPage:function (pageNumber, pageSize){
			//alert('onSelectPage pageNumber:' + pageNumber + ',pageSize:' + pageSize); 
			userNameCheck(pageNumber,pageSize);
		} 
	});
	pager.hide();

	$("#dlg_export_dowmload").dialog({  
	    onClose: function () {  
	        $('#tab').datagrid('loaded');  
	        //$(this).dialog('destroy');//销毁  
	    }  
	});

	//$("#salesdepartment").combobox('setValues',['001','002']);

		//$("#salesdepartment").combobox('setValues','广发期货总部');
		//$("#investorid").textbox({disabled:true});

		/*	var pager = $('#tab').datagrid('getPager');    // get the pager of datagrid
		 pager.pagination({
		 showPageList:false,
		 buttons:[{
		 iconCls:'icon-search',
		 handler:function(){
		 alert('search');
		 userNameCheck();
		 }
		 },{
		 iconCls:'icon-add',
		 handler:function(){
		 alert('add');
		 }
		 },{
		 iconCls:'icon-edit',
		 handler:function(){
		 alert('edit');
		 }
		 }],
		 onBeforeRefresh:function(){
		 alert('before refresh');
		 return true;
		 }
		 });*/
	});


//EasyUI datagrid 动态导出Excel  
function ExporterExcel() {  
            //获取Datagride的列  
            var rows = $('#tab').datagrid('getRows');  
           
            var columns = $("#tab").datagrid("options").columns[0];  
            
            var oXL = new ActiveXObject("Excel.Application"); //创建AX对象excel   
            var oWB = oXL.Workbooks.Add(); //获取workbook对象   
            var oSheet = oWB.ActiveSheet; //激活当前sheet  
            alert("1");
            //设置工作薄名称  
            oSheet.name = "导出Excel报表";  
            //设置表头  
            for (var i = 0; i < columns.length; i++) {  
                oSheet.Cells(1, i+1).value = columns[i].title;  
            }  
            //设置内容部分  
            for (var i = 0; i < rows.length; i++) {  
                //动态获取每一行每一列的数据值  
                for (var j = 0; j < columns.length; j++) {                 
                    oSheet.Cells(i + 2, j+1).value = rows[i][columns[j].field];  
                }     
            }                
            oXL.Visible = true; //设置excel可见属性  
}  



function post(URL, PARAMS) {
			$('#tab').datagrid('loading');
            var temp = document.createElement("form");
            temp.action = URL;
            temp.method = "post";
            temp.style.display = "none";
            for (var x in PARAMS) {
                var opt = document.createElement("textarea");
                opt.name = x;
                opt.value = PARAMS[x];
                //alert(opt.name)
                temp.appendChild(opt);
            }
            document.body.appendChild(temp);
            temp.submit();                       
            return temp;                     
        }

function Exproter() {  

	
	var salesdepartmentchecknull = $('#salesdepartment').val();
	if(salesdepartmentchecknull.length<1){
		alert("请输入营业部信息!");
		return;
	}

	var data = [{"id":0,"text":"导出当前页面客户信息","selected":"true"},{"id":1,"text":"导出整个营业部客户信息"}];
	$('#dlg_export').dialog('open');
	/* $('#dialog_investorid_export').textbox('setValue',rows[0].userid); */
	$('#dialog_noresident_export').combobox({
		data:data,
		valueField : 'id',
		textField : 'text'
	});

}  

function do_export(){

	//var dialoginvestorid =  $('#dialog_investorid').val();
	var pagestatus =  $('#dialog_noresident_export').combobox('getValue');
	//alert(pagestatus);
	var rows = $('#tab').datagrid('getRows');     
    var columns = $("#tab").datagrid("options").columns[0];
	var info=""; 
	
	if(pagestatus == "0"){
	    for (var i = 0; i < rows.length; i++) {    	   	   
		    //动态获取每一行每一列的数据值  
		    for (var j = 1; j < columns.length; j++) {   
		    	if(j == columns.length-1 ){
		    		info = info+rows[i][columns[j].field];
		    	}else{
		    		info = info+rows[i][columns[j].field]+","; 
		    	}              	        
		    }
		    if(i != rows.length-1){
		    	info = info+";"
		    }     
    	} 
    	if(info == ""){
    		alert("当前页面信息为空!");
    		$('#dlg_export').dialog('close');
    		return;
    	}
	}
	//alert(info);
	$('#tab').datagrid('loading');
	$.ajax( {
		url : "ExportExcel.do",
		type : "post",
		dataType : "text",
		data : {
           investorid:$("#investorid").val(),
           salesdepartment:$("#salesdepartment").combobox('getText'),
           salesdepartmentnum:$("#salesdepartment").combobox('getValue'),
           PageNo:"-1",
           PageSize:"-1",
           pageinfo:info,
           pagestatus:pagestatus
		},
		success : function(data) {			
				//alert(data);
				$("#dialog_investorid_export_dowmload").attr("href",data); 
				$('#dlg_export_dowmload').dialog('open');
				
		},
		error:function(){
			alert("导出失败!");
			$('#tab').datagrid('loaded');
		}
	});
	

/* 	post('ExportExcel.do',//另一种发送form 表格post请求方式
       {
           investorid:$("#investorid").val(),
           salesdepartment:$("#salesdepartment").combobox('getText'),
           PageNo:"-1",
           PageSize:"-1",
           pageinfo:info,
           pagestatus:pagestatus,
           //openaccounttype:_openaccounttype
           //accounttype:_accounttype,
           //investortype:_investortype,
       }); */
       
       $('#dlg_export').dialog('close');
}

function remoneinfo(){
	var ids = [];
	var rows = $('#tab').datagrid('getSelections');
	if (rows.length == 0) {
		alert("选择一条信息才能删除!");
	} else if (rows.length > 1) {
		alert("一次只能选择一条信息删除!");
	} else {
		//var data = [{"id":2000,"text":"居民","selected":"true"},{"id":1000,"text":"非居民"}];
		$('#dlg_remove').dialog('open');
		$('#dialog_remove_investorid').textbox('setValue',rows[0].userid);

	}
}

function do_remove(){
	var dialogremoveinvestorid =  $('#dialog_remove_investorid').val();
		
	$.ajax( {
		url : "userRemoveInfo.do",
		type : "post",
		dataType : "text",
		data : {
			"investorid" : dialogremoveinvestorid,
		},
		success : function(data) {
			if(data == 1){
				alert("删除成功,请手动刷新当前页面!");
			}else{
				alert("数据删除失败!");
			}
			
			//refreshdata(dialoginvestorid);
		},
		error:function(){
			alert("数据删除失败!");
		}
	});
	$('#dlg_remove').dialog('close');
}

</script>

	</head>

	<body>

		<table id="tab" class="easyui-datagrid" toolbar="#tb" title="客户信息查询"  pagination='true' singleSelect="false">
			<thead>
				<tr>
					<th field="ck" checkbox="true"></th>
					<th field="userid" width="80" align="center">
						客户号
					</th>
					<th field="username" width="150" align="center">
						客户名称
					</th>
					<th field="identitycard" width="150" align="center">
						身份证明
					</th>
					<th field="address" fitColumns="true" align="center">
						客户居民地址或邮寄地址
					</th>
					<th field="phone" width="150" align="center">
						客户手提电话
					</th>
					<th field="equity" width="150" align="center">
						客户期末权益加总
					</th>
					<th field="noresident" width="150" align="center">
						非居民标识
					</th>
					<th field="date" width="150" align="center">
						非居民标识日期
					</th>
				</tr>
			</thead>
		</table>

		<div id="tb" style="padding: 3px">
			<span>客户号:</span>
			<input id="investorid" class="easyui-textbox"
				style="line-height: 20px; border: 1px solid #ccc">
			<span>营业部:</span>
			<input id="salesdepartment" class="easyui-combobox"
				data-options="multiple:false,valueField:'id', textField:'text'"
				style="line-height: 20px; border: 1px solid #ccc">

			<a class="easyui-linkbutton" iconCls="icon-search"
				onclick="userNameCheck(1,10)">查询</a>
			<a class="easyui-linkbutton" iconCls="icon-edit"
				onclick="changeinfo()">修改</a>
			<a  class="easyui-linkbutton" iconCls="icon-remove"
				onclick="remoneinfo()">删除</a>
			<a  class="easyui-linkbutton" iconCls="icon-save"
					onclick="Exproter()">导出</a>

		</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 250px; padding: 10px 30px;" closed="true"
		title="修改非居民标识" buttons="#dlg-buttons">
		<form id="ff" method="post">
			<h2></h2>
			<table>
				<tr>
					<td>客户号:</td>
					<td><input type="text" id="dialog_investorid"
						class="easyui-textbox" style="width: 150px;" readonly="readonly"/></td>
				</tr>

				<tr>
					<td>身份证明:</td>
					<td><input type="text" id="dialog_certno"
						class="easyui-textbox" style="width: 150px;"/></td>
				</tr>

				<tr>
					<td>非居民标识:</td>
					<td><input class="easyui-combobox" id="dialog_noresident"
						data-options="multiple:false,valueField:'id', textField:'text'"
						style="width: 150px;" "/></td>
				</tr>
				

			</table>
		</form>
	</div>


	<div id="dlg-buttons">
		<a class="easyui-linkbutton" onclick="dialog_change()">确定</a> <a
			class="easyui-linkbutton"
			onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>


	<div id="dlg_export" class="easyui-dialog"
		style="width: 400px; height: 250px; padding: 10px 30px;" closed="true"
		title="导出信息" buttons="#dlg-buttons-export">
		<form id="ff" method="post">
			<h2></h2>
			<table>
				<tr>
					<td>您好!</td>					
				</tr>

				<tr>
					<td>请选择导出信息的格式:</td>
					<td><input class="easyui-combobox" id="dialog_noresident_export"
						data-options="multiple:false,valueField:'id', textField:'text'"
						style="width: 150px;" "/></td>
				</tr>

			</table>
		</form>
	</div>

	<div id="dlg-buttons-export">
		<a class="easyui-linkbutton" onclick="do_export()">确定</a> <a
			class="easyui-linkbutton"
			onclick="javascript:$('#dlg_export').dialog('close')">取消</a>
	</div>



	<div id="dlg_export_dowmload" class="easyui-dialog"
		style="width: 400px; height: 250px; padding: 10px 30px;" closed="true"
		title="下载信息" buttons="#dlg-buttons-export-down">
		<form id="ff" method="post">
			<h2></h2>
			<table>
				<tr>
					<td>请点击下载按钮进行下载!</td>
				</tr>

			</table>
			<a class="easyui-linkbutton" id="dialog_investorid_export_dowmload" href="">下载</a>
			
		</form>
	</div>

	<div id="dlg-buttons-export-down">
		<a class="easyui-linkbutton"
			onclick="javascript:$('#dlg_export_dowmload').dialog('close');$('#tab').datagrid('loaded');">关闭</a>
	</div>

	


	<div id="dlg_remove" class="easyui-dialog"
		style="width: 400px; height: 250px; padding: 10px 30px;" closed="true"
		title="删除信息" buttons="#dlg-buttons-remove">
		<form id="ff" method="post">
			<h2></h2>
			<table>
				<tr>
					<td>是否要删除以下客户信息：</td>
				</tr>
				<br/>
				<br/>
				<tr>
					<td>客户号:</td>
					<td><input type="text" id="dialog_remove_investorid"
						class="easyui-textbox" style="width: 100px;" readonly="readonly"/></td>
				</tr>
			</table>
			
		</form>
	</div>

	<div id="dlg-buttons-remove">	
		<a class="easyui-linkbutton" onclick="do_remove()">确定</a>
		<a class="easyui-linkbutton"
			onclick="javascript:$('#dlg_remove').dialog('close')">取消</a>
	</div>


	<div id="msgdlg" class="easyui-dialog"
		style="width: 200px; height: 150px; padding: 10px 30px;" closed="true"
		title="加载数据">
		<p>正在加载数据....</p>
	</div>


</body>
</html>
