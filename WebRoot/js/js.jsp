<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<script language="JavaScript">
   //AJAXʵ�ֺ�̨ͨ��
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
  	
  //���봦����




   //���봦��������
   
  function updatePage() {   
      if (request.readyState == 4) {
       if (request.status == 200) {
           
          //����Ҫ��ʾ������ 
          var str=request.responseText;
          alert(str);
          window.location.reload(); 
                   
       } else
         alert("����״̬�� " + request.status);
     }
   }  
   
   function updatePage_lisheng() {   
      if (request.readyState == 4) {
       if (request.status == 200) {
           
          //����Ҫ��ʾ������ 
          var str=request.responseText;
          alert(str);
                   
       } else
         alert("����״̬��  " + request.status);
     }
   }  
   
 //AJAXʵ�ֺ�̨ͨ�Ž���
 
 
 
function AddDisabled(i) {
	document.getElementById(i).setAttribute("disabled", "disabled");
}
function DelDisabled(i) {
	document.getElementById(i).removeAttribute("disabled");
}
function setlblText(i, v) {
	document.getElementById(i).innerText = v;
}
function checkUserId() {
	var b = true;
	var v = document.getElementById("user_id").value;
	var reg = new RegExp("^[a-zA-Z0-9\u4e00-\u9fa5]");
	b = reg.test(v);
	if (b) {
		setlblText("lbl_user_id", "");
	} else {
		setlblText("lbl_user_id", "*������û���Ψһ�����ڵ�¼ϵͳ��");
	}
	return b;
}

function checkDepart() {
	var b = true;
	var v = document.getElementById("depart_tmp").value;
	if (v.replace(" ", "") == "") {
		b = false;
		alert('��ѡ���š�');
	}
	return b;
}

function checkUserName() {
	var v = document.getElementById("user_name").value;
	var reg = new RegExp("^[\u4e00-\u9fa5]{2,15}$|^[a-zA-Z]{4,30}$");
	var b = reg.test(v);
	if (b) {
		setlblText("lbl_user_name", "");
	} else {
		setlblText("lbl_user_name", "*�����ֻ���Ǻ���(2-15)��Ӣ����ĸ(4-30)��");
	}
	return b;
}

function checkPwd() {
	var b = true;
	var v = document.getElementById("pwd").value;
	var reg = /^[a-zA-Z0-9]{6,32}$/;
	b = reg.test(v);
	if (!b) {
		b = false;
		setlblText("lbl_pwd", "* ��������6λ��������( 0-9 )����ĸ ( a-z )���");
	} else {
		setlblText("lbl_pwd", "");
	}
	return b;
}
function checkPwd2() {
	var b = true;
	if (checkPwd()) {
		var v = document.getElementById("su_pwd").value;
		if (v.replace(" ", "") == "") {
			b = false;
			setlblText("lbl_su_pwd", "* ������");
		} else {
			if (v == document.getElementById("pwd").value) {
				setlblText("lbl_su_pwd", "");
			} else {
				b = false;
				setlblText("lbl_su_pwd", "* �����������벻һ�£�");
			}
		}
	} else {
		b = false;
	}
	return b;
}
function checkUserDis() {
	var b = true;
	var v = document.getElementById("user_dis").value;
	var reg = new RegExp("^[a-zA-Z0-9\u4e00-\u9fa5]");
	b = reg.test(v);
	if (b) {
		setlblText("lbl_user_dis", "");
	} else {
		setlblText("lbl_user_dis", "*������");
	}
	return b;
}
	
function checkRang() {
	var a = document.getElementById("rang").value;
	var v = document.getElementById("txt_k").value;
	alert(a+"    "+v);
	var b = false;
	if(a==v){
		b = true;
	};
	return b;
}
function checkCard() {
	var v = document.getElementById("cert_no").value;
	var reg = /(^\d{15}$)|(^\d{17}([0-9]|X)$)|(^([0-9A-Z]){8}$)|(^[A-Za-z0-9]{8}-[A-Za-z0-9]{1})/;
	var b = reg.test(v);
	if (b) {
		setlblText("lbl_card", "");
	} else {
		setlblText("lbl_card", "*�����֤��������֤ʧ�ܣ�");
	}
	return b;
}
function checkTel() {
	var v = document.getElementById("phone_no").value;
	var reg = /^1[358]\d{9}$/;
	var b = reg.test(v);
	if (b) {
		setlblText("lbl_tel", "");
	} else {
		setlblText("lbl_tel", "*�����13/15/18 �ֻ����룡");
	}
	return b;
}
function checkEmail() {
	var v = document.getElementById("email").value;
	var reg = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	var b = reg.test(v);
	if (b) {
		setlblText("lbl_email", "");
	} else {
		setlblText("lbl_email", "*�������������ȷ�ĵ����ʼ���");
	}
	return b;
}

function checkK() {
	var v = document.getElementById("txt_k").value;
	var reg = /^[0-9]{4}$/;
	var b = reg.test(v);
	if (b == false) {
		setlblText("lbl_k", "��֤����������");
	} else {
		setlblText("lbl_k", "");
	}
	return b;
}
function CheckValue(){
	var b=true;
	 if(!checkUserId())
	 	b=false;
	 if(!checkUserName())
	 	b=false;
	 if(!checkPwd())
	 	b=false;
	 if(!checkPwd2())
	 	b=false;
	 if(!checkUserDis())
	 	b=false;
	 if(!checkDepart())
	 	b=false;
	 return b;
}
  </script>