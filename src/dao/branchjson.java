package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class branchjson extends HttpServlet {
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
		//�������ݿ��ѯ��Ϣ
		Main main = new Main();	
		Vector<String> vec = main.querysaledepartment();
		
        JSONObject result = new JSONObject();  
        //���������ʽ�������ݿ�����  
        JSONArray jsonArr= new JSONArray();  
		//��ȡ������
        int num = 0;
        num = vec.size();
        //��ȡ����  
        result.put("total", num);   //�������
        
		if(num != 0){
			JSONObject obj=new JSONObject();;
			for(int i =0;i<num;i++){
				 
	            obj.put("id",i+1);
	            String strbranch = vec.get(i).toString();
	            String[] str = strbranch.split("-");
	            if(str.length == 1){
	            	strbranch = str[0];
	            }else
	            	strbranch = str[1];
	            obj.put("text",strbranch);
	            jsonArr.add(obj);    //��ӵ�������  
	            obj = new JSONObject(); 
			}
			obj.put("id",num+1);
			obj.put("text","�㷢�ڻ��ܲ�");
			jsonArr.add(obj);    //��ӵ�������  
		}	
		
        result.put("rows", jsonArr);      
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();

	}

}
