<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<title></title>
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
		<script language="javascript"> 
function getNowDate()
{
   var nn=new Date();
   year1=nn.getYear();
   mon1=nn.getMonth()+1;
   date1=nn.getDate();
   var monstr1;
   var datestr1
   if(mon1<10) 
    monstr1="0"+mon1;
   else
    monstr1=""+mon1;
     
   if(date1<10) 
     datestr1="0"+date1;
   else
     datestr1=""+date1;
   return year1+"-"+monstr1+"-"+datestr1;
}
//last date

function getlastweekDate()
{
   var nn=new Date();
   year1=nn.getYear();
   mon1=nn.getMonth()+1;
   date1=nn.getDate();
   
   var mm=new Date(year1,mon1-1,date1);
   var tmp1=new Date(2000,1,1);
   var tmp2=new Date(2000,1,15);
   var ne=tmp2-tmp1;
   var mm2=new Date();
   mm2.setTime(mm.getTime()-ne);
   
   
   year2=mm2.getYear();
   mon2=mm2.getMonth()+1;
   date2=mm2.getDate();
    
    
     if(mon2<10) 
    monstr2="0"+mon2;
   else
    monstr2=""+mon2;
     
   if(date2<10) 
     datestr2="0"+date2;
   else
     datestr2=""+date2;

   
    return year2+"-"+monstr2+"-"+datestr2;
}



var gdCtrl = new Object();
var goSelectTag = new Array();
var gcGray = "#808080";
var gcToggle = "#FB8664";
var gcBG = "#e5e6ec";
var previousObject = null;

var gdCurDate = new Date();
var giYear = gdCurDate.getFullYear();
var giMonth = gdCurDate.getMonth()+1;
var giDay = gdCurDate.getDate();

function fSetDate(iYear, iMonth, iDay){
var VicPopCal = document.getElementById('VicPopCal');
  VicPopCal.style.visibility = "hidden";
  if ((iYear == 0) && (iMonth == 0) && (iDay == 0)){
   gdCtrl.value = "";
  }else{
   iMonth = iMonth + 100 + "";
   iMonth = iMonth.substring(1);
iDay = iDay + 100 + "";
  iDay = iDay.substring(1);
   if(gdCtrl.tagName == "INPUT"){
      gdCtrl.value = iYear+"-"+iMonth+"-"+iDay;
   }else{
      gdCtrl.innerText = iYear+"-"+iMonth+"-"+iDay;
   }
  }

  for (i in goSelectTag)
   goSelectTag[i].style.visibility = "visible";
  goSelectTag.length = 0;
  
  window.returnValue=gdCtrl.value;
  //window.close();


}

function HiddenDiv()
{
var VicPopCal = document.getElementById('VicPopCal');
var i;
  VicPopCal.style.visibility = "hidden";
  for (i in goSelectTag)
   goSelectTag[i].style.visibility = "visible";
  goSelectTag.length = 0;

}
function fSetSelected(aCell){
var tbSelMonth1 = document.getElementById('tbSelMonth');
var tbSelYear1 = document.getElementById('tbSelYear');
  var iOffset = 0;
  var iYear = parseInt(tbSelYear1.value);
  var iMonth = parseInt(tbSelMonth1.value);
  
  aCell.bgColor = gcBG;

// with (aCell.children["cellText"]){

  with (aCell.childNodes[0]){
   var iDay = parseInt(innerHTML);
   if (color==gcGray)
  iOffset = (Victor<10)?-1:1;
iMonth += iOffset;
if (iMonth<1) {
  iYear--;
  iMonth = 12;
}else if (iMonth>12){
  iYear++;
  iMonth = 1;
}
  }
  fSetDate(iYear, iMonth, iDay);
}

function Point(iX, iY){
this.x = iX;
this.y = iY;
}

function fBuildCal(iYear, iMonth) {
  var aMonth=new Array();
  for(i=1;i<7;i++)
   aMonth[i]=new Array(i);
    
  var dCalDate=new Date(iYear, iMonth-1, 1);
  var iDayOfFirst=dCalDate.getDay();
  var iDaysInMonth=new Date(iYear, iMonth, 0).getDate();
  var iOffsetLast=new Date(iYear, iMonth-1, 0).getDate()-iDayOfFirst+1;
  var iDate = 1;
  var iNext = 1;

  for (d = 0; d < 7; d++)
aMonth[1][d] = (d<iDayOfFirst)?-(iOffsetLast+d):iDate++;
  for (w = 2; w < 7; w++)
   for (d = 0; d < 7; d++)
  aMonth[w][d] = (iDate<=iDaysInMonth)?iDate++:-(iNext++);
  return aMonth;
}

