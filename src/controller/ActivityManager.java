package controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.naming.ReferralException;

import bean.*;
import utility.ConnectionDB;

public class ActivityManager {
	
	public List<Activity> getAllActivity() throws SQLException{
		List<Activity> list = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String sql = "Select activityID,type,activityName,matchDate,place,maxPerson,male,female from activity ";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Calendar c =Calendar.getInstance();
				String acID = rs.getString(1);
				String type = rs.getString(2);
				String acName = rs.getString(3);
				c.setTime(rs.getTimestamp(4));
				Activity ac = new Activity(acID,type,acName,c,rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8));
				list.add(ac);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return list;
	}
	public String getAllActivitys(String id) throws SQLException{
		String list = null;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String sql = "Select activityID,type,activityName,matchDate,place,maxPerson,male,female from activity where activityID= '"+id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list = rs.getString(3);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return list;
	}
	public int addRegisterActivity(String ac,Register re) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		int result = 0;
		try {
			
			CallableStatement stmt = conn.prepareCall("{call insertRegisterActivity(?,?,?)}");
			stmt.setString(1,"");
			stmt.setString(2,ac);
			stmt.setString(3,re.getIdRegister());
			
			 stmt.execute();
			 result = stmt.getUpdateCount();			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return result;
	}
	public int updateRegisterActivity(String ac,Register re) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		int result = 0;
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "update registeractivity set ac_activityID = '"+ac+"' where re_idRegister = '"+re.getIdRegister()+"'";
			
			System.out.println(sql);
			result = stmt.executeUpdate(sql);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return result;
	}
	public int deleteAc(String a,String id) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		int result = 0;
		try {
			
			Statement stmt = conn.createStatement();
			
			String sql = "Delete from registeractivity where re_idRegister ='"+id+"' and ac_activityID = '"+a+"' ";
			
			System.out.println(sql);
			result = stmt.executeUpdate(sql);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return result;
	}
	public int maxActivity(String user,String aid) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		int max = 0;
		try {
			
			Statement stmt = conn.createStatement();
			
			String sql = "Select * from maxactivity where username = '"+user+"' and ac_activityID ='"+aid+"'";
			
			 ResultSet rs = stmt.executeQuery(sql);
			 if(rs.next()) {
				max =  rs.getInt(4);
			 }
			 
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return max;
	}
	public Activity maxActivityX(String aid) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		Activity a = null;
		try {
			
			Statement stmt = conn.createStatement();
			
			String sql = "Select * from acmax where activityID ='"+aid+"'";
			
			 ResultSet rs = stmt.executeQuery(sql);
			 if(rs.next()) {
				Calendar c =Calendar.getInstance();
				String acID = rs.getString(1);
				String type = rs.getString(2);
				String acName = rs.getString(3);
				c.setTime(rs.getTimestamp(4));
				 a = new Activity(acID,type,acName,c,rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8));
			 }
			 
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return a;
	}
	public List<RegisterActivity> getActivityMedal(String name) throws SQLException{
		List<RegisterActivity> list = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select * from activitymedal where username = '"+name+"'";
					
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Activity a = new Activity();
				RegisterActivityID raid = new RegisterActivityID();
				RegisterActivity ra = new RegisterActivity();
				University uni = new University();
				Faculty fa = new Faculty();
				Register re = new Register();
				uni.setUsername(rs.getString(1));
				fa.setUniversity(uni);
				re.setFaculty(fa);
				a.setActivityID(rs.getString(2));
				a.setActivityName(rs.getString(3));
				a.setType(rs.getString(4));
				raid.setAc(a);
				raid.setRe(re);
				ra.setMedal(rs.getString(5));
				ra.setPk(raid);
				list.add(ra);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return list;		
	}
	
	public int addMedalActivity(String aid,String medal,String uname) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		int result = 0;
		try {
			
			CallableStatement stmt = conn.prepareCall("{call updateMedal(?,?,?)}");
			stmt.setString(1,aid);
			stmt.setString(2,medal);
			stmt.setString(3,uname);
			
			 stmt.execute();
			 result = stmt.getUpdateCount();			
			 
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return result;
	}	
	public int[] getActivityMedalAll(String name) throws SQLException{

		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		int[] c = {0,0,0};
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select * from medalView where username = '"+name+"'";
			
			
			ResultSet rs = stmt.executeQuery(sql);
			int gold = 0;
			int silver = 0;
			int bronze = 0;
			while(rs.next()) {
				String m =rs.getString(4);
				if(m.equals("เหรียญทอง")) {
					gold += 1;
					
				}else if(m.equals("เหรียญเงิน")) {
					silver += 1;
				}else if(m.equals("เหรียญทองแดง")) {
					bronze += 1;
				}else {
					gold += 0;
				}
				System.out.println(m);
			}
			c[0] = gold;
			c[1] = silver;
			c[2] = bronze;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return c;		
	}
	public List<RegisterActivity> getActivityResultAll() throws SQLException{

		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		List<RegisterActivity> r = new ArrayList<>();
	
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select * from AllResult ";
			
			String uname ="";
			String ida = "";
			String m = "";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				 uname = rs.getString(1);
				ida = rs.getString(2);
				 m =rs.getString(3);
					University u = new University();
					u.setUniversityName(uname);
					Faculty f = new Faculty();
					f.setUniversity(u);
					Register ree = new Register();
					ree.setFaculty(f);
					Activity a = new Activity();
					a.setActivityID(ida);
					RegisterActivityID acid = new RegisterActivityID(ree,a);
					RegisterActivity ac = new RegisterActivity();
					ac.setPk(acid);
					ac.setMedal(m);
				r.add(ac);
			}
			

			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return r;		
	}
	public List<Activity> maxActivitys(String user,String aid) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		List<Activity> a = new ArrayList<>();
		try {
			
			Statement stmt = conn.createStatement();
			
			String sql = "Select ac.ac_activityID from university u inner join faculty f on u.username = f.username inner join register r on r.idFaculty = f.idFaculty inner join registeractivity ac on r.idRegister = ac.re_idRegister inner join activity a on a.activityID = ac_activityID where u.username = '"+user+"' and ac.re_idRegister ='"+aid+"'";
			
			 ResultSet rs = stmt.executeQuery(sql);
			 while(rs.next()) {
				 Activity at = new Activity();
				 at.setActivityID(rs.getString(1));
				a.add(at);
			 }
			 
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return a;
	}
	public List<Activity> getActivitys() throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		List<Activity> a = new ArrayList<>();
		try {
			
			Statement stmt = conn.createStatement();
			
			String sql = "Select * from activity order by type,matchDate";
			
			 ResultSet rs = stmt.executeQuery(sql);
			 while(rs.next()) {
				 Activity at = new Activity();
				 at.setActivityID(rs.getString(1));
				 at.setActivityName(rs.getString(2));
				 Calendar c =Calendar.getInstance();
					c.setTime(rs.getTimestamp(5));
					at.setMatchDate(c);
				at.setPlace(rs.getString(7));
				at.setType(rs.getString(8));
				a.add(at);
			 }
			 
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return a;
	}		
	public List<Register> getActivityTName(String ac_id) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		List<Register> r = new ArrayList<>();
		try {
			
			Statement stmt = conn.createStatement();
			
			String sql = "Select r.fullName, u.universityName, r.prefix from university u inner join faculty f on u.username = f.username inner join register r on r.idFaculty = f.idFaculty inner join registeractivity ac on r.idRegister = ac.re_idRegister inner join activity a on a.activityID = ac_activityID where r.type=1 and a.activityID = '"+ac_id+"' order by u.universityName";
			
			 ResultSet rs = stmt.executeQuery(sql);
			 while(rs.next()) {
				 Register re = new Register();
					University u = new University();
					Faculty f = new Faculty();
				u.setUniversityName(rs.getString(2));
				re.setFullName(rs.getString(1));
				re.setPrefix(rs.getString(3));
				f.setUniversity(u);
				re.setFaculty(f);
				r.add(re);
			 }
			 
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return r;
	}		
	public List<Register> getActivitySName(String ac_id) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		List<Register> r = new ArrayList<>();
		try {
			
			Statement stmt = conn.createStatement();
			
			String sql = "Select r.fullName, u.universityName, r.prefix from university u inner join faculty f on u.username = f.username inner join register r on r.idFaculty = f.idFaculty inner join registeractivity ac on r.idRegister = ac.re_idRegister inner join activity a on a.activityID = ac_activityID where r.type=2 and a.activityID = '"+ac_id+"' Order by  u.universityName";
			
			
			 ResultSet rs = stmt.executeQuery(sql);
			 while(rs.next()) {
				 Register re = new Register();
					University u = new University();
					Faculty f = new Faculty();
				u.setUniversityName(rs.getString(2));
				re.setFullName(rs.getString(1));
				re.setPrefix(rs.getString(3));
				f.setUniversity(u);
				re.setFaculty(f);
				r.add(re);
			 }
			 
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return r;
	}
	
				
	
	
}
