<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="/js/js.jsp" />
<jsp:include page="/js/time.jsp" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String user_id_t = (String)session.getAttribute("user_id");
	/*if(user_id_t==null || user_id_t.length()<1){
		response.sendRedirect("index.jsp");
		return;
	}*/
	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>非居民金融-机构客户</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style>
a {
	TEXT-DECORATION: none
}

A.a04:link,A.a04:visited {
	text-decoration: none;
	color: #264600
}

A.a04:active,A.a04:hover {
	text-decoration: underline;
	color: #004C51
}
</style>

		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

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
	top: expression(this .           offsetParent .           scrollTop);
	left: expression(this .           parentElement .           offsetParent .
		       
		  scrollLeft);
	z-index: 1800;
}

.FixedHeaderRow1 {
	position: relative;
	top: expression(this .           offsetParent .           scrollTop);
	background-color: #ccc;
	z-index: 300;
}

.FixedDataColumn {
	position: relative;
	left: expression(this .           parentElement .           offsetParent .
		      
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
	var obj = document.getElementById(select);
	//将input作为对象传递给新窗口
	//ok,open new windows 
	/* 设置传给子窗口的值 obj.value="要传递的值"; */
	window.showModalDialog(srcFile, obj, winFeatures);
}

function display() {
	var radionum = document.getElementsByName("p2");
	var p2;
	for ( var i = 0; i < radionum.length; i++) {
		if (radionum[i].checked) {
			p2 = radionum[i].value;
			break;
		}
	}
	var traget1 = document.getElementById("div1");
	var traget2 = document.getElementById("div2");
	if (p2 == "1") {
		traget1.style.display = "";
		traget2.style.display = "";
		$('#inputcancel').show();
	} else {
		traget1.style.display = "";
		traget2.style.display = "none";
	}
}

function display3() {
	var radionum = document.getElementsByName("p3");
	var p3;
	for ( var i = 0; i < radionum.length; i++) {
		if (radionum[i].checked) {
			p3 = radionum[i].value;
			break;
		}
	}
	var traget = document.getElementById("div4");
	if (p3 == "1") {
		traget.style.display = "none";
	} else {
		traget.style.display = "";
	}
}

function display19() {
	var radionum = document.getElementsByName("p19");
	var p19;
	for ( var i = 0; i < radionum.length; i++) {
		if (radionum[i].checked) {
			p19 = radionum[i].value;
			break;
		}
	}
	var traget = document.getElementById("div3");
	if (p19 == "1") {
		traget.style.display = "none";
	} else {
		traget.style.display = "";
	}
}
</script>

	<script>
var highlightcolor = '#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var clickcolor = '#51b2f6';
function changeto() {
	source = event.srcElement;
	if (source.tagName == "TR" || source.tagName == "TABLE")
		return;
	while (source.tagName != "TD")
		source = source.parentElement;
	source = source.parentElement;
	cs = source.children;
	//alert(cs.length);
	if (cs[1].style.backgroundColor != highlightcolor && source.id != "nc"
			&& cs[1].style.backgroundColor != clickcolor)
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = highlightcolor;
		}
}

