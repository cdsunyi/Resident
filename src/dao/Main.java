package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import obj.NonResident;

public class Main {
	public static void inInfo(NonResident nr) throws SQLException {
		String investorid = nr.getInvestorid();
		// //按客户号删除信息
		delInfo(investorid);

		String p1 = nr.getP1();
		String p2 = nr.getP2();
		String p3 = nr.getP3();
		String p4 = nr.getP4();
		String p5 = nr.getP5();
		String p6 = nr.getP6();
		String p7 = nr.getP7();
		String p8 = nr.getP8();
		String p9 = nr.getP9();
		String p10 = nr.getP10();
		String p11 = nr.getP11();
		String p12 = nr.getP12();
		String p13 = nr.getP13();
		String p14 = nr.getP14();
		String p15 = nr.getP15();
		String p16 = nr.getP16();
		String p17 = nr.getP17();
		String p18 = nr.getP18();
		String p19 = nr.getP19();
		String p20 = nr.getP20();
		String p21 = nr.getP21();
		String p22 = nr.getP22();
		String p23 = nr.getP23();
		String p24 = nr.getP24();
		String p25 = nr.getP25();
		String p26 = nr.getP26();
		String p27 = nr.getP27();
		String p28 = nr.getP28();
		String p29 = nr.getP29();
		String p30 = nr.getP30();
		String p31 = nr.getP31();
		String p32 = nr.getP32();
		String p33 = nr.getP33();
		String p34 = nr.getP34();
		String p35 = nr.getP35();
		String p36 = nr.getP36();
		String p37 = nr.getP37();
		String p38 = nr.getP38();
		String p39 = nr.getP39();
		String p40 = nr.getP40();
		String p41 = nr.getP41();
		String p42 = nr.getP42();
		String p43 = nr.getP43();
		String p44 = nr.getP44();
		String p45 = nr.getP45();
		String p46 = nr.getP46();
		String p47 = nr.getP47();
		String p48 = nr.getP48();
		String p49 = nr.getP49();
		String p50 = nr.getP50();
		String p51 = nr.getP51();
		String p52 = nr.getP52();
		String p53 = nr.getP53();
		String p54 = nr.getP54();
		String p55 = nr.getP55();
		String p56 = nr.getP56();
		String certno = nr.getCertno();
		String branch = nr.getBranch();
		String residenttype = nr.getResidenttype();
		String intime = nr.getIntime();

		String sql = "insert into nonresident(investorid,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p40,p41,p42,p43,p44,p45,p46,p47,p48,p49,p50,p51,p52,p53,p54,p55,p56,certno,branch,residenttype,intime) values('"
				+ investorid
				+ "','"
				+ p1
				+ "','"
				+ p2
				+ "','"
				+ p3
				+ "','"
				+ p4
				+ "','"
				+ p5
				+ "','"
				+ p6
				+ "','"
				+ p7
				+ "','"
				+ p8
				+ "','"
				+ p9
				+ "','"
				+ p10
				+ "','"
				+ p11
				+ "','"
				+ p12
				+ "','"
				+ p13
				+ "','"
				+ p14
				+ "','"
				+ p15
				+ "','"
				+ p16
				+ "','"
				+ p17
				+ "','"
				+ p18
				+ "','"
				+ p19
				+ "','"
				+ p20
				+ "','"
				+ p21
				+ "','"
				+ p22
				+ "','"
				+ p23
				+ "','"
				+ p24
				+ "','"
				+ p25
				+ "','"
				+ p26
				+ "','"
				+ p27
				+ "','"
				+ p28
				+ "','"
				+ p29
				+ "','"
				+ p30
				+ "','"
				+ p31
				+ "','"
				+ p32
				+ "','"
				+ p33
				+ "','"
				+ p34
				+ "','"
				+ p35
				+ "','"
				+ p36
				+ "','"
				+ p37
				+ "','"
				+ p38
				+ "','"
				+ p39
				+ "','"
				+ p40
				+ "','"
				+ p41
				+ "','"
				+ p42
				+ "','"
				+ p43
				+ "','"
				+ p44
				+ "','"
				+ p45
				+ "','"
				+ p46
				+ "','"
				+ p47
				+ "','"
				+ p48
				+ "','"
				+ p49
				+ "','"
				+ p50
				+ "','"
				+ p51
				+ "','"
				+ p52
				+ "','"
				+ p53
				+ "','"
				+ p54
				+ "','"
				+ p55
				+ "','"
				+ p56
				+ "','"
				+ certno
				+ "','" + branch + "','" + residenttype + "','" + intime + "')";
		Connection con = ManDatabase.connection();
		Statement st = con.createStatement();
		st.execute(sql);
		st.close();
		con.close();
	}

