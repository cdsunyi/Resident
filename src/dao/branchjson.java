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
		
		//设置服务器端编码 为 UTF-8 两种方法都可以
		//response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//post 设置来自页面的请求数据编码 
		//request.setCharacterEncoding("utf-8"); 
		//连接数据库查询信息
		Main main = new Main();	
		Vector<String> vec = main.querysaledepartment();
		
        JSONObject result = new JSONObject();  
        //以数组的形式保存数据库结果集  
        JSONArray jsonArr= new JSONArray();  
		//获取总行数
        int num = 0;
        num = vec.size();
        //获取列数  
        result.put("total", num);   //添加行数
        
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
	            jsonArr.add(obj);    //添加到数组中  
	            obj = new JSONObject(); 
			}
			obj.put("id",num+1);
			obj.put("text","广发期货总部");
			jsonArr.add(obj);    //添加到数组中  
		}	
		
        result.put("rows", jsonArr);      
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();

	}

}