function fDrawCal(iYear, iMonth, iCellHeight, sDateTextSize) {
  //var WeekDay = new Array("S","M","T","W","T","W","S");

  var WeekDay = new Array("日","一","二","三","四","五","六");
  var styleTD = " bgcolor='"+gcBG+"' bordercolor='"+gcBG+"' valign='middle' align='center' height='"+iCellHeight+"' style='font:bold arial "+sDateTextSize+";"; //Coded by Hcy email:hcy110@263.net


  with (document) {
write("<tr>");
for(i=0; i<7; i++){
  write("<td "+styleTD+"color:maroon' >"+ WeekDay[i] + "</td>");
}
write("</tr>");

   for (w = 1; w < 7; w++) {
  write("<tr>");
  for (d = 0; d < 7; d++) {
   write("<td id='calCell' "+styleTD+"cursor:pointer;' onMouseOver='this.bgColor=gcToggle' onMouseOut='this.bgColor=gcBG' onclick='fSetSelected(this)'>");
   write("<font id='cellText' name='cellText' Victor='Hcy_Flag'> </font>"); 
   write("</td>")
  }
  write("</tr>");
}
  }
}

function fUpdateCal() {

iYear = document.getElementById('tbSelYear').value;
iMonth = document.getElementById('tbSelMonth').value;
  myMonth = fBuildCal(iYear, iMonth);
  
  var cellText = document.getElementsByName('cellText');
  var i = 0;
  for (w = 0; w < 6; w++)
for (d = 0; d < 7; d++)
  with (cellText[(7*w)+d]) {
   Victor = i++;
   if (myMonth[w+1][d]<0) {
    color = gcGray;
    innerHTML = -myMonth[w+1][d];
   }else{
    color = ((d==0)||(d==6))?"red":"black";
    innerHTML = myMonth[w+1][d];
   }
  }
  
}

function fSetYearMon(iYear, iMon){
  var tbSelMonth = document.getElementById('tbSelMonth');
  tbSelMonth.options[iMon-1].selected = true;

  var tbSelYear = document.getElementById('tbSelYear');
  for (i = 0; i < tbSelYear.length; i++)
if (tbSelYear.options[i].value == iYear)
  tbSelYear.options[i].selected = true;

  fUpdateCal(iYear, iMon);
  
}

function fPrevMonth(){
var tbSelYear = document.getElementById('tbSelYear');
var tbSelMonth = document.getElementById('tbSelMonth');
  var iMon = tbSelMonth.value;
  var iYear = tbSelYear.value;
  
  if (--iMon<1) {
   iMon = 12;
   iYear--;
  }
  
  fSetYearMon(iYear, iMon);
}

function fNextMonth(){
var tbSelMonth = document.getElementById('tbSelMonth');
var tbSelYear = document.getElementById('tbSelYear');
  var iMon = tbSelMonth.value;
  var iYear = tbSelYear.value;
  
  if (++iMon>12) {
   iMon = 1;
   iYear++;
  }
  
  fSetYearMon(iYear, iMon);
}

function fToggleTags(){
var select = document.getElementsByTagName("SELECT");

var isIE4 = ((navigator.userAgent.indexOf('Win') != -1) && (navigator.userAgent.indexOf('MSIE') != -1) && (parseInt(navigator.appVersion) >= 4 ));
if (isIE4)
{
for (i=0; i<select.length; i++)
    if ((select[i].Victor != 'Won') && fTagInBound(select[i])){
     select[i].style.visibility = "hidden";
     goSelectTag[goSelectTag.length] = select[i];
    }

with (document.all.tags("SELECT")){
   for (i=0; i<length; i++)
    if ((item(i).Victor!="Won")&&fTagInBound(item(i))){
     item(i).style.visibility = "hidden";
     goSelectTag[goSelectTag.length] = item(i);
    }
}
}

}

function fTagInBound(aTag){
var VicPopCal = document.getElementById('VicPopCal');
  with (VicPopCal.style){
   var l = parseInt(left);
   var t = parseInt(top);
   var r = l+parseInt(width);
   var b = t+parseInt(height);
var ptLT = fGetXY(aTag);
return !((ptLT.x>r)||(ptLT.x+aTag.offsetWidth<l)||(ptLT.y>b)||(ptLT.y+aTag.offsetHeight<t));
  }
}

function fGetXY(aTag){
  var oTmp = aTag;
  var pt = new Point(0,0);
  do {
   pt.x += oTmp.offsetLeft;
   pt.y += oTmp.offsetTop;
   oTmp = oTmp.offsetParent;
  } while(oTmp.tagName!="BODY");
  
  return pt;
}

// Main: popCtrl is the widget beyond which you want this calendar to appear;

