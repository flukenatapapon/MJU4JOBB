package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.*;
import java.util.*;
import controller.*;
/**
 * Servlet implementation class MedalServlet
 */
@WebServlet("/MedalServlet")
public class MedalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MedalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String medal = request.getParameter("medal");
		String nameU = request.getParameter("aidd");
		String aid = (String) session.getAttribute("aids");
		ActivityManager am = new ActivityManager();
		try {
			int ac = am.addMedalActivity(aid, medal, nameU);
			
			if(ac == 1) {
				session.setAttribute("checkmedals", medal);
				response.sendRedirect("AdminIndexs.jsp");
			}else {
				session.setAttribute("errorM", "ไม่สามารถอัพเดทผลการแข่งขันได้");
				response.sendRedirect("AdminIndexs.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
