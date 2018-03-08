package dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
public class CopyOfuserUpdateResident extends HttpServlet {

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
		String residenttype = request.getParameter("residenttype");
		String dialogcertno = request.getParameter("dialogcertno");
		
		String intime= Other.time("yyyy-MM-dd HH:mm:ss");
		//ת�� ��Ȼ����������
	    //String salesdepartment = new String(request.getParameter("residenttype").getBytes("iso-8859-1"), "utf-8");  


	    
		//����ѯ��Ϣ���� map
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("investorid", investorid);
		map.put("intime", intime);
		map.put("residenttype", residenttype);
		map.put("dialogcertno", dialogcertno);
		//�������ݿ������Ϣ
		Main main = new Main();	
		int result = main.updateResidentStatus(map);
	
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();

	}
}
