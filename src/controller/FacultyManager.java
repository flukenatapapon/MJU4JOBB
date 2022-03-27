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
import bean.University;
import utility.ConnectionDB;

public class FacultyManager {
	public List<Faculty> getAllFaculty() throws SQLException{
		List<Faculty> list = new ArrayList<>();
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String sql = "Select f.idFaculty,f.facultyName,f.username,u.password,u.universityName,u.loginDate,u.maxPerson from faculty f inner join "
					+ "	university u on f.username = u.username ";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Calendar c = Calendar.getInstance();
				String id = rs.getString(1);
				String name = rs.getString(2);
				String user = rs.getString(3);
				String pass = rs.getString(4);
				String uName = rs.getString(5);
				c.setTime(rs.getTimestamp(6));
				int max = rs.getInt(7);
				University un = new University(user,pass,uName,c,max);
				Faculty fa = new Faculty(id,name,un);
				list.add(fa);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return list;
	}
	public Faculty getFacultyID(String users,String fac) throws SQLException{
		Faculty list = null;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String sql = "Select f.idFaculty,f.facultyName,f.username,u.password,u.universityName,u.loginDate,u.maxPerson from faculty f inner join "
					+ "	university u on f.username = u.username  where u.username = '"+users+"' and f.idFaculty =  '"+fac+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Calendar c = Calendar.getInstance();
				String id = rs.getString(1);
				String name = rs.getString(2);
				String user = rs.getString(3);
				String pass = rs.getString(4);
				String uName = rs.getString(5);
				c.setTime(rs.getTimestamp(6));
				int max = rs.getInt(7);
				University un = new University(user,pass,uName,c,max);
				list = new Faculty(id,name,un);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return list;
	}
	public Faculty getAllFacultyName(String name) throws SQLException{
		Faculty list = null;
		ConnectionDB condb = new ConnectionDB();
		Connection conn = condb.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String sql = "Select f.idFaculty,f.facultyName,f.username,u.password,u.universityName from faculty f inner join "
					+ "	university u on f.username = u.username where u.username = '"+name+"' ";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				list = new Faculty();
				list.setFacultyName(rs.getString(2));
				list.getUniversity().setUniversityName(rs.getString(5));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return list;
	}
}
