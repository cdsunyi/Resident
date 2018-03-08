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

public class userqueryservlet extends HttpServlet{


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
		//String identitycard = request.getParameter("identitycard");
		//转码 不然中文是乱码
	    //String salesdepartment = new String(request.getParameter("salesdepartment").getBytes("iso-8859-1"), "utf-8");  
		String refresh = request.getParameter("refresh");
		String salesdepartment = "";

		//刷新-1  查询-0
		if(refresh.endsWith("0")){
			//解码
			String salesdepartment_1 = request.getParameter("salesdepartment");
			salesdepartment = java.net.URLDecoder.decode(salesdepartment_1, "UTF-8");// 解码
			salesdepartment = new String(salesdepartment.getBytes("iso-8859-1"), "utf-8");
	
		}	
		else{
			//如果是刷新进来就不用解码
			salesdepartment = request.getParameter("salesdepartment");
		}

		
	    String PageNo = request.getParameter("PageNo");
	    String PageSize = request.getParameter("PageSize");

	    //System.out.println(salesdepartment);
	    
		//将查询信息存入 map
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("investorid", investorid);
		//map.put("identitycard", identitycard);
		map.put("salesdepartment", salesdepartment);
		
		map.put("PageNo", PageNo);
		map.put("PageSize", PageSize);
		
		//连接数据库查询信息
		Main main = new Main();	
		ArrayList<HashMap<String, String>> list = main.queryexcle(map);
		
		
		HashMap<String, String> map1 = new HashMap<String, String>();
		
        JSONObject result = new JSONObject();  
        //以数组的形式保存数据库结果集  
        JSONArray jsonArr= new JSONArray();  
		//获取总行数
        int num  = 0;
        int totalnum = 0;
        num = list.size();
        totalnum = num;
        //如果查询的是营业部 并且是点击查询按钮 执行查询总条数
/*        if((PageNo.endsWith("1"))&&(salesdepartment != "")){
        	String strnum = main.queryexclebrachcount(salesdepartment);
        	num = Integer.parseInt(strnum);
        }*/
        if(investorid == ""){
        	String strnum = main.queryexclebrachcount(salesdepartment);
        	totalnum = Integer.parseInt(strnum);
        }
        
        //获取列数  
        result.put("total", totalnum);   //添加行数
        
        //查询用户地址 电话
        HashMap<String, String> usertelAdrmap = null;
        
        //查询用户总权益
        HashMap<String, String> userequity = null;
    
		if(num != 0){
			for(int i =0;i<num;i++){
				JSONObject obj = new JSONObject();  
				map1 = list.get(i);
				//查询用户地址 电话
				usertelAdrmap = new HashMap<String, String>();
				userequity = new HashMap<String, String>();
				String forminvestorid = formstr(map1.get("investorid").toString());
				usertelAdrmap = queryuseradrtel(main, forminvestorid);
				userequity = main.queryuserequity(forminvestorid);
				
	            obj.put("userid",map1.get("investorid").toString());
	            obj.put("username",map1.get("username").toString());
	            obj.put("identitycard", map1.get("certno").toString());
	            obj.put("address",usertelAdrmap.get("adr").toString());
	            obj.put("phone",usertelAdrmap.get("tel").toString());
	            obj.put("equity",userequity.get("EQUITY").toString());
	            obj.put("noresident",main.nonResident(map1.get("residenttype").toString()));
	            obj.put("date",map1.get("intime").toString());
	            jsonArr.add(obj);    //添加到数组中  
			}
		}	
        result.put("rows", jsonArr);  
		
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();

	}
	
	//查询用户地址 电话
	public HashMap<String, String> queryuseradrtel(Main main,String investorid){
		HashMap<String, String> map = new HashMap<String, String>();
        String country = null;
        String province= null;
        String city = null;
        String ADDRESS= null;
        String TELEPHONE= "";
        String adr = "";
		map = main.queryuseradrtel(investorid);
        if(map.size()!=0){
    		country = map.get("COUNTRY") != null ? map.get("COUNTRY"):"";
    		province = map.get("PROVINCE")!= null ? map.get("PROVINCE"):"";
    		city = map.get("CITY")!= null ? map.get("CITY"):"";
    		TELEPHONE = map.get("TELEPHONE")!= null ? map.get("TELEPHONE"):"";
    		ADDRESS = map.get("ADDRESS")!= null ? map.get("ADDRESS"):"";
    		adr = country+province+city+ADDRESS;
        }		
		new HashMap<String, String>();
		map.put("tel", TELEPHONE);
		map.put("adr", adr);
		
		return map;
	}
	
	public String formstr(String investorid){
		investorid = investorid.replace(" ", "");
		investorid = investorid.replace("\t", "");
		return investorid;
	}
	
}
