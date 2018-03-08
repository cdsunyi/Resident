package dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.Vector;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ResidentSerach extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 设置服务器端编码 为 UTF-8 两种方法都可以
		// response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String PageNo = request.getParameter("PageNo");
		String PageSize = request.getParameter("PageSize");
		int PageNoNum= Integer.parseInt(PageNo);
		int PageSizenum= Integer.parseInt(PageSize);
		HttpSession session = request.getSession();
		int totalnum = 0;
		
		String certnoIniFile = request.getRealPath("/");
		
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		if(PageNoNum == 0){
			PageNoNum = PageNoNum + 1;
			list = queryuserinfo(PageNo,PageSize,certnoIniFile);
			Enumeration e= session.getAttributeNames();
			while(e.hasMoreElements())
			{
				String sessionName = e.nextElement().toString();
				if(sessionName.equals("residentserach"))
				{
					session.removeAttribute("residentserach");
					System.out.println("delete");
				}
				System.out.println(sessionName);
			}
			
/*			if (session.getAttribute("residentserach").toString() != null) {
				session.removeAttribute("residentserach");
			}*/			
			session.setAttribute("residentserach", list);
		}else{
			list = (ArrayList<HashMap<String, String>>)session.getAttribute("residentserach");
		}
		
		JSONObject result = new JSONObject();
		// 以数组的形式保存数据库结果集
		JSONArray jsonArr = new JSONArray();
		
		// 查询用户总权益
		// HashMap<String, String> userequity = null;
		HashMap<String, String> map1 = new HashMap<String, String>();
		int num = list.size();
		totalnum = num;
		if (num != 0) {
			for (int i = (PageNoNum-1)*PageSizenum; i < PageNoNum*PageSizenum; i++) {
				JSONObject obj = new JSONObject();
				map1 = list.get(i);

				obj.put("userid", map1.get("investorid").toString());
				obj.put("username", map1.get("username").toString());
				obj.put("identitycard", map1.get("identitycard").toString());
				obj.put("address", map1.get("address").toString());
				obj.put("phone", map1.get("phone").toString());
				obj.put("investortype", map1.get("investortype").toString());
				obj.put("noresident", map1.get("noresident").toString());
				obj.put("phonecountrycode", map1.get("phonecountrycode").toString());
				obj.put("checkrestultinfo", map1.get("checkrestultinfo").toString());
				jsonArr.add(obj); // 添加到数组中
				if(i == (num-1)){
					break;
				}
			}
		}				
		
		// 获取列数
		result.put("total", totalnum); // 添加行数
		
		result.put("rows", jsonArr);
		
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();

	}

	//查询客户
	public ArrayList<HashMap<String, String>> queryuserinfo(String PageNo,String PageSize,String certnoIniFile){
		// 将查询信息存入 map
				HashMap<String, String> map = new HashMap<String, String>();

				map.put("PageNo", PageNo);
				map.put("PageSize", PageSize);
				
				// 连接数据库查询信息
				Main main = new Main();
				ArrayList<HashMap<String, String>> list = main.checkNonResident(map);

				HashMap<String, String> map1 = new HashMap<String, String>();

				// 获取总行数
				int num = 0;
				
				num = list.size();
				// 如果查询的是营业部 并且是点击查询按钮 执行查询总条数
				/*
				 * if((PageNo.endsWith("1"))&&(salesdepartment != "")){ String strnum =
				 * main.queryexclebrachcount(salesdepartment); num =
				 * Integer.parseInt(strnum); }
				 */

				// 查询用户地址 电话
				HashMap<String, String> usertelAdrmap = null;
				ArrayList<HashMap<String, String>> resultlist = new ArrayList<HashMap<String,String>>();
				HashMap<String, String> resultmap = null;
				
				if (num != 0) {
					for (int i = 0; i < num; i++) {
						JSONObject obj = new JSONObject();
						map1 = list.get(i);
						// 查询用户地址 电话
						usertelAdrmap = new HashMap<String, String>();
						String forminvestorid = formstr(map1.get("investorid").toString());
						usertelAdrmap = queryuseradrtel(main, forminvestorid,certnoIniFile);	
						String nonResidentstr = main.nonResident(map1.get("residenttype").toString());
						try{
							map1.put("username", usertelAdrmap.get("username").toString());
							map1.put("identitycard", usertelAdrmap.get("certno").toString());
							map1.put("address", usertelAdrmap.get("adr").toString());
							map1.put("phone", usertelAdrmap.get("tel").toString());
							map1.put("investortype", usertelAdrmap.get("investortype").toString());
							map1.put("noresident", nonResidentstr);
							map1.put("phonecountrycode", usertelAdrmap.get("phonecountrycode").toString());
						}catch (Exception e) {
							// TODO: handle exception
							System.out.println(usertelAdrmap.get("username").toString());
						}

						
						if((!nonResidentstr.equals("居民"))||(!usertelAdrmap.get("checkrestultinfo").toString().equals("true"))){
							resultmap = new HashMap<String, String>();
							resultmap.put("investorid", map1.get("investorid").toString());
							resultmap.put("username", usertelAdrmap.get("username").toString());
							resultmap.put("identitycard", usertelAdrmap.get("certno").toString());
							resultmap.put("address", usertelAdrmap.get("adr").toString());
							resultmap.put("phone", usertelAdrmap.get("tel").toString());
							resultmap.put("investortype", usertelAdrmap.get("investortype").toString());
							resultmap.put("noresident", nonResidentstr);
							resultmap.put("phonecountrycode", usertelAdrmap.get("phonecountrycode").toString());
							resultmap.put("checkrestultinfo", usertelAdrmap.get("checkrestultinfo").toString());
							resultlist.add(resultmap);
							System.out.println(usertelAdrmap.get("checkrestultinfo").toString());
						}
					}
				}
				return resultlist;
	}
	
	
	// 查询用户地址 电话 名字 身份证
	public HashMap<String, String> queryuseradrtel(Main main, String investorid,String certnoIniFile) {
		HashMap<String, String> map = new HashMap<String, String>();
		String tempStr = "空";
		String country = tempStr;
		String province = tempStr;
		String city = tempStr;
		String ADDRESS = tempStr;
		String TELEPHONE = tempStr;
		String adr = tempStr;
		String username = tempStr;
		String certno = tempStr;
		String investortype = tempStr;
		String phonecountrycode = tempStr;
		String resultStr = "";
		if(investorid.equals("9999821750")){
			System.out.println(investorid);
		}
		map = main.queryuseradrtel(investorid);
		if (map.size() != 0) {
			country = map.get("COUNTRY") != null ? map.get("COUNTRY") : tempStr;
			province = map.get("PROVINCE") != null ? map.get("PROVINCE") : tempStr;
			city = map.get("CITY") != null ? map.get("CITY") : tempStr;
			TELEPHONE = map.get("TELEPHONE") != null ? map.get("TELEPHONE") : tempStr;
			username = map.get("INVESTORNAME") != null ? map.get("INVESTORNAME") : tempStr;
			certno = map.get("IDENTIFIEDCARDNO") != null ? map.get("IDENTIFIEDCARDNO") : tempStr;
			investortype = map.get("INVESTORTYPE") != null ? map.get("INVESTORTYPE") : tempStr;
			phonecountrycode = map.get("PHONECOUNTRYCODE") != null ? map.get("PHONECOUNTRYCODE") : tempStr;
			
			ADDRESS = map.get("ADDRESS") != null ? map.get("ADDRESS") : tempStr;
			adr = country + province + city + ADDRESS;
		}
		HashMap<String, String> returnmap = new HashMap<String, String>();
		returnmap.put("tel", TELEPHONE);
		returnmap.put("adr", adr);
		returnmap.put("certno", certno);
		returnmap.put("username", username);
		returnmap.put("investortype", investortype);
		returnmap.put("phonecountrycode", phonecountrycode);
		
		//判断是身份证 地址 电话号码否是符合规则
		resultStr = checkcertno(investortype,certno,certnoIniFile);
		if(resultStr.equals("true")){			
			if(checkadr(country)){ 
				if(checktel(phonecountrycode)){					
					resultStr = "true";					
				}else{
					resultStr = "电话区域号码有误";
				}
			}else{
				resultStr = "地址信息有误";
			}			
		}
		returnmap.put("checkrestultinfo", resultStr);
		return returnmap;
		
	}

	public String formstr(String investorid) {
		investorid = investorid.replace(" ", "");
		investorid = investorid.replace("\t", "");
		return investorid;
	}
	
	//判断身份证是否是居民  是居民返回字符串 true 不是返回原因
	public String checkcertno(String investortype, String certno,String certnoIniFile){
		//System.out.println(investortype);
		//如果investortype 为空
		if(investortype.equals("空")){
			investortype = "-1";
		}		
		int investortype_int = Integer.parseInt(investortype);
		int num = -1;
		String resultStr = "未知错误";
		switch (investortype_int) {
		//自然人
		case 0:
			certno = formstr(certno);
			num = certno.length();
			//如果身份证15位  或者 18位
			if((num == 15)||(num == 18)){
				
				certnoIniFile = certnoIniFile+"ini/certno.txt";
				//System.out.println("ini位置信息:"+certnoIniFile);
				if(cheakfile(certnoIniFile)){
					//System.out.println(certnoIniFile);
					//readerfile(certnoIniFile);
					
					resultStr = cheakCertnoStr(certno,readerfile(certnoIniFile));
				}else{
					System.out.println("请检查此路径是否存在:"+certnoIniFile);
					resultStr = "判断身份证配置文件不存在";
				}
				
				
			}else{
				resultStr = "身份证长度不是15位或者18位:"+num;
			}
			break;
		//机构	
		case 1:
			certno = formstr(certno);
			num = certno.length();
			//组织机构代码证格式为“12345678-9”，其中数字可以是英文字母
			if(num == 10){
				resultStr = checkInstitutionCode(certno);							
			}else{
				resultStr = "机构代码长度不是10位";
			}
			
			break;
			
		//其他情况	
		case 2:
			//resultStr = "待确定-2";
			resultStr = "true";
			break;	
			
		//其他情况	
		case 3:
			//resultStr = "待确定-3";
			resultStr = "true";
			break;
			
		//其他情况	
		case 4:
			//resultStr = "待确定-4";
			resultStr = "true";
			break;
		
		case -1:
			resultStr = "客户类型为空-1";
			break;
			
		default:
			break;
		}
		
		return resultStr;
	}

	//判断住址是否是居民
	public boolean checkadr(String adr){
		adr = adr.replace(" ", "");
		adr = adr.replace("\t", "");
		if(adr.equals("中国")){
			return true;
		}
		return false;
	}
	
	//判断电话号码区号是否是居民
	public boolean checktel(String phonecountrycode){
		phonecountrycode = phonecountrycode.replace(" ", "");
		phonecountrycode = phonecountrycode.replace("\t", "");
		if(phonecountrycode.equals("86")){
			return true;
		}
		return false;
	}
	
	//判断机构字符串方法
	public String checkInstitutionCode(String code){
		String resultStr = "未知错误";
		String fiststr = code.substring(0, 8);	
		//正则表达式符合数字和字母
		String regex = "^[a-z0-9A-Z]+$";
		//判断前8位是否符合规则
		if(fiststr.matches(regex)){
			String midstr = code.charAt(8)+"";
			//判断第9位是否符合规则
			if(midstr.equals("-")){
				String endtstr = code.charAt(9)+"";
				//判断第10位是否符合规则
				if(endtstr.matches(regex)){
					resultStr = "true";
				}else{
					resultStr = "机构代码第10位不符合规定";
				}
			}else{
				resultStr = "机构代码第9位不符合规定";
			}
		}else{
			resultStr = "机构代码前8位不符合规定";
		}
		return resultStr;
	}
	
	
	/**
	 * 打开配置文件 并读取相关信息
	 * 
	 * @param fileName
	 *            打开配置文件的位置
	 */
	public static HashMap<String, Set<String>> readerfile(String fileName) {
		String infostr[] = new String[6];
		File file = new File(fileName);
		BufferedReader reader = null;
		HashMap<String, Set<String>> map = new HashMap<String, Set<String>>();
		
		
		int line = 0;
		// 一次读入一行，直到读入null为文件结束
		try {
			// System.out.println("以行为单位读取文件内容，一次读一整行：");
			reader = new BufferedReader(new FileReader(file));
			String tempString = null;
						
			
			Set<String> set1 = new HashSet<String>();
			Set<String> set2 = new HashSet<String>();
			Set<String> set3 = new HashSet<String>();
			Set<String> set4 = new HashSet<String>();
			Set<String> set5 = new HashSet<String>();
			Set<String> set6 = new HashSet<String>();
			Set<String> set7 = new HashSet<String>();
			Set<String> set8 = new HashSet<String>();
			/*Vector<String> vec1 = new Vector<String>();
			Vector<String> vec2 = new Vector<String>();
			Vector<String> vec3 = new Vector<String>();
			Vector<String> vec4 = new Vector<String>();
			Vector<String> vec5 = new Vector<String>();
			Vector<String> vec6 = new Vector<String>();*/
			
			while ((tempString = reader.readLine()) != null) {
				// 显示行号
				//infostr[line] = disposeStr(tempString);
				tempString = tempString.replace(" ", "");
				String regex = "^[a-z0-9A-Z]+$";
				if((tempString.equals(""))||(!tempString.matches(regex))){
					continue;
				}
				String fistStr = tempString.substring(0, 1);
				int fistStr_int = Integer.parseInt(fistStr);
				
				switch(fistStr_int){
				case 1:
					set1.add(tempString);
					break;
				case 2:
					set2.add(tempString);
					break;
				case 3:
					set3.add(tempString);
					break;
				case 4:
					set4.add(tempString);
					break;
				case 5:
					set5.add(tempString);
					break;
				case 6:
					set6.add(tempString);
					break;
				case 7:
					set7.add(tempString);
					break;
				case 8:
					set8.add(tempString);
					break;
				default:
					break;
				}
				
/*				if(fistStr.equals("4")){
					System.out.println("line " + line + ": " + tempString);
					line++;
				}*/

			}
			reader.close();
			map.put("1", set1);
			map.put("2", set2);
			map.put("3", set3);
			map.put("4", set4);
			map.put("5", set5);
			map.put("6", set6);
			map.put("7", set7);
			map.put("8", set8);
			//System.out.println(set1.size()+set2.size()+set3.size()+set4.size()+set5.size()+set6.size()+set7.size()+set8.size());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}

		}
		return map;
	}
	
	/**
	 * 判断文件夹是否存在
	 * 
	 * @param logFileAdr
	 *            打开配置文件的位置
	 */
	public static boolean cheakfile(String logFileAdr) {
		// 判断log文件夹是否存在
/*		File folder = new File(logFileAdr);
		if (!folder.exists()) {
			return false;
		}*/

		// 判断txt文件是否存在
		java.io.File file = new java.io.File(logFileAdr);
		if (file.exists()) {
			// System.out.println(file + " is already exists!");
			return true;
		} else {
			// System.out.println(file + " not found!");
			return false;
		}
	}
	
	public String cheakCertnoStr(String certnostr, HashMap<String, Set<String>> map){
		String fistStr = certnostr.substring(0, 1);
		if(map.containsKey(fistStr)){
			if(map.get(fistStr).contains(certnostr.substring(0, 4))){
				//System.out.println("ok");
				return "true";
			}else{
				return "身份证前四位不属于中国省市";
			}
		}else{
			return "身份证第一位不属于中国省市";
		}
				
	}
	
}
