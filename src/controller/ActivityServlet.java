package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import bean.*;
/**
 * Servlet implementation class ActivityServlet
 */
@WebServlet("/ActivityServlet")
public class ActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String[] activity = request.getParameterValues("activity");
		Register re = (Register) session.getAttribute("register");
		Faculty f = (Faculty) session.getAttribute("faculty");
		String users = (String) session.getAttribute("user");
		ActivityManager rMrg = new ActivityManager();
		RegisManager rm = new RegisManager();
		
		try {
			List<Activity> ac = rMrg.getAllActivity();
			String t = (String) session.getAttribute("typee");
			if(t.equals("1")) {
				RegisManager rmm = new RegisManager();                     
	            String counts  = rmm.getAllCount(users,1);
	            int count = 0;
	            if(counts == null) {
	            	 count = 0;
	            }else {
	            	 count = Integer.parseInt(counts);
	            }
	            
	            count+=1;
	            
	            String id = null;
	            if(count > 99) {
	            	 id = users+"T"+count;
	            }else if(count > 9) {
	            	id = users+"T0"+count;
	            }else {
	            	id = users+"T00"+count;
	            }
	            
	    		re.setIdRegister(id);
	    		rm.register(re, f);
	    		
				if(activity != null) {
					for(String acc : activity) {
						rMrg.addRegisterActivity(acc, re);
					}
				}
				response.sendRedirect("main.jsp");
			}else {
				RegisManager rmm = new RegisManager();                     
	            String counts  = rmm.getAllCount(users,2);
	            int count = 0;
	            if(counts == null) {
	            	 count = 0;
	            }else {
	            	 count = Integer.parseInt(counts);
	            };
	            count+=1; 
	            String id = null;
	            if(count > 99) {
	            	 id = users+"S"+count;
	            }else if(count > 9) {
	            	id = users+"S0"+count;
	            }else {
	            	id = users+"S00"+count;
	            }
	    		re.setIdRegister(id);
	    		int cc = 0;
	    		if(activity != null) {
	    		for(Activity a : ac){
					for(String acc : activity) {
						if(acc.equals(a.getActivityID())) {
							int maxA = rMrg.maxActivity(users,acc);
							if(maxA >= a.getMaxPerson()) {
								cc =1;
							}
						}
						
					}
				}
	    		if(cc == 1) {
	    			session.setAttribute("er", "จำนวนผู้ลงกิจกรรมเต็มเเล้ว");
					response.sendRedirect("main.jsp");
	    		}else {
	    			rm.register(re, f);
	    			if(activity != null) {
	    				for(String acc : activity) {
	    					rMrg.addRegisterActivity(acc, re);
	    				}
	    			}
	    			response.sendRedirect("main.jsp");
	    		}
	    		}else {
	    			rm.register(re, f);
	    			response.sendRedirect("main.jsp");
	    		}
	    		
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
