<%@ page language="java" import="dao.*,obj.*" pageEncoding="utf8"%>
		<%
			String investorid = request.getParameter("investorid");
			String p1 = Other.manStr(request.getParameter("p1"));
			String p2 = Other.manStr(request.getParameter("p2"));
			String p3 = Other.manStr(request.getParameter("p3"));
			String p4 = Other.manStr(request.getParameter("p4"));
			String p5 = Other.manStr(request.getParameter("p5"));
			String p6 = Other.manStr(request.getParameter("p6"));
			String p7 = Other.manStr(request.getParameter("p7"));
			String p8 = Other.manStr(request.getParameter("p8"));
			String p9 = Other.manStr(request.getParameter("p9"));
			String p10 = Other.manStr(request.getParameter("p10"));
			String p11 = Other.manStr(request.getParameter("p11"));
			String p12 = Other.manStr(request.getParameter("p12"));
			String p13 = Other.manStr(request.getParameter("p13"));
			String p14 = Other.manStr(request.getParameter("p14"));
			String p15 = Other.manStr(request.getParameter("p15"));
			String p16 = Other.manStr(request.getParameter("p16"));
			String p17 = Other.manStr(request.getParameter("p17"));
			String p18 = Other.manStr(request.getParameter("p18"));
			String p19 = Other.manStr(request.getParameter("p19"));
			String p20 = Other.manStr(request.getParameter("p20"));
			String p21 = Other.manStr(request.getParameter("p21"));
			String p22 = Other.manStr(request.getParameter("p22"));
			String p23 = Other.manStr(request.getParameter("p23"));
			String p24 = Other.manStr(request.getParameter("p24"));
			String p25 = Other.manStr(request.getParameter("p25"));
			String p26 = Other.manStr(request.getParameter("p26"));
			String p27 = Other.manStr(request.getParameter("p27"));
			String p28 = Other.manStr(request.getParameter("p28"));
			String p29 = Other.manStr(request.getParameter("p29"));
			String p30 = Other.manStr(request.getParameter("p30"));
			String p31 = Other.manStr(request.getParameter("p31"));
			String p32 = Other.manStr(request.getParameter("p32"));
			String p33 = Other.manStr(request.getParameter("p33"));
			String p34 = Other.manStr(request.getParameter("p34"));
			String p35 = Other.manStr(request.getParameter("p35"));
			String p36 = Other.manStr(request.getParameter("p36"));
			String p37 = Other.manStr(request.getParameter("p37"));
			String p38 = Other.manStr(request.getParameter("p38"));
			String p39 = Other.manStr(request.getParameter("p39"));
			String p40 = Other.manStr(request.getParameter("p40"));
			String p41 = Other.manStr(request.getParameter("p41"));
			String p42 = Other.manStr(request.getParameter("p42"));
			String p43 = Other.manStr(request.getParameter("p43"));
			String p44 = Other.manStr(request.getParameter("p44"));
			String p45 = Other.manStr(request.getParameter("p45"));
			String p46 = Other.manStr(request.getParameter("p46"));
			String p47 = Other.manStr(request.getParameter("p47"));
			String p48 = Other.manStr(request.getParameter("p48"));
			String p49 = Other.manStr(request.getParameter("p49"));
			String p50 = Other.manStr(request.getParameter("p50"));
			String p51 = Other.manStr(request.getParameter("p51"));
			String p52 = Other.manStr(request.getParameter("p52"));
			String p53 = Other.manStr(request.getParameter("p53"));
			String p54 = Other.manStr(request.getParameter("p54"));
			String p55 = Other.manStr(request.getParameter("p55"));
			String p56 = Other.manStr(request.getParameter("p56"));

			userqueryservlet userq = new userqueryservlet();
			//通过客户号获取该客户的身份证号码
			String certno = ManDatabase.getCertNo(userq.formstr(investorid));
			String branch = (String)session.getAttribute("branch");//request.getParameter("branch");
			String residenttype = request.getParameter("residenttype");
			String intime = Other.time("yyyy-MM-dd HH:mm:ss");
			//确定residenttype的类型
			//"1_1" 个人客户选择“1.仅为中国税收居民”
			//"1_2" 个人客户选择“2.仅为非居民”或者“3.既是中国税收居民又是其他国家（地区）税收居民”
			//"2_1_1" 机构客户选择“1.消极非金融机构（如勾选此项，请同时填写控制人税收居民身份声明文件）”及“1.仅为中国税收居民”
			//"2_1_2" 机构客户选择“1.消极非金融机构（如勾选此项，请同时填写控制人税收居民身份声明文件）”及“2.仅为非居民  或者   3.既是中国税收居民又是其他国家（地区）税收居民”
			//"2_2_1" 机构客户选择“2.其他非金融机构”及“1.仅为中国税收居民（如勾选此项，请直接填写第五项内容）”
			//"2_2_2" 机构客户选择“2.其他非金融机构”及“2.仅为非居民  或者   3.既是中国税收居民又是其他国家（地区）税收居民”
			if (residenttype.equals("1")) {
				residenttype = (residenttype + Other.residenttypeStr(p2));
				
			} else {
				String str2 = Other.residenttypeStr(p2);
				String str3 = Other.residenttypeStr(p3);
				String str4 = Other.residenttypeStr(p19);
				residenttype = (residenttype + Other.residenttypeStr(p2) + Other.residenttypeStr(p3) + Other.residenttypeStr(p19));
				
			}
			NonResident nr = new NonResident();
			nr.setInvestorid(investorid);
			nr.setP1(p1);
			nr.setP2(p2);
			nr.setP3(p3);
			nr.setP4(p4);
			nr.setP5(p5);
			nr.setP6(p6);
			nr.setP7(p7);
			nr.setP8(p8);
			nr.setP9(p9);
			nr.setP10(p10);
			nr.setP11(p11);
			nr.setP12(p12);
			nr.setP13(p13);
			nr.setP14(p14);
			nr.setP15(p15);
			nr.setP16(p16);
			nr.setP17(p17);
			nr.setP18(p18);
			nr.setP19(p19);
			nr.setP20(p20);
			nr.setP21(p21);
			nr.setP22(p22);
			nr.setP23(p23);
			nr.setP24(p24);
			nr.setP25(p25);
			nr.setP26(p26);
			nr.setP27(p27);
			nr.setP28(p28);
			nr.setP29(p29);
			nr.setP30(p30);
			nr.setP31(p31);
			nr.setP32(p32);
			nr.setP33(p33);
			nr.setP34(p34);
			nr.setP35(p35);
			nr.setP36(p36);
			nr.setP37(p37);
			nr.setP38(p38);
			nr.setP39(p39);
			nr.setP40(p40);
			nr.setP41(p41);
			nr.setP42(p42);
			nr.setP43(p43);
			nr.setP44(p44);
			nr.setP45(p45);
			nr.setP46(p46);
			nr.setP47(p47);
			nr.setP48(p48);
			nr.setP49(p49);
			nr.setP50(p50);
			nr.setP51(p51);
			nr.setP52(p52);
			nr.setP53(p53);
			nr.setP54(p54);
			nr.setP55(p55);
			nr.setP56(p56);
			nr.setCertno(certno);
			nr.setBranch(branch);
			nr.setResidenttype(residenttype);
			nr.setIntime(intime);

			Main.inInfo(nr);
			
			out.print("居民/非居民金融信息录入成功！");
		%>
