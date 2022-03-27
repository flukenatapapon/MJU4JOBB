package controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import bean.Activity;
import bean.Faculty;
import bean.Register;
import bean.RegisterActivity;
import bean.RegisterActivityID;
import utility.ConnectionDB;

public class ListStuManager {
	
	public List<Register> getAllRegister() throws SQLException{
		List<Register> list = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String sql = "Select idRegister, type, gender, position, prefix, fullName, nickName, phone, facebook, travel, traveling, travelDetail, returns, returning, returndetail, foodtype, foodallergy, image, chinesetable, khantokTable, idFaculty  from register";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Faculty fac = new Faculty();
				String rID =rs.getString(1);
				Register ac = new Register(rID,rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14), rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18),rs.getString(19),rs.getString(20),fac);
				fac.setIdFaculty(rs.getString(21));
				ac.setFaculty(fac);
				Statement stmt2 = conn.createStatement();
				String sql2 = "Select ac_activityID,re_idRegister from registeractivity where re_idRegister = '"+rID+"'";
				ResultSet rs2 = stmt2.executeQuery(sql2);
				while(rs2.next()) {
					RegisterActivityID reid = new RegisterActivityID();
					Activity act = new Activity();
					act.setActivityID(rs2.getString(1));
					Register ret = new Register();
					ret.setIdRegister(rs2.getString(2));
					reid.setRe(ret);
					reid.setAc(act);
					RegisterActivity ra = new RegisterActivity();
					ra.setPk(reid);
					ac.getRegisterAc().add(ra);
				}
				rs2.close();
				stmt2.close();
				list.add(ac);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return list;
	}
//	public List<RegisterActivity> getCountRegister() throws SQLException{
//		List<RegisterActivity> list = new ArrayList<>();
//		ConnectionDB condb = new ConnectionDB();
//		Connection conn = condb.getConnection();
//		try {
//			Statement stmt = conn.createStatement();
//			String sql = "Select re_idRegister, count(ac_activityID) from registeractivity group by re_idRegister";
//			ResultSet rs = stmt.executeQuery(sql);
//			while(rs.next()) {
//				Register r = new Register(rs.getString(1));
//				Activity a = new Activity();
//				RegisterActivityID rai = new RegisterActivityID(r,a);
//				RegisterActivity ac = new RegisterActivity(rai,"");
//				ac.setCount(rs.getInt(2));
//				list.add(ac);
//				
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		conn.close();
//		return list;
//	}
	
}