// dateCtrl is the widget into which you want to put the selected date.

// i.e.: <input type="text" name="dc" style="text-align:center" readonly><INPUT type="button" value="V" >

function fPopCalendar(popCtrl, dateCtrl,strDate){
var VicPopCal = document.getElementById('VicPopCal');
  if (popCtrl == previousObject){
    if (VicPopCal.style.visibility == "visible"){
    HiddenDiv();
    return true;
   }
   
  }

  previousObject = popCtrl;
  gdCtrl = dateCtrl;
  fInitialDate(strDate);
  
  fSetYearMon(giYear, giMonth); 
  
  var point = fGetXY(popCtrl);
  with (VicPopCal.style) {
   left = point.x;
top = point.y+popCtrl.offsetHeight;
width = VicPopCal.offsetWidth;
width = 210; //

height = VicPopCal.offsetHeight;
fToggleTags(point); 
visibility = 'visible';
  }
  //在firefox下面必须带上px,否则会有异常

  VicPopCal.style.left = point.x + "px";
  VicPopCal.style.top = point.y + popCtrl.offsetHeight + "px";
}

// Added by Han Chen

function fInitialDate(strDate){
if( strDate == null || strDate.length != 10 )
  return false;

var sYear = strDate.substring(0,4);
var sMonth = strDate.substring(5,7);
var sDay = strDate.substring(8,10);

if( sMonth.charAt(0) == '0' ) { sMonth = sMonth.substring(1,2); }
if( sDay.charAt(0) == '0' ) { sDay = sDay.substring(1,2); }

var nYear = parseInt(sYear );
var nMonth = parseInt(sMonth);
var nDay = parseInt(sDay );

if ( isNaN(nYear ) ) return false;
if ( isNaN(nMonth) ) return false;
if ( isNaN(nDay ) ) return false;

var arrMon = new Array(12);
arrMon[ 0] = 31; arrMon[ 1] = nYear % 4 == 0 ? 29:28;
arrMon[ 2] = 31; arrMon[ 3] = 30;
arrMon[ 4] = 31; arrMon[ 5] = 30;
arrMon[ 6] = 31; arrMon[ 7] = 31;
arrMon[ 8] = 30; arrMon[ 9] = 31;
arrMon[10] = 30; arrMon[11] = 31;

if ( nYear < 1900 || nYear > 2008 ) return false;
if ( nMonth < 1 || nMonth > 12 ) return false;
if ( nDay < 1 || nDay > arrMon[nMonth - 1] ) return false;

giYear = nYear;
giMonth = nMonth;
giDay = nDay;
return true;
}

var gMonths = new Array("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月");
with (document) {
write("<Div id='VicPopCal' style='POSITION:absolute;VISIBILITY:hidden;border:0px ridge;z-index:100;'>");
write("<table border='0' bgcolor='#cccccc' style='FONT-SIZE: 12px;'>");
write("<TR>");
write("<td valign='middle' align='center'><input type='button' name='PrevMonth' value='<' style='height:20;width:20;FONT:bold' onClick='fPrevMonth()'>");
write(" <SELECT name='tbSelYear' id='tbSelYear' onChange='fUpdateCal()' Victor='Won'>");
for(i=2000;i<5000;i++)
write("<OPTION value='"+i+"'>"+i+" </OPTION>");
write("</SELECT>");
write(" <select name='tbSelMonth' id='tbSelMonth' onChange='fUpdateCal()' Victor='Won'>");
for (i=0; i<12; i++)
write("<option value='"+(i+1)+"'>"+gMonths[i]+"</option>");
write("</SELECT>");
write(" <input type='button' name='PrevMonth' value='>' style='height:20;width:20;FONT:bold' onclick='fNextMonth()'>");
write("</td>");
write("</TR><TR>");
write("<td align='center'>");
write("<DIV style='background-color:teal'><table width='100%' border='0'>");
fDrawCal(giYear, giMonth, 20, '12');
write("</table></DIV>");
write("</td>");
write("</TR><TR><TD align='center'>");
write("<TABLE width='100%' style='FONT-SIZE: 12px;'><TR><TD align='center'>");
write("<B style='cursor:pointer' onclick='HiddenDiv()' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=0'>关闭</B>");
write("</td><td algin='center' style='FONT-SIZE: 12px;'>");
write("<B style='cursor:pointer' onclick='fSetDate(" + giYear + "," + giMonth + "," + giDay + ")' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=0'>今天: "+giYear+"-"+giMonth+"-"+giDay+"</B>");
write("</td></tr></table>");
write("</TD></TR>");
write("</TABLE></Div>");
}
</script>
	</body>
</html>
