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
		
		//设置服务器端编码 为 UTF-8 两种方法都可以
		//response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//post 设置来自页面的请求数据编码 
		//request.setCharacterEncoding("utf-8");
		
		String investorid = request.getParameter("investorid");
		String residenttype = request.getParameter("residenttype");
		String dialogcertno = request.getParameter("dialogcertno");
		
		String intime= Other.time("yyyy-MM-dd HH:mm:ss");
		//转码 不然中文是乱码
	    //String salesdepartment = new String(request.getParameter("residenttype").getBytes("iso-8859-1"), "utf-8");  


	    
		//将查询信息存入 map
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("investorid", investorid);
		map.put("intime", intime);
		map.put("residenttype", residenttype);
		map.put("dialogcertno", dialogcertno);
		//连接数据库更新信息
		Main main = new Main();	
		int result = main.updateResidentStatus(map);
	
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();

	}
}
