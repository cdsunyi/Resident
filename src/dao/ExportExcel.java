package dao;


import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ExportExcel extends HttpServlet{
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
       // javax.servlet.ServletOutputStream out = response.getOutputStream();
        //String filepath=request.getRealPath("/") + "uploadfile/";
        //String filename=new String(request.getParameter("filename").getBytes("ISO8859_1"),"GB2312").toString();
		
		String investorid = request.getParameter("investorid");
		String salesdepartment = request.getParameter("salesdepartment");
		String salesdepartmentnum = request.getParameter("salesdepartmentnum");
		
		String pageinfo = request.getParameter("pageinfo");;
		
		//获取导出选择信息 导出当前页面为0，导出全部信息为1
		String pagestatus = request.getParameter("pagestatus");
		
		String pageinfoarray[] = pageinfo.split(";");
		
	    String PageNo = request.getParameter("PageNo");
	    String PageSize = request.getParameter("PageSize");
	    String downloadfilename = "downloadfile/"+salesdepartmentnum+"/";
	    String filepath=request.getRealPath("/")+downloadfilename;
	    java.io.File dir = new java.io.File(filepath);	    
	    if(!dir.exists()){
	        //创建目录  
	        if (dir.mkdirs()) {  
	            System.out.println("创建目录" + filepath + "成功！");  
	             
	        } else {  
	            System.out.println("创建目录" + filepath + "失败！");  
	              
	        } 
	    }else{
	    	DeleFile delFile = new DeleFile();
	    	delFile.delFolder(dir.toString());
	    }	    
        
        Date d = new Date(); 
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");  
        String dateNowStr = sdf.format(d);   
        
        String filename=dateNowStr+".xls";
        System.out.println("DownloadFile filepath:" + filepath + filename);
        if(pagestatus.equals("0")){
        	createExcle(pageinfoarray,filepath + filename); 
        }else{
        	
      	  //将查询信息存入 map
      		HashMap<String, String> map = new HashMap<String, String>();
      		map.put("investorid", investorid);
      		//map.put("identitycard", identitycard);
      		map.put("salesdepartment", salesdepartment);
      		
      		map.put("PageNo", PageNo);
      		map.put("PageSize", PageSize);
        	createExcle(map,filepath + filename); 
        }
          
        java.io.File file = new java.io.File(filepath + filename);
        if (!file.exists()) {
         System.out.println(file.getAbsolutePath() + " 文件不存在!");
            return;
        }          
        
		PrintWriter out1 = response.getWriter();
		out1.println(downloadfilename+filename);
		out1.flush();
		out1.close();
        
        //设置响应头，控制浏览器下载该文件
        /*response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(filename, "UTF-8"));
        //读取要下载的文件，保存到文件输入流
        FileInputStream in = new FileInputStream(file);
        //创建输出流
        OutputStream out = response.getOutputStream();
        //创建缓冲区
        byte buffer[] = new byte[1024];
        int len = 0;
        //循环将输入流中的内容读取到缓冲区当中
        while((len=in.read(buffer))>0){
        //输出缓冲区的内容到浏览器，实现文件下载
        out.write(buffer, 0, len);
        }

        //关闭文件输入流
        in.close();
        //关闭输出流
        out.close();*/
		
	}
	
	public void createExcle(String[] pageinfoarray,String path){
		
		// 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();  
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("学生表一");  
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
  
        HSSFCell cell = row.createCell((short) 0);  
        cell.setCellValue("客户号");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 1);  
        cell.setCellValue("客户名称");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 2);  
        cell.setCellValue("身份证明");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 3);  
        cell.setCellValue("客户居民地址或邮寄地址");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 4);  
        cell.setCellValue("客户手提电话");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 5);  
        cell.setCellValue("客户期末权益加总");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 6);  
        cell.setCellValue("非居民标识");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 7);  
        cell.setCellValue("非居民标识日期");  
        cell.setCellStyle(style);  
        
        // 第五步，写入实体数据 实际应用中这些数据从数据库得到，    
		
		for(int i=0;i<pageinfoarray.length;i++){
			row = sheet.createRow((int) i + 1);
			String infoarray[] = pageinfoarray[i].split(",");
			row.createCell((short) 0).setCellValue(infoarray[0]);
			row.createCell((short) 1).setCellValue(infoarray[1]);
			row.createCell((short) 2).setCellValue(infoarray[2]);
			row.createCell((short) 3).setCellValue(infoarray[3].replace(" ", ""));
			row.createCell((short) 4).setCellValue(infoarray[4]);
			row.createCell((short) 5).setCellValue(infoarray[5]);
			row.createCell((short) 6).setCellValue(infoarray[6]);
			row.createCell((short) 7).setCellValue(infoarray[7]);						
		}		
		 // 第六步，将文件存到指定位置  
        try  
        {  
            FileOutputStream fout = new FileOutputStream(path);  
            wb.write(fout);  
            fout.close();  
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();  
        }  
		
	}
	
	public void createExcle(HashMap<String, String> map,String path){
		
  		//连接数据库查询信息
  		Main main = new Main();	
  		ArrayList<HashMap<String, String>> list = main.queryexcle(map);       
        int num = list.size();
  		HashMap<String, String> map1 = new HashMap<String, String>();
      //查询用户地址 电话
        HashMap<String, String> usertelAdrmap = null;      
        //查询用户总权益
        HashMap<String, String> userequity = null;  
        //使用userqueryservlet类中 formstr和queryuseradrtel 函数功能
        userqueryservlet userservlet = new userqueryservlet(); 
		
        
		// 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();  
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("学生表一");  
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
  
        HSSFCell cell = row.createCell((short) 0);  
        cell.setCellValue("客户号");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 1);  
        cell.setCellValue("客户名称");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 2);  
        cell.setCellValue("身份证明");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 3);  
        cell.setCellValue("客户居民地址或邮寄地址");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 4);  
        cell.setCellValue("客户手提电话");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 5);  
        cell.setCellValue("客户期末权益加总");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 6);  
        cell.setCellValue("非居民标识");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 7);  
        cell.setCellValue("非居民标识日期");  
        cell.setCellStyle(style);  
        
        // 第五步，写入实体数据 实际应用中这些数据从数据库得到，       
		if(num != 0){
			for(int i =0;i<num;i++){ 
				row = sheet.createRow((int) i + 1);
				map1 = list.get(i);
				//查询用户地址 电话
				usertelAdrmap = new HashMap<String, String>();
				userequity = new HashMap<String, String>();
				String forminvestorid = userservlet.formstr(map1.get("investorid").toString());
				usertelAdrmap = userservlet.queryuseradrtel(main, forminvestorid);
				userequity = main.queryuserequity(forminvestorid);
				
				row.createCell((short) 0).setCellValue(forminvestorid);
				row.createCell((short) 1).setCellValue(map1.get("username").toString());
				row.createCell((short) 2).setCellValue(map1.get("certno").toString());
				row.createCell((short) 3).setCellValue(usertelAdrmap.get("adr").toString().replace(" ", "")	);
				row.createCell((short) 4).setCellValue(usertelAdrmap.get("tel").toString());
				row.createCell((short) 5).setCellValue(userequity.get("EQUITY").toString());
				row.createCell((short) 6).setCellValue(main.nonResident(map1.get("residenttype").toString()));
				row.createCell((short) 7).setCellValue(map1.get("intime").toString());
				/* 也可以这样子
	            cell = row.createCell((short) 3);  
	            cell.setCellValue("21348632148931"); */			
			}
		}
        
/*        for (int i = 0; i < 4; i++)  
        {  
            row = sheet.createRow((int) i + 1);  
             
            // 第四步，创建单元格，并设置值  
            row.createCell((short) 0).setCellValue(map.get("name").toString());  
            row.createCell((short) 1).setCellValue(map.get("sex").toString());  
            row.createCell((short) 2).setCellValue(map.get("num").toString());  
            cell = row.createCell((short) 3);  
            cell.setCellValue("21348632148931");  
        }*/  
        // 第六步，将文件存到指定位置  
        try  
        {  
            FileOutputStream fout = new FileOutputStream(path);  
            wb.write(fout);  
            fout.close();  
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();  
        }  
        
        
	}
	
	
	
	
}
