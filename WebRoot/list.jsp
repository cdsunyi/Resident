<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:include page="/js/js.jsp" />
<jsp:include page="/js/time.jsp"/>
   <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�Ǿ������-</title>
    
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
		//�´��ڵ��ĵ����� 
		var srcFile = "select.jsp";
		//�߶ȣ�λ�õ� 
		var winFeatures = "dialogHeight:588px;dialogLeft:300px;"; 
		//������ҳ���reason input������������ 
		var obj =document.getElementById(select); 
		//��input��Ϊ���󴫵ݸ��´���
		//ok,open new windows 
		/* ���ô����Ӵ��ڵ�ֵ obj.value="Ҫ���ݵ�ֵ"; */
		window.showModalDialog(srcFile, obj, winFeatures); 
	}
</script> 
 
<script>
	var  highlightcolor='#c1ebff';
	//�˴�clickcolorֻ����winϵͳ��ɫ������ܳɹ�,�����#xxxxxx�Ĵ���Ͳ���,��û�����Ϊʲô:(
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
        <td width="12" height="30"><img src="./tab/images/tab_03.gif" width="12" height="30" /></td>
        <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="left">
            <table width="20%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="./tab/images/tb.gif" width="16" height="16" /></div></td>
                <td width="80%" class="STYLE1"><span class="STYLE1">��ǰλ��</span>��[�Ǿ������]-[����˰��]</td>
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
            </div><form action="GFFM_data/accountcreditsummary.jsp" method="post"><div align="left"> 
            	</div><table width="65%" border="0">
            		<tr>
            			<td align="right">
            			
            				<span class="STYLE1">�˻�����</span>
            				<input type="text" name="AccountCode" value="" onclick="openReasonWin('AccountCode');" readonly>
	            			<span class="STYLE1">��ʼ����</span>
	            			<input type="text" onclick="fPopCalendar(this,this,this.value);return false;" readonly value="" style="width: 90px; height: 18px;" id="dateS" name="dateS">
							<span class="STYLE1">��������</span>
	            			<input type="text" onclick="fPopCalendar(this,this,this.value);return false;" readonly value="" style="width: 90px; height: 18px;" id="dateE" name="dateE">
							<input type="submit" value="��ѯ">
							<a href="GFFM_data/GFFMdownload.jsp?d_from=accountcreditsummary"><span class="STYLE1">��������</span></a>
            			</td>
            		</tr>
            	</table>
            </form>
            </td>
          </tr>
       <tr>
        <td align="center">
        <div class="FixedHeaderColumnsTableDiv"	style="width: 1250px; height: 500px">
        <table width="100%" border="1" cellpadding="0" cellspacing="1" onmouseover="changeto()"  onmouseout="changeback()">
        	<tr>
        	<td><span class="STYLE1">������ &nbsp;&nbsp; &nbsp;<br>������������ 1.��Ϊ�й�˰�վ���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �� 2.��Ϊ�Ǿ���<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �� 3.�����й�˰�վ��������������ң�������˰�վ��� ��������ѡ���й�ѡ�� 2 ����ߵ� 3 �����д������Ϣ�� <br>�գ�Ӣ�Ļ�ƴ������&nbsp;&nbsp; &nbsp;����Ӣ�Ļ�ƴ������ &nbsp;&nbsp; &nbsp;&nbsp; �������ڣ� &nbsp;&nbsp; &nbsp; <br>�־ӵ�ַ�����ģ���&nbsp;&nbsp; &nbsp;�����ң�&nbsp;&nbsp; &nbsp;��ʡ��&nbsp;&nbsp; &nbsp;���У�&nbsp;&nbsp; &nbsp;�������ַ�ɲ�����<br>��Ӣ�Ļ�ƴ������&nbsp;&nbsp; &nbsp;�����ң�&nbsp;&nbsp; &nbsp;��ʡ��&nbsp;&nbsp; &nbsp;���У� &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;<br>�����أ����ģ���&nbsp;&nbsp; &nbsp;�����ң�&nbsp;&nbsp; &nbsp;��ʡ��&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;���У�&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;�������ַ�ɲ�����<br>��Ӣ�Ļ�ƴ������&nbsp;&nbsp; &nbsp;�����ң�&nbsp;&nbsp; &nbsp;��ʡ��&nbsp;&nbsp; &nbsp;���У� &nbsp;&nbsp; &nbsp;&nbsp; ˰�վ����������������˰��ʶ��ţ�<br>1. &nbsp;&nbsp; &nbsp;<br>2.�����У� &nbsp;&nbsp; &nbsp;<br>3.�����У� &nbsp;&nbsp; &nbsp; <br>�粻���ṩ���������������˰��ʶ��ţ���ѡ��ԭ��<br>�� ���������������������˰��ʶ���<br>�� �˻�������δ��ȡ����˰��ʶ��ţ���ѡ�������;���ԭ��<br><br></span> 
        	</td>
        	</tr>
        </table>
        </div>
        </td>
      </tr>
    </table>
    </td>
  </tr>
  <!-- ��ʾҳ��ҳ��� -->
  
<!-- ��ʾҳ��ҳ��Ƚ��� -->
</table>
</body>
</html>
