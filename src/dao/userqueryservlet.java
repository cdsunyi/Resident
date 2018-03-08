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
		
		//���÷������˱��� Ϊ UTF-8 ���ַ���������
		//response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//post ��������ҳ����������ݱ��� 
		//request.setCharacterEncoding("utf-8");
		
		String investorid = request.getParameter("investorid");
		//String identitycard = request.getParameter("identitycard");
		//ת�� ��Ȼ����������
	    //String salesdepartment = new String(request.getParameter("salesdepartment").getBytes("iso-8859-1"), "utf-8");  
		String refresh = request.getParameter("refresh");
		String salesdepartment = "";

		//ˢ��-1  ��ѯ-0
		if(refresh.endsWith("0")){
			//����
			String salesdepartment_1 = request.getParameter("salesdepartment");
			salesdepartment = java.net.URLDecoder.decode(salesdepartment_1, "UTF-8");// ����
			salesdepartment = new String(salesdepartment.getBytes("iso-8859-1"), "utf-8");
	
		}	
		else{
			//�����ˢ�½����Ͳ��ý���
			salesdepartment = request.getParameter("salesdepartment");
		}

		
	    String PageNo = request.getParameter("PageNo");
	    String PageSize = request.getParameter("PageSize");

	    //System.out.println(salesdepartment);
	    
		//����ѯ��Ϣ���� map
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("investorid", investorid);
		//map.put("identitycard", identitycard);
		map.put("salesdepartment", salesdepartment);
		
		map.put("PageNo", PageNo);
		map.put("PageSize", PageSize);
		
		//�������ݿ��ѯ��Ϣ
		Main main = new Main();	
		ArrayList<HashMap<String, String>> list = main.queryexcle(map);
		
		
		HashMap<String, String> map1 = new HashMap<String, String>();
		
        JSONObject result = new JSONObject();  
        //���������ʽ�������ݿ�����  
        JSONArray jsonArr= new JSONArray();  
		//��ȡ������
        int num  = 0;
        int totalnum = 0;
        num = list.size();
        totalnum = num;
        //�����ѯ����Ӫҵ�� �����ǵ����ѯ��ť ִ�в�ѯ������
/*        if((PageNo.endsWith("1"))&&(salesdepartment != "")){
        	String strnum = main.queryexclebrachcount(salesdepartment);
        	num = Integer.parseInt(strnum);
        }*/
        if(investorid == ""){
        	String strnum = main.queryexclebrachcount(salesdepartment);
        	totalnum = Integer.parseInt(strnum);
        }
        
        //��ȡ����  
        result.put("total", totalnum);   //�������
        
        //��ѯ�û���ַ �绰
        HashMap<String, String> usertelAdrmap = null;
        
        //��ѯ�û���Ȩ��
        HashMap<String, String> userequity = null;
    
		if(num != 0){
			for(int i =0;i<num;i++){
				JSONObject obj = new JSONObject();  
				map1 = list.get(i);
				//��ѯ�û���ַ �绰
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
	            jsonArr.add(obj);    //��ӵ�������  
			}
		}	
        result.put("rows", jsonArr);  
		
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();

	}
	
	//��ѯ�û���ַ �绰
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
