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

import bean.Register;
import bean.RegisterActivity;

/**
 * Servlet implementation class UpdateAdminRegisterActivity
 */
@WebServlet("/UpdateAdminRegisterActivity")
public class UpdateAdminRegisterActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminRegisterActivity() {
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
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String[] activity = request.getParameterValues("activity");
		Register re = (Register) session.getAttribute("register");
		ActivityManager rMrg = new ActivityManager();
		RegisManager rm = new RegisManager();
		String id = (String) session.getAttribute("uid");
		String user = (String) session.getAttribute("user");
		String nameU = (String) session.getAttribute("uaa");
		ActivityManager am = new ActivityManager(); 
			try {
				List<RegisterActivity> li = rm.getAll(nameU, id);
				for(RegisterActivity l : li) {
					am.deleteAc(l.getPk().getAc().getActivityID(), id);
				}
				rm.updateRegisterS(re);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		if(activity != null) {
		for(String ac : activity) {
			try {
				rMrg.addRegisterActivity(ac, re);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect("AdminList.jsp");
		}else {
			response.sendRedirect("AdminList.jsp");
		}
	}

}
