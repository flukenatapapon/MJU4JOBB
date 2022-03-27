package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.temporal.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.University;


import java.util.*;

/**
 * Servlet implementation class UniversityServlet
 */
@WebServlet("/UniversityServlet")
public class UniversityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UniversityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		session.removeAttribute("uni");
		session.removeAttribute("user");
		session.removeAttribute("pass");
		session.removeAttribute("login");
		session.removeAttribute("chacklogin");
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		request.setCharacterEncoding("UTF-8");
		String uname = request.getParameter("user");
		String pwd = request.getParameter("password");
		String remember = request.getParameter("rememberUser");
		
		if(null != remember) {
			Cookie c1 = new Cookie("name",uname);
			Cookie c2 = new Cookie("pw",pwd);
			c1.setMaxAge(60*60*24*10);
			c2.setMaxAge(60*60*24*10);
			response.addCookie(c1);
			response.addCookie(c2);
		}else {
			Cookie c1 = new Cookie("name",uname);
			Cookie c2 = new Cookie("pw",pwd);
			c1.setMaxAge(0);
			c2.setMaxAge(0);
			response.addCookie(c1);
			response.addCookie(c2);
		}
		
		HttpSession session = request.getSession();
		UniversityManager list = new UniversityManager();
//		List<University> univer = list.getAllUniversity();
		String user = request.getParameter("user");
		String pass = request.getParameter("password");
		
		
		University uinverr = list.loginUniver("Admin4Jobb", pass);
		
		if(uinverr != null) {
			String uni = uinverr.getUniversityName();
			session.setAttribute("uni", uni);
			session.setAttribute("user", user);
			session.setAttribute("pass", pass);
			session.setAttribute("login", "jj");
			response.sendRedirect("AdminMenu.jsp");
		}else {
			University uinvers = list.loginUnivers(user, pass);
			if(uinvers != null) {
				String uni = uinvers.getUniversityName();
				session.setAttribute("uni", uni);
				session.setAttribute("user", user);
				session.setAttribute("pass", pass);
				session.setAttribute("login",  "jj");
				session.setAttribute("chacklogin", "chackkkk");
				response.sendRedirect("main.jsp");
			}else {
				University uinver = list.loginUniver(user, pass);
				if(uinver != null) {
					String uni = uinver.getUniversityName();
					session.setAttribute("uni", uni);
					session.setAttribute("user", user);
					session.setAttribute("pass", pass);
					session.setAttribute("login",  "jj");
					response.sendRedirect("main.jsp");	
				}else {
						System.out.println(user);
						System.out.print(pass);
						request.setAttribute("error", "รหัสผ่านไม่ถูกต้อง หรือ ยังไม่ถึงวันที่สมัคร");
					 	goTo("/login.jsp",request,response);
				}
			}
		}
		
		
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
//		for(University u :univer) {
//			
//			if(u.getUsername().equals(user) && u.getPassword().equals(pass)) {
//				
//				String uni = u.getUniversityName();
//				session.setAttribute("uni", uni);
//				
//			}
//			System.out.println(u.getLoginDate().getTime());
//		}
//		if(result) {
//			session.setAttribute("user", user);
//			session.setAttribute("pass", pass);
//			session.setAttribute("login", k);
//			response.sendRedirect("main.jsp");	
//		}else {
//			System.out.println(user);
//			System.out.print(pass);
//			request.setAttribute("error", "รหัสผ่านไม่ถูกต้องc"+univer.size());
//		 	goTo("/login.jsp",request,response);
//		}
		
		
		}
		protected void goTo(String url, HttpServletRequest request,
				HttpServletResponse response) {
				if (url != null) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
				
				try { dispatcher.forward(request, response); }
				
				catch (Exception e) {}
				
				}
				
				}
}
