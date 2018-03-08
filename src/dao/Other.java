package dao;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Other {
	// 获取系统时间----time("yyyy-MM-dd HH:mm:ss")
	public static String time(String type) {
		SimpleDateFormat formatter = new SimpleDateFormat(type);
		Date myDate = new Date();
		String s = formatter.format(myDate);
		return s;
	}
	//数据处理，除null外，所有字符串进行转码
	public static String manStr(String s) throws UnsupportedEncodingException{
		String s_r = "";
		if(s!=null){
			s_r = s;//new String(s.getBytes("iso-8859-1"), "gbk");
		}else{
			if(s==null){
				s_r = "";
			}else{
				s_r = s;
			}
		}
		return s_r;
	}
	
	//数据处理
	public static String residenttypeStr(String s) throws UnsupportedEncodingException{
		if(s == ""){
			return "";
		}else{
			return "_"+s;
		}
	}
	
	public static void main(String args[]){
		System.out.println(time("yyyy-MM-dd HH:mm:ss"));
	}
}
