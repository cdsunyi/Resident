package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Vector;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.sun.net.httpserver.HttpServer;

public class addcontrolpersoninfo extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		//���÷������˱��� Ϊ UTF-8 ���ַ���������
		//response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//post ��������ҳ����������ݱ��� 
		//request.setCharacterEncoding("utf-8"); 
		
		String investorid = request.getParameter("investorid");
		String controlpersonname = Other.manStr(request.getParameter("p18"));
		String personalstatement = Other.manStr(request.getParameter("p19"));
		String organizationname = Other.manStr(request.getParameter("p20"));
		String organizationcountry = Other.manStr(request.getParameter("p21"));
		String organizationprovince = Other.manStr(request.getParameter("p22"));
		String organizationcity = Other.manStr(request.getParameter("p23"));
		String organizationadr = Other.manStr(request.getParameter("p24"));
		String organizationtaxnum = Other.manStr(request.getParameter("p25"));
		String controlpersonfirstname = Other.manStr(request.getParameter("p26"));
		String controlpersonlastname = Other.manStr(request.getParameter("p27"));
		String controlpersonbirthday = Other.manStr(request.getParameter("p28"));
		String controlpersoncountrychn = Other.manStr(request.getParameter("p29"));
		String controlpersonprovincechn = Other.manStr(request.getParameter("p30"));
		String controlpersoncitychn = Other.manStr(request.getParameter("p31"));
		String controlpersonadrchn = Other.manStr(request.getParameter("p32"));
		String controlpersoncountryeng = Other.manStr(request.getParameter("p33"));
		String controlpersonprovinceeng = Other.manStr(request.getParameter("p34"));
		String controlpersoncityeng = Other.manStr(request.getParameter("p35"));
		String controlpersonadreng = Other.manStr(request.getParameter("p36"));
		String controlpersoncountrychnbir = Other.manStr(request.getParameter("p37"));
		String controlpersonprovincechnbir = Other.manStr(request.getParameter("p38"));
		String controlpersoncitychnbir = Other.manStr(request.getParameter("p39"));
		String controlpersonadrchnbir = Other.manStr(request.getParameter("p40"));
		String controlpersoncountryengbir = Other.manStr(request.getParameter("p41"));
		String controlpersonprovinceengbir = Other.manStr(request.getParameter("p42"));
		String controlpersoncityengbir = Other.manStr(request.getParameter("p43"));
		String controlpersonadrengbir = Other.manStr(request.getParameter("p44"));
		String controlpersontaxnum1 = Other.manStr(request.getParameter("p45"));
		String controlpersontaxnum2 = Other.manStr(request.getParameter("p46"));
		String controlpersontaxnum3 = Other.manStr(request.getParameter("p47"));
		String controlpersontaxnumreasonnum = Other.manStr(request.getParameter("p48"));
		String controlpersontaxnumreasoninfo = Other.manStr(request.getParameter("p49"));
		String residenttype = "controlperson";
		String intime = Other.time("yyyy-MM-dd HH:mm:ss");
		String other1=null;
		String other2=null;
		
		//ȷ��residenttype������
		//"1_1" ���˿ͻ�ѡ��1.��Ϊ�й�˰�վ���
		//"1_2" ���˿ͻ�ѡ��2.��Ϊ�Ǿ��񡱻��ߡ�3.�����й�˰�վ��������������ң�������˰�վ���
		//"2_1_1" �����ͻ�ѡ��1.�����ǽ��ڻ������繴ѡ�����ͬʱ��д������˰�վ�����������ļ���������1.��Ϊ�й�˰�վ���
		//"2_1_2" �����ͻ�ѡ��1.�����ǽ��ڻ������繴ѡ�����ͬʱ��д������˰�վ�����������ļ���������2.��Ϊ�Ǿ���  ����   3.�����й�˰�վ��������������ң�������˰�վ���
		//"2_2_1" �����ͻ�ѡ��2.�����ǽ��ڻ���������1.��Ϊ�й�˰�վ����繴ѡ�����ֱ����д���������ݣ���
		//"2_2_2" �����ͻ�ѡ��2.�����ǽ��ڻ���������2.��Ϊ�Ǿ���  ����   3.�����й�˰�վ��������������ң�������˰�վ���
		//controlperson_1 �����˾���
		//controlperson_2/controlperson_3 �����˷Ǿ���
		
		residenttype = (residenttype + Other.residenttypeStr(personalstatement));
			
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("investorid", investorid);
		map.put("controlpersonname", controlpersonname);
		map.put("personalstatement", personalstatement);	
		map.put("organizationname", organizationname);
		map.put("organizationcountry", organizationcountry);
		map.put("organizationprovince", organizationprovince);		
		map.put("organizationcity", organizationcity);
		map.put("organizationadr", organizationadr);
		map.put("organizationtaxnum", organizationtaxnum);
		map.put("controlpersonfirstname", controlpersonfirstname);		
		map.put("controlpersonlastname", controlpersonlastname);
		map.put("controlpersonbirthday", controlpersonbirthday);
		map.put("controlpersoncountrychn", controlpersoncountrychn);
		map.put("controlpersonprovincechn", controlpersonprovincechn);
		map.put("controlpersoncitychn", controlpersoncitychn);
		map.put("controlpersonadrchn", controlpersonadrchn);		
		map.put("controlpersoncountryeng", controlpersoncountryeng);
		map.put("controlpersonprovinceeng", controlpersonprovinceeng);
		map.put("controlpersoncityeng", controlpersoncityeng);
		map.put("controlpersonadreng", controlpersonadreng);		
		map.put("controlpersoncountrychnbir", controlpersoncountrychnbir);
		map.put("controlpersonprovincechnbir", controlpersonprovincechnbir);
		map.put("controlpersoncitychnbir", controlpersoncitychnbir);
		map.put("controlpersonadrchnbir", controlpersonadrchnbir);
		map.put("controlpersoncountryengbir", controlpersoncountryengbir);
		map.put("controlpersonprovinceengbir", controlpersonprovinceengbir);		
		map.put("controlpersoncityengbir", controlpersoncityengbir);
		map.put("controlpersonadrengbir", controlpersonadrengbir);
		map.put("controlpersontaxnum1", controlpersontaxnum1);
		map.put("controlpersontaxnum2", controlpersontaxnum2);		
		map.put("controlpersontaxnum3", controlpersontaxnum3);
		map.put("controlpersontaxnumreasonnum", controlpersontaxnumreasonnum);
		map.put("controlpersontaxnumreasoninfo", controlpersontaxnumreasoninfo);
		map.put("residenttype", controlpersontaxnum2);		
		map.put("intime", controlpersontaxnum3);
		map.put("other1", controlpersontaxnumreasonnum);
		map.put("other2", controlpersontaxnumreasoninfo);

		
		//�������ݿ��ѯ��Ϣ
		Main main = new Main();	
		int result = main.insertintocontrolperson(map);
		String resultstr = "��Ϣ¼��ɹ�!" ;
		if(result != 1){
			resultstr = "��Ϣ¼��ʧ��!";
		}
		PrintWriter out = response.getWriter();
		out.println(resultstr);
		out.flush();
		out.close();

	}
}