	// 按客户号删除信息
	public static void delInfo(String investorid) throws SQLException {
		String sql = "delete from nonresident where investorid='" + investorid
				+ "'";
		Connection con = ManDatabase.connection();
		Statement st = con.createStatement();
		st.execute(sql);
		st.close();
		con.close();
	}

	// 查询录入信息
	public static ArrayList getInfo(String where) throws SQLException {
		ArrayList list = new ArrayList();
		String sql = "select * from nonresident " + where;
		Connection con = ManDatabase.connection();
		ResultSet rs = ManDatabase.query(sql, con);
		while (rs.next()) {
			NonResident nr = new NonResident();
			nr.setInvestorid(rs.getString("investorid"));
			nr.setP1(rs.getString("p1"));
			nr.setP2(rs.getString("p2"));
			nr.setP3(rs.getString("p3"));
			nr.setP4(rs.getString("p4"));
			nr.setP5(rs.getString("p5"));
			nr.setP6(rs.getString("p6"));
			nr.setP7(rs.getString("p7"));
			nr.setP8(rs.getString("p8"));
			nr.setP9(rs.getString("p9"));
			nr.setP10(rs.getString("p10"));
			nr.setP11(rs.getString("p11"));
			nr.setP12(rs.getString("p12"));
			nr.setP13(rs.getString("p13"));
			nr.setP14(rs.getString("p14"));
			nr.setP15(rs.getString("p15"));
			nr.setP16(rs.getString("p16"));
			nr.setP17(rs.getString("p17"));
			nr.setP18(rs.getString("p18"));
			nr.setP19(rs.getString("p19"));
			nr.setP20(rs.getString("p20"));
			nr.setP21(rs.getString("p21"));
			nr.setP22(rs.getString("p22"));
			nr.setP23(rs.getString("p23"));
			nr.setP24(rs.getString("p24"));
			nr.setP25(rs.getString("p25"));
			nr.setP26(rs.getString("p26"));
			nr.setP27(rs.getString("p27"));
			nr.setP28(rs.getString("p28"));
			nr.setP29(rs.getString("p29"));
			nr.setP30(rs.getString("p30"));
			nr.setP31(rs.getString("p31"));
			nr.setP32(rs.getString("p32"));
			nr.setP33(rs.getString("p33"));
			nr.setP34(rs.getString("p34"));
			nr.setP35(rs.getString("p35"));
			nr.setP36(rs.getString("p36"));
			nr.setP37(rs.getString("p37"));
			nr.setP38(rs.getString("p38"));
			nr.setP39(rs.getString("p39"));
			nr.setP40(rs.getString("p40"));
			nr.setP41(rs.getString("p41"));
			nr.setP42(rs.getString("p42"));
			nr.setP43(rs.getString("p43"));
			nr.setP44(rs.getString("p44"));
			nr.setP45(rs.getString("p45"));
			nr.setP46(rs.getString("p46"));
			nr.setP47(rs.getString("p47"));
			nr.setP48(rs.getString("p48"));
			nr.setP49(rs.getString("p49"));
			nr.setP50(rs.getString("p50"));
			nr.setP51(rs.getString("p51"));
			nr.setP52(rs.getString("p52"));
			nr.setP53(rs.getString("p53"));
			nr.setP54(rs.getString("p54"));
			nr.setP55(rs.getString("p55"));
			nr.setP56(rs.getString("p56"));
			nr.setCertno(rs.getString("certno"));
			nr.setBranch(rs.getString("branch"));
			nr.setResidenttype(rs.getString("residenttype"));
			nr.setIntime(rs.getString("intime"));
			list.add(nr);
		}
		rs.close();
		con.close();
		return list;
	}



