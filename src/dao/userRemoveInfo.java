package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class userRemoveInfo extends HttpServlet {


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
	    
		//�������ݿ������Ϣ
		Main main = new Main();	
		int result = main.deleteuserinfo(investorid);
	
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();

	}
}