function changeback() {
	if (event.fromElement.contains(event.toElement)
			|| source.contains(event.toElement) || source.id == "nc")
		return;
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
	<script type="text/javascript" src="js/jquery-1.9.1.min.js">
</script>
	<script type="text/javascript">
function infoSubmit(addstatus) {

	//输入校验
	var investorid = document.getElementById("investorid").value;
	if (investorid.length < 1) {
		alert("客户号不能为空！");
		return false;
	}

	var radionum2 = document.getElementsByName("p2");
	var p2;
	var b2 = false;
	for ( var i = 0; i < radionum2.length; i++) {
		if (radionum2[i].checked) {
			b2 = true;
			p2 = radionum2[i].value;
			break;
		}
	}
	if (!b2) {
		alert("请选择\"机构类别\"选项！");
		return false;
	}
	if (p2 == "1") {
		var radionum3 = document.getElementsByName("p3");
		var p3;
		var b3 = false;
		for ( var i = 0; i < radionum3.length; i++) {
			if (radionum3[i].checked) {
				b3 = true;
				p3 = radionum3[i].value;
				break;
			}
		}
		if (!b3) {
			alert("请选择\"机构税收居民身份\"选项！");
			return false;
		}

		var radionum19 = document.getElementsByName("p19");
		var p19;
		var b19 = false;
		for ( var i = 0; i < radionum19.length; i++) {
			if (radionum19[i].checked) {
				b19 = true;
				p19 = radionum19[i].value;
				break;
			}
		}
		if (!b19) {
			alert("请选择\"本人声明\"选项！");
			return false;
		}
	} else {
		var radionum3 = document.getElementsByName("p3");
		var p3;
		var b3 = false;
		for ( var i = 0; i < radionum3.length; i++) {
			if (radionum3[i].checked) {
				b3 = true;
				p3 = radionum3[i].value;
				break;
			}
		}
		if (!b3) {
			alert("请选择\"机构税收居民身份\"选项！");
			return false;
		}
	}

	$.ajax( {
		cache : false,
		type : "POST",
		url : "_do.jsp", //把表单数据发送到ajax.jsp
		data : $('#ajaxFrm').serialize(), //要发送的是ajaxFrm表单中的数据
		async : false,
		error : function(request) {
			alert("发送请求失败！");
		},
		success : function(data) {
			//$("#ajaxDiv").html(data); //将返回的结果显示到ajaxDiv中
		if (addstatus == "0") {
			alert(data);
			window.location.href='index.jsp';
		} else {
			alert(data);
			var controlpersoninvestorid = $('#investorid').val();
			var controlpersoninvestoridname = $('#p18').val();
			var url = encodeURI("controlperson.jsp?controlpersoninvestorid="
					+ controlpersoninvestorid + "&controlpersoninvestoridname="
					+ controlpersoninvestoridname);//统一编码
			window.location.href = url;
		}
	}
	});
}

$(document).ready(function(){
	$('#inputcancel').hide();
	
});

</script>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" background="./tab/images/tab_05.gif" width="100%">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30">
								<img src="./tab/images/tab_03.gif" width="12" height="30" />
							</td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="46%" valign="left">
											<table width="20%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="5%">
														<div align="center">
															<img src="./tab/images/tb.gif" width="16" height="16" />
														</div>
													</td>
													<td width="80%" class="STYLE1">
														<span class="STYLE1">当前位置</span>：[非居民金融]-[机构客户]
													</td>
												</tr>
											</table>
										</td>

									</tr>
								</table>
							</td>
							<td width="16">
								<img src="./tab/images/tab_07.gif" width="16" height="30" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<!--  -->
			<tr>
				<td>
					<div align="left">
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="30" background="./tab/images/bg.gif"
								bgcolor="#FFFFFF" colspan="6" align="right">
								<div align="left">
								</div>
							</td>
						</tr>
						<tr>
							<td align="center">
								<div align="center">
								</div>
								<div class="FixedHeaderColumnsTableDiv" style="width: 1250px;">
									<div align="center">
									</div>
									<form method="post" id="ajaxFrm" name="ajaxFrm">
										<table width="70%" height="100%" border="0" cellpadding="0"
											cellspacing="1" onmouseover="changeto()"
											onmouseout="changeback()">

											<tr>
												<td>
													<div align="center">
														<strong><span class="STYLE1"><font
																size="7">机构税收居民身份声明文件</font> </span> </strong>
														<br>
													</div>
													<span class="STYLE1"><br> <font size="3">
															客户号：<input type="text" name="investorid" id="investorid"
																value=""> <br> <br>机构名称：<input
																type="text" name="p1" size="30" value=""> <br>
															<br> <strong>一、机构类别：</strong> <br> <br> <input
																type="radio" name="p2" id="p2" value="1"
																onclick="display()">
															1.消极非金融机构（如勾选此项，请同时填写控制人税收居民身份声明文件）<br> <br> <input
																type="radio" name="p2" id="p2" value="2"
																onclick="display()"> 2.其他非金融机构<br> <br>
													</font>
														<div id="div1">
															<font size="3"><strong>二、机构税收居民身份：</strong> <br>
																<br> </font><span class="STYLE1"><font size="3"><input
																		type="radio" name="p3" id="p3" value="1"
																		onclick="display3()">
																	1.仅为中国税收居民（如勾选此项，请直接填写第五项内容） &nbsp;&nbsp; <br> <br>
																	<input type="radio" name="p3" id="p3" value="2"
																		onclick="display3()"> 2.仅为非居民<br> <br>
																	<input type="radio" name="p3" id="p3" value="3"
																		onclick="display3()"> 3.既是中国税收居民又是其他国家（地区）税收居民</font>
															</span>
															<br>
															<font size="3"><br> </font>
															<div id="div4">
																<span class="STYLE1"><font size="3"><strong>三、机构基本信息：<br>
																			<br> </strong> </font> </span><span class="STYLE1"><font
																	size="3">1、机构名称（英文）：<input type="text" name="p4"
																			size="50"> </font> </span>
																<br>
																<font size="3"><br>2、机构地址</font><span
																	class="STYLE1"><font size="3">（英文或拼音）：<input
																			type="text" name="p5" size="12">（国家） <input
																			type="text" name="p6" size="12">（省）<input
																			type="text" name="p7" size="12">（市） </font> </span><span
																	class="STYLE1"><font size="3"><input
																			type="text" name="p8" size="12"> </font> </span>
																<br>
																<font size="3"><br>3、</font><span class="STYLE1"><font
																	size="3">机构地址（中文）：<input type="text" name="p9"
																			size="6">（国家）<input type="text" name="p10"
																			size="6">（省）<input type="text" name="p11"
																			size="6">（市）<input type="text" name="p12"
																			size="12"> （境外地址可不填此项）<br> <br> </font> </span><span
																	class="STYLE1"><span class="STYLE1"><font
																		size="3"><strong>四、税收居民国（地区）及纳税人识别号：</strong> </font>
																</span> </span>
																<br>
																<span class="STYLE1"><font size="3"><br>
																</font> </span><span class="STYLE1"><font size="3">1. <input
																			type="text" name="p13" size="50"> <br> <br>2.（如有）
																		<input type="text" name="p14" size="50"> <br>
																		<br>3.（如有） <input type="text" name="p15"
																			size="50"> <br> </font> </span>
																<br>
																<span class="STYLE1"><font size="3">如不能提供居民国（地区）纳税人识别号，请选择原因：<br>
																		<br> <input type="radio" name="p16" value="1">
																		居民国（地区）不发放纳税人识别号<br> <br> <input
																			type="radio" name="p16" value="2">
																		账户持有人未能取得纳税人识别号，如选此项，请解释具体原因： <br> <br> <textarea
																			name="p17" rows="3" cols="60"></textarea> <br> <br>
																</font> </span>
															</div>
														</div>
														<div id="div2" style="display: none">
															</font>
													</span>
													<div align="center">
														<span class="STYLE1"><font size="3"><strong><font
																	size="5"> 控制人税收居民身份声明文件</font> </strong> </font> </span>
														<br>
														<span class="STYLE1"></span>
													</div>
													<span class="STYLE1"><font size="3"> <br>
													</span><span class="STYLE1"><font size="3">姓名：<input
																type="text" name="p18" id="p18"> <br> <br>
													</font> </span><span class="STYLE1"><font size="3">本人声明：<input
																type="radio" name="p19" id="p19" value="1"
																onclick="display19()">
															1.仅为中国税收居民&nbsp;&nbsp;&nbsp; <input type="radio"
																name="p19" id="p19" value="2" onclick="display19()">
															2.仅为非居民<br> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="radio" name="p19" id="p19" value="3"
																onclick="display19()"> 3.既是中国税收居民又是其他国家（地区）税收居民<br>
															<div id="div3">
																<br>
																如在以上选项中勾选第 2 项或第 3 项，请填写下列信息：
																<br>
																<br>
																<strong>一、机构信息<br> </strong>
													</font> </span><span class="STYLE1"><span class="STYLE1"><font
															size="3"><strong><br> </strong> </font> </span><span
														class="STYLE1"><font size="3">1、所控制机构名称（英文）：<input
																	type="text" name="p20" size="50"> </font> </span> <br> <font
														size="3"><br> 2、机构地址</font><span class="STYLE1"><font
															size="3">（英文或拼音）：<input type="text" name="p21"
																	size="12">（国家） <input type="text" name="p22"
																	size="12">（省）<input type="text" name="p23"
																	size="12">（市） </font> </span><span class="STYLE1"><font
															size="3"><input type="text" name="p24" size="12">
														</font> </span> <br> <font size="3"><br> 3、</font><span
														class="STYLE1"></span> </span><span class="STYLE1"><span
														class="STYLE1"><span class="STYLE1"><font
																size="3">税收居民国（地区）及纳税人识别号：<input type="text"
																		name="p25" size="30"> <br> <br> <strong>二、控制人信息：</strong>
																	<br> </font> </span> </span> </span><span class="STYLE1"></span><font size="3"><br>姓（英文或拼音）：<input
															type="text" name="p26" size="12">&nbsp;&nbsp;
														名（英文或拼音）： <input type="text" name="p27" size="12">&nbsp;&nbsp;
														出生日期： <input type="text" name="p28" size="8">
														&nbsp; <br> <br>现居地址（中文）：<input type="text"
															name="p29" size="6">（国家）<input type="text"
															name="p30" size="6">（省）<input type="text"
															name="p31" size="6">（市）<input type="text"
															name="p32" size="12"> （境外地址可不填此项）<br> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														（英文或拼音）：<input type="text" name="p33" size="12">（国家）
														<input type="text" name="p34" size="12">（省）<input
															type="text" name="p35" size="12">（市） <input
															type="text" name="p36" size="12"> <br> <br>出生地（中文）：<input
															type="text" name="p37" size="6">（国家）<input
															type="text" name="p38" size="6">（省）<input
															type="text" name="p39" size="6">（市）<input
															type="text" name="p40" size="12"> （境外地址可不填此项）<br>
														<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														（英文或拼音）：<input type="text" name="p41" size="12">（国家）
														<input type="text" name="p42" size="12">（省）<input
															type="text" name="p43" size="12">（市） <input
															type="text" name="p44" size="12"> <br> <br>税收居民国（地区）及纳税人识别号：<br>
														<br>1. <input type="text" name="p45" size="50">
														<br> <br>2.（如有） <input type="text" name="p46"
															size="50"> <br> <br>3.（如有） <input
															type="text" name="p47" size="50"> <br> <br>如不能提供居民国（地区）纳税人识别号，请选择原因：<br>
														<br> <input type="radio" name="p48" value="1">
														居民国（地区）不发放纳税人识别号<br> <br> <input type="radio"
															name="p48" value="2">
														账户持有人未能取得纳税人识别号，如选此项，请解释具体原因： <br> <br> <textarea
															name="p49" rows="3" cols="60"></textarea>
														</div> </font>
													</div>
													<br>
													</span>
												</td>
											</tr>
											<tr>
												<td align="right">
													<br>
													<input type="hidden" name="residenttype" value="2">
													<input type="button" onclick="infoSubmit('0')" value="提 交">
													&nbsp;&nbsp;&nbsp;
													<input type="button" id="inputcancel" onclick="infoSubmit('1')" value="提交并添加控制人信息">
												</td>
											</tr>
										</table>
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