	/*
	 * 判断是否是非居民 return 居民 非居民 识别错误
	 */
	public static String nonResident(String residenttype) {

		Map<String, String> map = new HashMap<String, String>();
/*		map.put("1_1", "居民");
		map.put("1_2", "非居民");
		map.put("1_3", "非居民");

		map.put("2_1_1_1", "居民");
		map.put("2_1_1_2", "居民");
		map.put("2_1_1_3", "居民");
		map.put("2_1_2_1", "非居民");
		map.put("2_1_2_2", "非居民");
		map.put("2_1_2_3", "非居民");
		map.put("2_1_3_1", "非居民");
		map.put("2_1_3_2", "非居民");
		map.put("2_1_3_3", "非居民");

		map.put("2_2_1", "居民");
		map.put("2_2_2", "非居民");
		map.put("2_2_3", "非居民");*/ //20171102 shixiaolin
		
		//20171102 shixiaolin
		residenttype = residenttype.replace("_", "");
		map.put("11", "居民");
		map.put("12", "非居民");
		map.put("13", "非居民");

		map.put("2111", "居民");
		map.put("2112", "居民");
		map.put("2113", "居民");
		map.put("2121", "非居民");
		map.put("2122", "非居民");
		map.put("2123", "非居民");
		map.put("2131", "非居民");
		map.put("2132", "非居民");
		map.put("2133", "非居民");

		map.put("221", "居民");
		map.put("222", "非居民");
		map.put("223", "非居民");
		
		//手动修改非居民状态  非居民-1000 居民-2000
		map.put("1000", "非居民");
		map.put("2000", "居民");
		
		// 判断key值是否存在
		if (map.containsKey(residenttype)) {
			return map.get(residenttype);
		} else {
			System.out.println(residenttype);
			return "识别错误";
		}

	}

	
	/*
	 * 插入控制人信息
	 */
	public int insertintocontrolperson(HashMap<String, String> map){
		
		String investorid = map.get("investorid");
		String controlpersonname = map.get("controlpersonname");
		String personalstatement = map.get("personalstatement");
		String organizationname = map.get("organizationname");
		String organizationcountry = map.get("organizationcountry");
		String organizationprovince = map.get("organizationprovince");
		String organizationcity = map.get("organizationcity");
		String organizationadr = map.get("organizationadr");
		String organizationtaxnum = map.get("organizationtaxnum");
		String controlpersonfirstname = map.get("controlpersonfirstname");
		String controlpersonlastname = map.get("controlpersonlastname");
		String controlpersonbirthday = map.get("controlpersonbirthday");
		String controlpersoncountrychn = map.get("controlpersoncountrychn");
		String controlpersonprovincechn = map.get("controlpersonprovincechn");
		String controlpersoncitychn = map.get("controlpersoncitychn");
		String controlpersonadrchn = map.get("controlpersonadrchn");
		String controlpersoncountryeng = map.get("controlpersoncountryeng");
		String controlpersonprovinceeng = map.get("controlpersonprovinceeng");
		String controlpersoncityeng = map.get("controlpersoncityeng");
		String controlpersonadreng = map.get("controlpersonadreng");
		String controlpersoncountrychnbir = map.get("controlpersoncountrychnbir");
		String controlpersonprovincechnbir = map.get("controlpersonprovincechnbir");
		String controlpersoncitychnbir = map.get("controlpersoncitychnbir");
		String controlpersonadrchnbir = map.get("controlpersonadrchnbir");
		String controlpersoncountryengbir = map.get("controlpersoncountryengbir");
		String controlpersonprovinceengbir = map.get("controlpersonprovinceengbir");
		String controlpersoncityengbir = map.get("controlpersoncityengbir");
		String controlpersonadrengbir = map.get("controlpersonadrengbir");
		String controlpersontaxnum1 = map.get("controlpersontaxnum1");
		String controlpersontaxnum2 = map.get("controlpersontaxnum2");
		String controlpersontaxnum3 = map.get("controlpersontaxnum3");
		String controlpersontaxnumreasonnum = map.get("controlpersontaxnumreasonnum");
		String controlpersontaxnumreasoninfo = map.get("controlpersontaxnumreasoninfo");
		String residenttype = map.get("residenttype");
		String intime = map.get("intime");
		String other1 = map.get("other1");
		String other2 = map.get("other2");
		
		String sql = "insert into controlperson values(" +
				"'"+investorid+"'," +
				"'"+controlpersonname+"'," +
				"'"+personalstatement+"'," +
				"'"+organizationname+"'," + 
				"'"+organizationcountry+"'," +
				"'"+organizationprovince+"'," +
				"'"+organizationcity+"'," +
				"'"+organizationadr+"'," +
				"'"+organizationtaxnum+"'," +
				"'"+controlpersonfirstname+"'," +
				"'"+controlpersonlastname+"'," +
				"'"+controlpersonbirthday+"'," +
				"'"+controlpersoncountrychn+"'," +
				"'"+controlpersonprovincechn+"'," + 
				"'"+controlpersoncitychn+"'," +
				"'"+controlpersonadrchn+"'," +
				"'"+controlpersoncountryeng+"'," +
				"'"+controlpersonprovinceeng+"'," +
				"'"+controlpersoncityeng+"'," +
				"'"+controlpersonadreng+"'," +
				"'"+controlpersoncountrychnbir+"'," +
				"'"+controlpersonprovincechnbir+"'," +
				"'"+controlpersoncitychnbir+"'," +
				"'"+controlpersonadrchnbir+"'," + 
				"'"+controlpersoncountryengbir+"'," +
				"'"+controlpersonprovinceengbir+"'," +
				"'"+controlpersoncityengbir+"'," +
				"'"+controlpersonadrengbir+"'," +
				"'"+controlpersontaxnum1+"'," +
				"'"+controlpersontaxnum2+"'," +
				"'"+controlpersontaxnum3+"'," +
				"'"+controlpersontaxnumreasonnum+"'," +
				"'"+controlpersontaxnumreasoninfo+"'," +
				"'"+residenttype+"'," +
				"'"+intime+"'," +
				"'"+other1+"'," +
				"'"+other2+"')";
		
		String updatesql = "update controlperson SET "+
			  "investorid = '"+investorid+"'"+
			  ",controlpersonname = '"+controlpersonname+"' "+
			  ",personalstatement = '"+personalstatement+"'"+
			  ",organizationname = '"+organizationname+"'"+
			  ",organizationcountry = '"+organizationcountry+"' "+
			  ",organizationprovince = '"+organizationprovince+"' "+
			  ",organizationcity = '"+organizationcity+"' "+
			  ",organizationadr = '"+organizationadr+"' "+
			  ",organizationtaxnum = '"+organizationtaxnum+"'"+
			  ",controlpersonfirstname = '"+controlpersonfirstname+"'"+
			  ",controlpersonlastname = '"+controlpersonlastname+"' "+
			  ",controlpersonbirthday = '"+controlpersonbirthday+"'"+
			  ",controlpersoncountrychn = '"+controlpersoncountrychn+"' "+
			  ",controlpersonprovincechn = '"+controlpersonprovincechn+"'"+
			  ",controlpersoncitychn = '"+controlpersoncitychn+"'"+
			  ",controlpersonadrchn = '"+controlpersonadrchn+"' "+
			  ",controlpersoncountryeng = '"+controlpersoncountryeng+"' "+
			  ",controlpersonprovinceeng = '"+controlpersonprovinceeng+"' "+
			  ",controlpersoncityeng = '"+controlpersoncityeng+"'"+
			  ",controlpersonadreng = '"+controlpersonadreng+"' "+
			  ",controlpersoncountrychnbir = '"+controlpersoncountrychnbir+"'"+
			  ",controlpersonprovincechnbir = '"+controlpersonprovincechnbir+"'"+
			  ",controlpersoncitychnbir = '"+controlpersoncitychnbir+"' "+
			  ",controlpersonadrchnbir = '"+controlpersonadrchnbir+"' "+
			  ",controlpersoncountryengbir = '"+controlpersoncountryengbir+"'"+
			  ",controlpersonprovinceengbir = '"+controlpersonprovinceengbir+"' "+
			  ",controlpersoncityengbir = '"+controlpersoncityengbir+"' "+
			  ",controlpersonadrengbir = '"+controlpersonadrengbir+"'"+
			  ",controlpersontaxnum1 = '"+controlpersontaxnum1+"'"+
			  ",controlpersontaxnum2 = '"+controlpersontaxnum2+"'"+
			  ",controlpersontaxnum3 = '"+controlpersontaxnum3+"' "+
			  ",controlpersontaxnumreasonnum = '"+controlpersontaxnumreasonnum+"'"+
			  ",controlpersontaxnumreasoninfo = '"+controlpersontaxnumreasoninfo+"'"+
			  ",residenttype = '"+residenttype+"' "+
			  ",intime = '"+intime+"' "+
			  ",other1 = '"+other1+"' "+
			  ",other2 = '"+other2+"' "+
			  "where investorid='"+investorid+"' and controlpersonname='"+controlpersonname+"'";
		
		Connection con;
		int num=0;
		try {
			con = ManDatabase.connection();
			Statement st = con.createStatement();
			num = st.executeUpdate(updatesql);
			if(num == 0){
				num = st.executeUpdate(sql);
			}

			st.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	
	
	//根据客户ID 或营业部进行查询
	public ArrayList<HashMap<String, String>> queryexcle(
			HashMap<String, String> map) {

		String investorid = map.get("investorid").toString();
		// String identitycard = map.get("identitycard").toString();
		String salesdepartment = map.get("salesdepartment").toString();
		
		String PageNo = map.get("PageNo").toString();
		String PageSize = map.get("PageSize").toString();
		
		String sql = null;
		if (investorid != "") {
			if(salesdepartment.equals("广发期货总部")){
				sql = "select investorid,p1 as username,certno,residenttype,intime from nonresident where investorid = '#########';";
				sql = sql.replace("#########", investorid);
			}else{
				sql = "select investorid,p1 as username,certno,residenttype,intime from nonresident where investorid = '#########' and branch = '******';";
				//sql = "select investorid,p1 as username,certno,residenttype,intime from nonresident where investorid = '#########' and branch = '广发期货总部';";
				sql = sql.replace("#########", investorid);
				sql = sql.replace("******", salesdepartment);
			}
		}/*
		 * else if(identitycard!=""){ sql =
		 * "select investorid,p1 as username,certno,residenttype,intime from nonresident where investorid = '#########';"
		 * ; sql = sql.replace("#########", map.get("identitycard").toString());
		 * }
		 */
		else if (salesdepartment != "") {
			if(PageNo.equals("-1")){
				sql = "select investorid,p1 as username,certno,residenttype,intime from nonresident where branch = '#########'";
			}else{
				int PageNoNum= Integer.parseInt(PageNo);
				int PageSizenum= Integer.parseInt(PageSize);
				PageNoNum = (PageNoNum-1)*PageSizenum;				
				sql = "select investorid,p1 as username,certno,residenttype,intime from nonresident where branch = '#########' limit ";
				sql = sql + PageNoNum +","+ PageSizenum + ";";
			}
			sql = sql.replace("#########", salesdepartment);
		}

		Connection con = null;
		ResultSet rs = null;
		String rstr = null;
		ArrayList<HashMap<String, String>> list = null;
		try {
			con = ManDatabase.connection();
			rs = ManDatabase.query(sql, con);
			if (rs != null) {
				ResultSetMetaData m = rs.getMetaData();
				list = new ArrayList<HashMap<String, String>>();
				HashMap<String, String> mapinfo = null;

				int columns = m.getColumnCount();
				// 显示列,表格的表头
				/*
				 * for (int i = 1; i <= columns; i++) {
				 * mapinfo.put(m.getColumnName(i), "");
				 * System.out.print(m.getColumnName(i));
				 * System.out.print("\t\t"); } System.out.println();
				 */

				// 显示表格内容
				while (rs.next()) {
					mapinfo = new HashMap<String, String>();
					for (int i = 1; i <= columns; i++) {
						mapinfo.put(m.getColumnName(i), rs.getString(i));
					}
					list.add(mapinfo);
				}
			}
			if (rs != null) {
				rs.close();
			}

			if (con != null) {
				con.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	public String queryexclebrachcount(String salesdepartment){
		String sql = "select count(*) from nonresident where branch = '#########'";
		sql = sql.replace("#########", salesdepartment);
		Connection con = null;
		ResultSet rs = null;
		String rstr = null;
		ArrayList<HashMap<String, String>> list = null;
		String result="0";
		
		try {
			con = ManDatabase.connection();
			rs = ManDatabase.query(sql, con);
			if (rs != null) {
				ResultSetMetaData m = rs.getMetaData();
				list = new ArrayList<HashMap<String, String>>();
				HashMap<String, String> mapinfo = null;

				// 显示表格内容
				while (rs.next()) {
					result = rs.getString(1);
				}
			}
			if (rs != null) {
				rs.close();
			}

			if (con != null) {
				con.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//从CTP查询所有营业部
	public Vector<String> querysaledepartment() {
		Connection con = null;
		ResultSet rs = null;
		Vector<String> vec = new Vector<String>();
		String sql = "select propertyname from settlement.v_t_property where parentid = '01'";
		try {
			con = ManDatabase.getCon();
			rs = ManDatabase.executeSql(con, sql);
			if (rs != null) {
				while (rs.next()) {
					vec.add(rs.getString(1));
				}
			}
			if (rs != null) {
				rs.close();
			}

			if (con != null) {
				con.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vec;
	}

	// 更新非居民状态 此为营业部只更新非居民状态 所以状态值为 非居民-1000 居民-2000
	public int updateResidentStatus(HashMap<String, String> map) {

		String sql = "update nonresident set residenttype = 'STUTAS',intime = 'YYMMDD', certno = 'SFZ' where investorid='########';";
		sql = sql.replace("STUTAS", map.get("residenttype").toString());
		sql = sql.replace("YYMMDD", map.get("intime").toString());
		sql = sql.replace("########", map.get("investorid").toString());
		sql = sql.replace("SFZ", map.get("dialogcertno").toString());

		Connection con = null;
		int result = 0;
		ArrayList<HashMap<String, String>> list = null;
		try {
			con = ManDatabase.connection();

			Statement st = con.createStatement();
			result = st.executeUpdate(sql);

			if (con != null) {
				con.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	//删除用户信息
	public int deleteuserinfo(String investorid){
		String sql = "delete from nonresident where investorid='########';";
		sql = sql.replace("########", investorid);

		Connection con = null;
		int result = 0;
		ArrayList<HashMap<String, String>> list = null;
		try {
			con = ManDatabase.connection();

			Statement st = con.createStatement();
			result = st.executeUpdate(sql);

			if (con != null) {
				con.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
	
	
	// 查询客户地址电话
	public HashMap<String, String> queryuseradrtel(String investorid) {
		Connection con = null;
		ResultSet rs = null;
		Vector<String> vec = new Vector<String>();
		HashMap<String, String> map = new HashMap<String, String>();
		String sql = "select  country,province,city,telephone,address,investorname,identifiedcardno,INVESTORTYPE,PHONECOUNTRYCODE from  SETTLEMENT.v_t_Investor where investorid = '######'";
		sql = sql.replace("######", investorid);
		try {
			con = ManDatabase.getCon();
			rs = ManDatabase.executeSql(con, sql);
			ResultSetMetaData m = rs.getMetaData();
			int columns = m.getColumnCount();

			if (rs != null) {
				while (rs.next()) {
					for (int i = 1; i <= columns; i++) {
						map.put(m.getColumnName(i), rs.getString(i));
					}
				}
			}
			
			//查询 国家 省份 城市 对应的中文名
    		String country = map.get("COUNTRY");
    		String province = map.get("PROVINCE");
    		String city = map.get("CITY");
    		String mapinfo[] = {"COUNTRY","PROVINCE","CITY"};
    		String[] adr = new String[3];
    		adr[0] = "select enumvaluelabel from settlement.v_t_enummetadata where enumvalueresult='"+country
    							+"' and enumvaluetype='Country'";
    		
    		adr[1] = "select enumvaluelabel from settlement.v_t_enummetadata where enumvalueresult='"+province
    							+"' and enumvaluetype='Province'";
    		
    		adr[2] = "select enumvaluelabel from settlement.v_t_enummetadata where enumvalueresult='"+city
    							+"' and enumvaluetype='City'";
    		
    		for(int i = 0;i<3;i++){
        		rs = ManDatabase.executeSql(con, adr[i]);

    			if (rs != null) {
    				while (rs.next()) {
    					map.put(mapinfo[i], rs.getString(1) == null ? "":rs.getString(1));
    				}
    			}     			
    		}
   		
			if (rs != null) {
				rs.close();
			}

			if (con != null) {
				con.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return map;
	}

	//查询客户权益
	public HashMap<String, String> queryuserequity(String investorid) {
		Connection con = null;
		ResultSet rs = null;
		HashMap<String, String> map = new HashMap<String, String>();
		String sql = "select sum(total) as equity from ( "+ 
					"select accountid,mortgage,deposit,mortgage+deposit as total "+
					  "from historysettlement.v_t_investorsettlement "+
					 "where accountid in (select investorid "+
					                       "from SETTLEMENT.v_t_Investor "+
					                     " where IDENTIFIEDCARDNO = "+
					                            "(select IDENTIFIEDCARDNO "+
					                               "from SETTLEMENT.v_t_Investor "+
					                             " where investorid = '######')) "+
					   "and tradingday = (select * "+
					                       "from (select tradingday "+
					                              " from historysettlement.v_t_investorsettlement "+
					                              "where ROWNUM <= 1 "+
					                              "order by tradingday desc)) "+
					 ")";
		sql = sql.replace("######", investorid);
		try {
			con = ManDatabase.getCon();
			rs = ManDatabase.executeSql(con, sql);
			ResultSetMetaData m = rs.getMetaData();
			int columns = m.getColumnCount();

			if (rs != null) {
				while (rs.next()) {
					for (int i = 1; i <= columns; i++) {					
						map.put(m.getColumnName(i), rs.getString(i) == null ? "0":rs.getString(i));
					}
				}
			}
			if (rs != null) {
				rs.close();
			}

			if (con != null) {
				con.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return map;
	}

	//查询所有用户是否是非居民
	public ArrayList<HashMap<String, String>> checkNonResident(HashMap<String, String> map){
		//判断经济所有户信息		
		String PageNo = map.get("PageNo").toString();
		String PageSize = map.get("PageSize").toString();
		String sql = null;
		
		int PageNoNum= Integer.parseInt(PageNo);
		int PageSizenum= Integer.parseInt(PageSize);
		sql ="select investorid,residenttype from nonresident";
		/*sql ="select investorid,residenttype from nonresident limit ";
		sql = sql + PageNoNum +","+ 56 + ";";*/
		Connection con = null;
		ResultSet rs = null;
		String rstr = null;
		ArrayList<HashMap<String, String>> list = null;
		try {
			con = ManDatabase.connection();
			rs = ManDatabase.query(sql, con);
			if (rs != null) {
				ResultSetMetaData m = rs.getMetaData();
				list = new ArrayList<HashMap<String, String>>();
				HashMap<String, String> mapinfo = null;

				int columns = m.getColumnCount();
				// 显示列,表格的表头
				/*
				 * for (int i = 1; i <= columns; i++) {
				 * mapinfo.put(m.getColumnName(i), "");
				 * System.out.print(m.getColumnName(i));
				 * System.out.print("\t\t"); } System.out.println();
				 */

				// 显示表格内容
				while (rs.next()) {
					mapinfo = new HashMap<String, String>();
					for (int i = 1; i <= columns; i++) {
						mapinfo.put(m.getColumnName(i), rs.getString(i));
					}
					list.add(mapinfo);
				}
			}
			if (rs != null) {
				rs.close();
			}

			if (con != null) {
				con.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	
		
		
		
		//判断资管所有户信息
		
		//判断基金所有户信息
		
		return list;
	}
	
	
}
