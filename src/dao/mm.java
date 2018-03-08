package dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class mm {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Main main = new Main();
/*		String residenttype = "controlperson";
		try {
			residenttype = (residenttype + Other.residenttypeStr(""));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql = "insert into controlperson values('12345678','121','121','121','121','121','121','121'," +
				"'121','121','12345678','121','121','121','121','121','121','121','121','121','12345678'," +
				"'121','121','121','121','121','121','121','121','121','12345678','121','121','"+residenttype+"','121','121','121')";
		
		Connection con;
		int num=0;
		try {
			con = ManDatabase.connection();
			Statement st = con.createStatement();
			num = st.executeUpdate(sql);

			st.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		//int c = main.insertintocontrolperson();
		
		String num = main.queryexclebrachcount("广发期货总部");
		System.out.println(num);
		
		
	}

}
