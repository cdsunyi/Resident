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
		
		//��ȡ����ѡ����Ϣ ������ǰҳ��Ϊ0������ȫ����ϢΪ1
		String pagestatus = request.getParameter("pagestatus");
		
		String pageinfoarray[] = pageinfo.split(";");
		
	    String PageNo = request.getParameter("PageNo");
	    String PageSize = request.getParameter("PageSize");
	    String downloadfilename = "downloadfile/"+salesdepartmentnum+"/";
	    String filepath=request.getRealPath("/")+downloadfilename;
	    java.io.File dir = new java.io.File(filepath);	    
	    if(!dir.exists()){
	        //����Ŀ¼  
	        if (dir.mkdirs()) {  
	            System.out.println("����Ŀ¼" + filepath + "�ɹ���");  
	             
	        } else {  
	            System.out.println("����Ŀ¼" + filepath + "ʧ�ܣ�");  
	              
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
        	
      	  //����ѯ��Ϣ���� map
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
         System.out.println(file.getAbsolutePath() + " �ļ�������!");
            return;
        }          
        
		PrintWriter out1 = response.getWriter();
		out1.println(downloadfilename+filename);
		out1.flush();
		out1.close();
        
        //������Ӧͷ��������������ظ��ļ�
        /*response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(filename, "UTF-8"));
        //��ȡҪ���ص��ļ������浽�ļ�������
        FileInputStream in = new FileInputStream(file);
        //���������
        OutputStream out = response.getOutputStream();
        //����������
        byte buffer[] = new byte[1024];
        int len = 0;
        //ѭ�����������е����ݶ�ȡ������������
        while((len=in.read(buffer))>0){
        //��������������ݵ��������ʵ���ļ�����
        out.write(buffer, 0, len);
        }

        //�ر��ļ�������
        in.close();
        //�ر������
        out.close();*/
		
	}
	
	public void createExcle(String[] pageinfoarray,String path){
		
		// ��һ��������һ��webbook����Ӧһ��Excel�ļ�  
        HSSFWorkbook wb = new HSSFWorkbook();  
        // �ڶ�������webbook�����һ��sheet,��ӦExcel�ļ��е�sheet  
        HSSFSheet sheet = wb.createSheet("ѧ����һ");  
        // ����������sheet����ӱ�ͷ��0��,ע���ϰ汾poi��Excel����������������short  
        HSSFRow row = sheet.createRow((int) 0);  
        // ���Ĳ���������Ԫ�񣬲�����ֵ��ͷ ���ñ�ͷ����  
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // ����һ�����и�ʽ  
  
        HSSFCell cell = row.createCell((short) 0);  
        cell.setCellValue("�ͻ���");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 1);  
        cell.setCellValue("�ͻ�����");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 2);  
        cell.setCellValue("���֤��");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 3);  
        cell.setCellValue("�ͻ������ַ���ʼĵ�ַ");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 4);  
        cell.setCellValue("�ͻ�����绰");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 5);  
        cell.setCellValue("�ͻ���ĩȨ�����");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 6);  
        cell.setCellValue("�Ǿ����ʶ");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 7);  
        cell.setCellValue("�Ǿ����ʶ����");  
        cell.setCellStyle(style);  
        
        // ���岽��д��ʵ������ ʵ��Ӧ������Щ���ݴ����ݿ�õ���    
		
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
		 // �����������ļ��浽ָ��λ��  
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
		
  		//�������ݿ��ѯ��Ϣ
  		Main main = new Main();	
  		ArrayList<HashMap<String, String>> list = main.queryexcle(map);       
        int num = list.size();
  		HashMap<String, String> map1 = new HashMap<String, String>();
      //��ѯ�û���ַ �绰
        HashMap<String, String> usertelAdrmap = null;      
        //��ѯ�û���Ȩ��
        HashMap<String, String> userequity = null;  
        //ʹ��userqueryservlet���� formstr��queryuseradrtel ��������
        userqueryservlet userservlet = new userqueryservlet(); 
		
        
		// ��һ��������һ��webbook����Ӧһ��Excel�ļ�  
        HSSFWorkbook wb = new HSSFWorkbook();  
        // �ڶ�������webbook�����һ��sheet,��ӦExcel�ļ��е�sheet  
        HSSFSheet sheet = wb.createSheet("ѧ����һ");  
        // ����������sheet����ӱ�ͷ��0��,ע���ϰ汾poi��Excel����������������short  
        HSSFRow row = sheet.createRow((int) 0);  
        // ���Ĳ���������Ԫ�񣬲�����ֵ��ͷ ���ñ�ͷ����  
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // ����һ�����и�ʽ  
  
        HSSFCell cell = row.createCell((short) 0);  
        cell.setCellValue("�ͻ���");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 1);  
        cell.setCellValue("�ͻ�����");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 2);  
        cell.setCellValue("���֤��");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 3);  
        cell.setCellValue("�ͻ������ַ���ʼĵ�ַ");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 4);  
        cell.setCellValue("�ͻ�����绰");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 5);  
        cell.setCellValue("�ͻ���ĩȨ�����");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 6);  
        cell.setCellValue("�Ǿ����ʶ");  
        cell.setCellStyle(style);  
        
        cell = row.createCell((short) 7);  
        cell.setCellValue("�Ǿ����ʶ����");  
        cell.setCellStyle(style);  
        
        // ���岽��д��ʵ������ ʵ��Ӧ������Щ���ݴ����ݿ�õ���       
		if(num != 0){
			for(int i =0;i<num;i++){ 
				row = sheet.createRow((int) i + 1);
				map1 = list.get(i);
				//��ѯ�û���ַ �绰
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
				/* Ҳ����������
	            cell = row.createCell((short) 3);  
	            cell.setCellValue("21348632148931"); */			
			}
		}
        
/*        for (int i = 0; i < 4; i++)  
        {  
            row = sheet.createRow((int) i + 1);  
             
            // ���Ĳ���������Ԫ�񣬲�����ֵ  
            row.createCell((short) 0).setCellValue(map.get("name").toString());  
            row.createCell((short) 1).setCellValue(map.get("sex").toString());  
            row.createCell((short) 2).setCellValue(map.get("num").toString());  
            cell = row.createCell((short) 3);  
            cell.setCellValue("21348632148931");  
        }*/  
        // �����������ļ��浽ָ��λ��  
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
