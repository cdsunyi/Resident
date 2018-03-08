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
		
		//设置服务器端编码 为 UTF-8 两种方法都可以
		//response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//post 设置来自页面的请求数据编码 
		//request.setCharacterEncoding("utf-8");
		
		String investorid = request.getParameter("investorid");
	    
		//连接数据库更新信息
		Main main = new Main();	
		int result = main.deleteuserinfo(investorid);
	
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();

	}
}
