package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.*;
/**
 * Servlet implementation class UpdateActivityServlet
 */
@WebServlet("/UpdateActivityServlet")
public class UpdateActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateActivityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String[] activity = request.getParameterValues("activity");
		Register re = (Register) session.getAttribute("register");
		ActivityManager rMrg = new ActivityManager();
		RegisManager rm = new RegisManager();
		String id = (String) session.getAttribute("uid");
		String user = (String) session.getAttribute("user");
		ActivityManager am = new ActivityManager(); 
		String tyy = (String) session.getAttribute("typee");
			if(tyy.equals("1")) {
				List<RegisterActivity> li = rm.getAll(user, id);
				for(RegisterActivity l : li) {
					am.deleteAc(l.getPk().getAc().getActivityID(), id);
				}
				rm.updateRegisterS(re);
				if(activity != null) {
					for(String ac : activity) {
						rMrg.addRegisterActivity(ac, re);
					}
					response.sendRedirect("main.jsp");
				}else {
					response.sendRedirect("main.jsp");
				}
			}else {
				String[] chk = new String[28];
				
				if(activity != null) {
					List<Activity> ac = rMrg.maxActivitys(user, id);
					int i = 0;
					for(String s :activity) {
						for(Activity a : ac) {
							if(a.getActivityID().equals(s)) {
								String h = s;
								chk[i] = h;
								i++;
							}
						}
						
					}
				}
				List<RegisterActivity> li = rm.getAll(user, id);
				for(RegisterActivity l : li) {
					am.deleteAc(l.getPk().getAc().getActivityID(), id);
				}
				List<Activity> ac = rMrg.getAllActivity();
				int cc = 0;
				if(activity != null) {
		    		for(Activity a : ac){
						for(String acc : activity) {
							if(acc.equals(a.getActivityID())) {
								int maxA = rMrg.maxActivity(user,acc);
								if(maxA >= a.getMaxPerson()) {
									cc =1;
									
									
								}
							}
							
						}
					}
				}
				if(cc == 1) {
					rm.updateRegisterS(re);
					
						for(String aca : chk) {
							rMrg.addRegisterActivity(aca, re);
						}
						
	    			session.setAttribute("er", "จำนวนผู้ลงกิจกรรมเต็มเเล้ว");
					response.sendRedirect("main.jsp");
	    		}else {
				
				rm.updateRegisterS(re);
				if(activity != null) {
					for(String aca : activity) {
						rMrg.addRegisterActivity(aca, re);
					}
					response.sendRedirect("main.jsp");
				}else {
					response.sendRedirect("main.jsp");
				}
	    		}
				
			}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}

}
