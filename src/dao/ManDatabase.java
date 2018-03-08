package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import obj.*;

public class ManDatabase {
	// 建立一个数据库连接
	public static Connection connection() throws SQLException {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// 192.168.65.9 10.38.33.16
			con = DriverManager
					.getConnection("jdbc:mysql://10.38.36.17:3306/NonResident?user=gfqh&"
							+ "password=gfqh&useUnicode=true&characterEncoding=UTF-8"); // 建立连接
		} catch (Exception e) {
			System.out.println("信息：" + Other.time("yyyy-MM-dd HH:mm:ss")
					+ " 非居民金融系统连接数据库异常:" + e.getMessage());
		}
		return con;
	}

	public static ResultSet query(String sql, Connection con)
			throws SQLException {

		ResultSet rs = null;
		try {

			java.sql.Statement st = con.createStatement();
			rs = st.executeQuery(sql);

		} catch (Exception e) {
			System.out.println("信息：" + Other.time("yyyy-MM-dd HH:mm:ss")
					+ " 非居民金融系统查询数据库异常:" + e.getMessage());
		}
		return rs;
	}
	
	public static Connection getCon(){
		 Connection con = null;
		 String forname="oracle.jdbc.driver.OracleDriver";
		 String url="jdbc:oracle:thin:@10.38.36.16:1521:ORCL";
		 String user="system";
		 String password="gfqh20021228"; 
		 try{
			 Class.forName(forname).newInstance();
		     con = DriverManager.getConnection(url,user,password);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   return con;
	 }
	
	public static ResultSet executeSql(Connection conn,String sql) {
		Statement st = null;
		ResultSet rs = null;
        try {
        	st=(Statement) conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = (ResultSet) st.executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("信息：" + Other.time("yyyy-MM-dd HH:mm:ss")
					+ " 非居民金融系统查询CTP数据库异常:" + e.getMessage());
		} 
		return rs;
	}
	 
		public static String getCertNo(String investorid) throws SQLException{
			String identifiedcardno = "";
			String sql = "select identifiedcardno from settlement.v_t_investor t where t.INVESTORID='"+investorid+"'";
			Connection con = getCon();
			ResultSet rs = executeSql(con,sql); 
			while(rs.next()){ 
				identifiedcardno = rs.getString("identifiedcardno").trim();
			}
			rs.close();
			con.close();
			return identifiedcardno;
		}
		
		public static void main(String args[]) throws SQLException{
			System.out.println(getCertNo("883710007"));
		}
		
		// 获取用户信息
		public static List get_userinfo(String user_id) throws SQLException {
			ArrayList list = new ArrayList();
			String sql = "select * from user where user_id='" + user_id + "'";
			Connection con = connection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			User_info user_info = new User_info();
			user_info.setId(rs.getString("id"));
			user_info.setUser_id(rs.getString("user_id"));
			user_info.setUser_name(rs.getString("user_name"));
			user_info.setBranch(rs.getString("branch"));
			user_info.setDel_flag(rs.getString("del_flag"));
			user_info.setPwd(rs.getString("pwd"));
			user_info.setUser_dis(rs.getString("user_dis"));
			list.add(user_info);
			rs.close();
			st.close();
			con.close();
			return list;
		}
		
		// 获取用户信息
		public static ArrayList getUser() throws SQLException {
			ArrayList list = new ArrayList();
			String sql = "select * from user where del_flag='0'";
			Connection con = connection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				User_info user_info = new User_info();
				user_info.setId(rs.getString("id"));
				user_info.setUser_id(rs.getString("user_id"));
				user_info.setUser_name(rs.getString("user_name"));
				user_info.setBranch(rs.getString("branch"));
				user_info.setDel_flag(rs.getString("del_flag"));
				user_info.setPwd(rs.getString("pwd"));
				user_info.setUser_dis(rs.getString("user_dis"));
				list.add(user_info);
			}
			rs.close();
			st.close();
			con.close();
			return list;
		}
		
		// 检验用户名是否已存在
		public static boolean check_userid(String user_id) throws SQLException {
			boolean b = false;
			String sql = "select * from user where user_id='" + user_id + "'";
			Connection con = connection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				b = true;
			}
			rs.close();
			st.close();
			con.close();
			return b;
		}
		
		// 将用户信息写入库
		public static boolean insert_user(User_info user) throws SQLException {
			boolean b = false;
			String sql = "insert into user(user_id,user_name,pwd,user_dis,branch) values('"
					+ user.getUser_id()
					+ "','"
					+ user.getUser_name()
					+ "','"
					+ (new MD5(user.getPwd())).compute()
					+ "','"
					+ user.getUser_dis() + "','" + user.getBranch() + "')";
			Connection con = connection();
			Statement st = con.createStatement();
			st.execute(sql);
			b = true;
			st.close();
			con.close();
			return b;
		}
		
		// 修改用户信息
		public static boolean update_user(User_info user, String id)
				throws SQLException {
			boolean b = false;
			String pwd = user.getPwd();
			if (pwd.length() != 32) {
				pwd = (new MD5(pwd)).compute();
			}
			String sql = "update user set user_name='" + user.getUser_name()
					+ "',pwd='" + pwd + "',user_dis='" + user.getUser_dis()
					+ "',branch='" + user.getBranch() + "' where id='"
					+ id + "'";
			Connection con = connection();
			Statement st = con.createStatement();
			st.execute(sql);
			st.close();
			con.close();
			b = true;
			return b;
		}
		
		// 修改用户密码
		public static boolean update_pswd(String user_id,String pwd)
				throws SQLException {
			boolean b = false;
			if (pwd.length() != 32) {
				pwd = (new MD5(pwd)).compute();
			}
			String sql = "update user set pwd='" + pwd + "' where user_id='"
					+ user_id + "'";
			Connection con = connection();
			Statement st = con.createStatement();
			st.execute(sql);
			st.close();
			con.close();
			b = true;
			return b;
		}
}
