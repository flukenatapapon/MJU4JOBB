package controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import bean.*;
import utility.ConnectionDB;

public class UniversityManager {
	public List<University> getAllUniversity(){
		List<University> list = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String sql = "Select username,password,universityName,loginDate,maxPerson from university ";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Calendar c =Calendar.getInstance();
				String user = rs.getString(1);
				String pass = rs.getString(2);
				String univer = rs.getString(3);
				c.setTime(rs.getTimestamp(4));
				University us = new University(user,pass,univer,c,rs.getInt(5));
				list.add(us);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public List<University> getUni(){
		List<University> list = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String sql = "Select username,password,universityName,loginDate,maxPerson from university ";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Calendar c =Calendar.getInstance();
				String user = rs.getString(1);
				String pass = rs.getString(2);
				String univer = rs.getString(3);
				c.setTime(rs.getTimestamp(4));
				University us = new University(user,pass,univer,c,rs.getInt(5));
				list.add(us);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public int maxUniversity(String uer) throws SQLException{
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		int max = 0;
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from univermax where username = '"+uer+"'";
			
			 ResultSet rs = stmt.executeQuery(sql);
			 if(rs.next()) {
				max = rs.getInt(2);
			 }
			 
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return max;
	}
	public University loginUniver(String uer,String pass) throws SQLException{
		University u = null;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		int max = 0;
		try {
			Statement stmt = conn.createStatement();
			//String sql = "select * from univerlogin where username = '"+uer+"' and loginDate between sysdate() and (select loginDate from university where username = '"+uer+"')";
			String sql = "select * from univerlogin where username = '"+uer+"' and password = '"+pass+"' and  sysdate() < loginDate";
			
			 ResultSet rs = stmt.executeQuery(sql);
			 if(rs.next()) {
				u = new University();
				u.setUsername(rs.getString(1));
				u.setPassword(rs.getString(2));
				u.setUniversityName(rs.getString(3));
				Calendar cc = Calendar.getInstance();
				cc.setTime(rs.getTimestamp(4));
				u.setLoginDate(cc);
				
			 }
			 
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return u;
	}
	public University loginUnivers(String uer,String pass) throws SQLException{
		University u = null;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		int max = 0;
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from univerlogin where username = '"+uer+"' and password = '"+pass+"' and  sysdate() > loginDate";
			
			 ResultSet rs = stmt.executeQuery(sql);
			 if(rs.next()) {
				u = new University();
				u.setUsername(rs.getString(1));
				u.setPassword(rs.getString(2));
				u.setUniversityName(rs.getString(3));
				Calendar cc = Calendar.getInstance();
				cc.setTime(rs.getTimestamp(4));
				u.setLoginDate(cc);
				
			 }
			 
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return u;
	}
	public String getAllUniversitys(String username){
		String list = null;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String sql = "Select username,password,universityName,loginDate,maxPerson from university where username = '"+username+"'";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				list = rs.getString(3);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
