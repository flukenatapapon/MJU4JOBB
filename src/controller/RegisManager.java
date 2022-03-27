package controller;
import bean.*;
import utility.ConnectionDB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
public class RegisManager {
	public int register(Register register, Faculty f)  throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		int result = 0;
		try {
			CallableStatement stmt = conn.prepareCall("{call InsertRegis(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			stmt.setString(1,register.getIdRegister());
			stmt.setString(2, register.getNickName());
			stmt.setString(3, register.getChinesetable());
			stmt.setString(4,register.getFacebook());
			stmt.setString(5,register.getFoodallergy());
			stmt.setString(6, register.getFoodtype());
			stmt.setString(7, register.getFullName());
			stmt.setString(8,register.getGender());
			stmt.setString(9, register.getImage());
			stmt.setString(10, register.getKhantokTable());
			stmt.setString(11, register.getPhone());
			stmt.setString(12, register.getPosition());
			stmt.setString(13, register.getPrefix());
			stmt.setString(14, register.getReturndetail());;
			stmt.setString(15, register.getReturning());
			stmt.setString(16, register.getReturns());
			stmt.setString(17, register.getTravel());
			stmt.setString(18, register.getTravelDetail());
			stmt.setString(19, register.getTraveling());
			stmt.setInt(20, register.getType());
			stmt.setString(21, register.getFaculty().getIdFaculty());
			 stmt.execute();
			 result = stmt.getUpdateCount();			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return result;
	}
	public int updateRegisterS(Register register)  throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		int result = 0;
		try {
			CallableStatement stmt = conn.prepareCall("{call updateRegis(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			stmt.setString(1,register.getIdRegister());
			stmt.setString(2, register.getNickName());
			stmt.setString(3, register.getChinesetable());
			stmt.setString(4,register.getFacebook());
			stmt.setString(5,register.getFoodallergy());
			stmt.setString(6, register.getFoodtype());
			stmt.setString(7, register.getFullName());
			stmt.setString(8,register.getGender());
			stmt.setString(9, register.getImage());
			stmt.setString(10, register.getKhantokTable());
			stmt.setString(11, register.getPhone());
			stmt.setString(12, register.getPosition());
			stmt.setString(13, register.getPrefix());
			stmt.setString(14, register.getReturndetail());;
			stmt.setString(15, register.getReturning());
			stmt.setString(16, register.getReturns());
			stmt.setString(17, register.getTravel());
			stmt.setString(18, register.getTravelDetail());
			stmt.setString(19, register.getTraveling());
			stmt.setInt(20, register.getType());
			stmt.setString(21, register.getFaculty().getIdFaculty());
			 stmt.execute();
			 result = stmt.getUpdateCount();			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return result;
	}
	public int updateRegister(Register register, Faculty f) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		int result = 0;
		try {
			
			Statement stmt = conn.createStatement();
			
			String sql = "update register set fullName = '"+register.getFullName()+"',gender = '"+register.getGender()+"',"
					+ "position = '"+register.getPosition()+"', prefix = '"+register.getPrefix()+"', nickName = '"+register.getNickName()+"',"
					+ "phone = '"+register.getPhone()+"', travel = '"+register.getTravel()+"',"
					+ "traveling = '"+register.getTraveling()+"', travelDetail = '"+register.getTravelDetail()+"',"
					+ "returns = '"+register.getReturns()+"', returning = '"+register.getReturning()+"',"
					+ " returndetail = '"+register.getReturndetail()+"', foodtype = '"+register.getFoodtype()+"',"
					+ "foodallergy = '"+register.getFoodallergy()+"', image = '"+register.getImage()+"' where idRegister= '"+register.getIdRegister()+"' ";
					
			
			System.out.println(sql);
			result = stmt.executeUpdate(sql);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return result;
	}
	
	public Register getRegisterByID(String reID) throws SQLException{
		Register rt = null;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select idRegister,fullName,nickName from register where idRegister='"+reID+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rt = new Register();
				rt.setIdRegister(rs.getString(1));
				rt.setFullName(rs.getString(2));
				rt.setNickName(rs.getString(3));

			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return rt;
	}
	public String getRegisterByIDA(String reID) throws SQLException{
		String rt = null;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select u.username,re.idRegister,re.fullName,re.nickName from university u inner join faculty f on u.username = f.username inner join register re on re.idFaculty = f.idFaculty where re.idRegister='"+reID+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rt = rs.getString(1);

			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return rt;
	}

	public List<Register> getAlls(String use) throws SQLException{
		List<Register> list = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select u.username, u.loginDate, u.maxPerson, u.password, u.universityName,f.idFaculty, f.facultyName, f.username,r.idRegister,"
					+ " r.nickName, r.chinesetable, r.facebook, r.foodallergy, r.foodtype, r.fullName, r.gender, r.image, r.khantokTable, r.phone, r.position,"
					+ " r.prefix, r.returndetail, r.returning, r.returns, r.travel, r.travelDetail, r.traveling, r.type, r.idFaculty"
					+ " from university u inner join faculty f on u.username = f.username inner join register r on r.idFaculty = f.idFaculty  where u.username = '"+use+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String users = rs.getString(1);
				Calendar c =Calendar.getInstance();
				c.setTime(rs.getTimestamp(2));
				int max = rs.getInt(3);
				String pass = rs.getString(4);
				String universityName = rs.getString(5);
				String idFaculty = rs.getString(6);
				String facultyName = rs.getString(7);
				String username = rs.getString(8);
				String idRegister = rs.getString(9);
				String nickName = rs.getString(10);
				String chinesetable = rs.getString(11);
				String facebook = rs.getString(12);
				String foodallergy = rs.getString(13);
				String foodtype = rs.getString(14);
				String fullName = rs.getString(15);
				String gender = rs.getString(16);
				String image = rs.getString(17);
				String khantokTable = rs.getString(18);
				String phone = rs.getString(19);
				String position = rs.getString(20);
				String prefix = rs.getString(21);
				String returndetail = rs.getString(22);
				String returning = rs.getString(23);
				String returns = rs.getString(24);
				String travel = rs.getString(25);
				String travelDetail = rs.getString(26);
				String traveling = rs.getString(27);
				int type = rs.getInt(28);
				String idFacultys = rs.getString(29);
				
				University u = new University(users,pass,universityName,c,max);
				Faculty f = new Faculty(idFaculty,facultyName,u);
				Register r = new Register(idRegister,type,gender,position,prefix,fullName,nickName,phone,facebook,travel,traveling,travelDetail,returns,returning,returndetail,foodtype,foodallergy,image,chinesetable,khantokTable,f);

				
				
				list.add(r);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return list;
	}
	public Register getAllss(String use, String regis) throws SQLException{
		Register r = null;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select u.username, u.loginDate, u.maxPerson, u.password, u.universityName,f.idFaculty, f.facultyName, f.username,r.idRegister,"
					+ " r.nickName, r.chinesetable, r.facebook, r.foodallergy, r.foodtype, r.fullName, r.gender, r.image, r.khantokTable, r.phone, r.position,"
					+ " r.prefix, r.returndetail, r.returning, r.returns, r.travel, r.travelDetail, r.traveling, r.type, r.idFaculty"
					+ " from university u inner join faculty f on u.username = f.username inner join register r on r.idFaculty = f.idFaculty  where u.username = '"+use+"' and r.idRegister = '"+regis+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String users = rs.getString(1);
				Calendar c =Calendar.getInstance();
				c.setTime(rs.getTimestamp(2));
				int max = rs.getInt(3);
				String pass = rs.getString(4);
				String universityName = rs.getString(5);
				String idFaculty = rs.getString(6);
				String facultyName = rs.getString(7);
				String username = rs.getString(8);
				String idRegister = rs.getString(9);
				String nickName = rs.getString(10);
				String chinesetable = rs.getString(11);
				String facebook = rs.getString(12);
				String foodallergy = rs.getString(13);
				String foodtype = rs.getString(14);
				String fullName = rs.getString(15);
				String gender = rs.getString(16);
				String image = rs.getString(17);
				String khantokTable = rs.getString(18);
				String phone = rs.getString(19);
				String position = rs.getString(20);
				String prefix = rs.getString(21);
				String returndetail = rs.getString(22);
				String returning = rs.getString(23);
				String returns = rs.getString(24);
				String travel = rs.getString(25);
				String travelDetail = rs.getString(26);
				String traveling = rs.getString(27);
				int type = rs.getInt(28);
				String idFacultys = rs.getString(29);
				
				University u = new University(users,pass,universityName,c,max);
				Faculty f = new Faculty(idFaculty,facultyName,u);
				 r = new Register(idRegister,type,gender,position,prefix,fullName,nickName,phone,facebook,travel,traveling,travelDetail,returns,returning,returndetail,foodtype,foodallergy,image,chinesetable,khantokTable,f);

				
				
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return r;
	}
	public Register getAllsss(String use, String regis) throws SQLException{
		Register r = null;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select u.username, u.loginDate, u.maxPerson, u.password, u.universityName,f.idFaculty, f.facultyName, f.username,r.idRegister,"
					+ " r.nickName, r.chinesetable, r.facebook, r.foodallergy, r.foodtype, r.fullName, r.gender, r.image, r.khantokTable, r.phone, r.position,"
					+ " r.prefix, r.returndetail, r.returning, r.returns, r.travel, r.travelDetail, r.traveling, r.type, r.idFaculty"
					+ " from university u inner join faculty f on u.username = f.username inner join register r on r.idFaculty = f.idFaculty  where u.username = '"+use+"' and r.idRegister = '"+regis+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String users = rs.getString(1);
				Calendar c =Calendar.getInstance();
				c.setTime(rs.getTimestamp(2));
				int max = rs.getInt(3);
				String pass = rs.getString(4);
				String universityName = rs.getString(5);
				String idFaculty = rs.getString(6);
				String facultyName = rs.getString(7);
				String username = rs.getString(8);
				String idRegister = rs.getString(9);
				String nickName = rs.getString(10);
				String chinesetable = rs.getString(11);
				String facebook = rs.getString(12);
				String foodallergy = rs.getString(13);
				String foodtype = rs.getString(14);
				String fullName = rs.getString(15);
				String gender = rs.getString(16);
				String image = rs.getString(17);
				String khantokTable = rs.getString(18);
				String phone = rs.getString(19);
				String position = rs.getString(20);
				String prefix = rs.getString(21);
				String returndetail = rs.getString(22);
				String returning = rs.getString(23);
				String returns = rs.getString(24);
				String travel = rs.getString(25);
				String travelDetail = rs.getString(26);
				String traveling = rs.getString(27);
				int type = rs.getInt(28);
				String idFacultys = rs.getString(29);
				
				University u = new University(users,pass,universityName,c,max);
				Faculty f = new Faculty(idFaculty,facultyName,u);
				 r = new Register(idRegister,type,gender,position,prefix,fullName,nickName,phone,facebook,travel,traveling,travelDetail,returns,returning,returndetail,foodtype,foodallergy,image,chinesetable,khantokTable,f);


				
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return r;
	}

	public List<RegisterActivity> getAll(String use,String regisId) throws SQLException{
		List<RegisterActivity> list = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select u.username, u.loginDate, u.maxPerson, u.password, u.universityName,f.idFaculty, f.facultyName, f.username,r.idRegister,"
					+ " r.nickName, r.chinesetable, r.facebook, r.foodallergy, r.foodtype, r.fullName, r.gender, r.image, r.khantokTable, r.phone, r.position,"
					+ " r.prefix, r.returndetail, r.returning, r.returns, r.travel, r.travelDetail, r.traveling, r.type, r.idFaculty,"
					+"ac.medal, ac.ac_activityID, ac.re_idRegister, a.activityID, a.activityName, a.female, a.male, a.matchDate, a.maxPerson, a.place, a.type"
					+ " from university u inner join faculty f on u.username = f.username inner join register r on r.idFaculty = f.idFaculty inner join registeractivity ac on r.idRegister = ac.re_idRegister "
					+ "inner join activity a on a.activityID = ac_activityID where u.username = '"+use+"' and r.idRegister = '"+regisId+"' order by r.fullname ";
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String users = rs.getString(1);
				Calendar c =Calendar.getInstance();
				c.setTime(rs.getTimestamp(2));
				int max = rs.getInt(3);
				String pass = rs.getString(4);
				String universityName = rs.getString(5);
				String idFaculty = rs.getString(6);
				String facultyName = rs.getString(7);
				String username = rs.getString(8);
				String idRegister = rs.getString(9);
				String nickName = rs.getString(10);
				String chinesetable = rs.getString(11);
				String facebook = rs.getString(12);
				String foodallergy = rs.getString(13);
				String foodtype = rs.getString(14);
				String fullName = rs.getString(15);
				String gender = rs.getString(16);
				String image = rs.getString(17);
				String khantokTable = rs.getString(18);
				String phone = rs.getString(19);
				String position = rs.getString(20);
				String prefix = rs.getString(21);
				String returndetail = rs.getString(22);
				String returning = rs.getString(23);
				String returns = rs.getString(24);
				String travel = rs.getString(25);
				String travelDetail = rs.getString(26);
				String traveling = rs.getString(27);
				int type = rs.getInt(28);
				String idFacultys = rs.getString(29);
				String medal = rs.getString(30);
				String ac_activityID = rs.getString(31);
				String re_idRegister = rs.getString(32);
				String activityID = rs.getString(33);
				String activityName = rs.getString(34);
				int female = rs.getInt(35);
				int male = rs.getInt(36);
				Calendar c1 =Calendar.getInstance();
				c1.setTime(rs.getTimestamp(37));
				int maxPerson = rs.getInt(38);
				String place = rs.getString(39);
				String types = rs.getString(40);
				University u = new University(users,pass,universityName,c,max);
				Faculty f = new Faculty(idFaculty,facultyName,u);
				Register r = new Register(idRegister,type,gender,position,prefix,fullName,nickName,phone,facebook,travel,traveling,travelDetail,returns,returning,returndetail,foodtype,foodallergy,image,chinesetable,khantokTable,f);
				Activity a = new Activity(activityID,types,activityName,c1,place,maxPerson,male,female);
				RegisterActivityID acid = new RegisterActivityID(r,a);
				RegisterActivity ac = new RegisterActivity(acid,medal);
				
				
				list.add(ac);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return list;
	}
	public String getAllCount(String use, int type) throws SQLException {
		String counts = null;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select u.username, SUBSTRING(r.idRegister, -4, 1) as types ,max(SUBSTRING(r.idRegister, -3, 3)) as maxid from university u inner join faculty f on u.username = f.username inner join register r on r.idFaculty = f.idFaculty where u.username = '"+use+"' and r.type = "+type+" Group by u.username, SUBSTRING(r.idRegister, -4, 1)";
			
//			String sql = "Select count(r.idRegister) "
//					+ " from university u inner join faculty f on u.username = f.username inner join register r on r.idFaculty = f.idFaculty  where u.username = '"+use+"' and r.type = "+type+"";
			
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				counts = rs.getString(3);
				
			}
	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return counts;		
	}
	public int countRegister(String uer) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		int count = 0;
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from countall where username = '"+uer+"'";
			
			 ResultSet rs = stmt.executeQuery(sql);
			 if(rs.next()) {
				count = rs.getInt(2);
			 }
			 
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return count;
	}
	public int deleteRegis(String res) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		int result = 0;
		Register re = new Register();
		try {
			
			CallableStatement stmt = conn.prepareCall("{call deleteRegis(?)}");
			stmt.setString(1, res);
			stmt.execute();
			result = stmt.getUpdateCount();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return result;
	}
	public int allRegisT(String res) throws SQLException{
		int count = 0;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select * "
					+ " from allregis where username = '"+res+"' and type = 1";
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				count = rs.getInt(4);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return count;		
	}
	public int allRegisS(String res) throws SQLException{
		int count = 0;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		
		try {
			
			Statement stmt = conn.createStatement();
			String sql = "Select * "
					+ " from allregis where username = '"+res+"' and type = 2";
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				count = rs.getInt(4);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return count;		
	}
}
