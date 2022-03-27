package controller;

import java.io.File;
import java.io.IOException;
import java.util.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import bean.Faculty;
import bean.Register;
import bean.University;

/**
 * Servlet implementation class RegisterTeacServlet
 */
@WebServlet("/RegisterTeacServlet")
public class RegisterTeacServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterTeacServlet() {
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
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UtF-8");
		response.setCharacterEncoding("UTF-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {     	 
         // Create a factory for disk-based file items     	 
         FileItemFactory factory = new DiskFileItemFactory();
         // Create a new file upload handler
         ServletFileUpload upload = new ServletFileUpload(factory);
         
            try {      	 
             // Parse the request       	 
            	upload.setHeaderEncoding("UTF-8");
             List<FileItem>  items = upload.parseRequest(request);  
     		String prefix = items.get(0).getString("UTF-8");
     		String fullname = items.get(1).getString("UTF-8");
     		String nickname = items.get(2).getString("UTF-8");
     		String gender = items.get(3).getString("UTF-8");
      		String position = items.get(4).getString("UTF-8");
     		String tell = items.get(5).getString("UTF-8");
     		String university = items.get(6).getString("UTF-8");
     		String faculty= items.get(7).getString("UTF-8");
     		String pic = new File (items.get(8).getName()).getName();
     		String travelType = items.get(9).getString("UTF-8");
     		String travelVehicle = items.get(10).getString("UTF-8");
     		String travelDetail = items.get(11).getString("UTF-8");
     		String travelTypeR = items.get(12).getString("UTF-8");
     		String travelVehicleR = items.get(13).getString("UTF-8");
     		String travelDetailR = items.get(14).getString("UTF-8");
     		String foodtype =  items.get(15).getString("UTF-8");
     		String foodallegy = items.get(16).getString("UTF-8");
     		String users = (String) session.getAttribute("user");
     		FacultyManager fm = new FacultyManager();
     		Faculty f = fm.getFacultyID(users,faculty);
     		RegisManager rm = new RegisManager();                     
     		String filename = fullname.replaceAll(" ","-"); 
            
            String nameimage = pic.substring(pic.lastIndexOf("."));
    		pic = filename+nameimage;
            
            String path = request.getServletContext().getRealPath("/")+"//Upload//" ; 
                        File uploadedFile = new File(path + "/" + pic);                         
                        System.out.println(uploadedFile.getAbsolutePath());                        
                        items.get(8).write(uploadedFile);                        
                
        		Register re = new Register("",1,gender,position,prefix,fullname,nickname,tell,"",travelType,travelVehicle,travelDetail,travelTypeR,travelVehicleR,travelDetailR,foodtype,foodallegy,pic,"","",f);
        		
        		session.setAttribute("register",re);
        		session.setAttribute("faculty",f);
        		int total = rm.countRegister(users);
        		UniversityManager um = new UniversityManager();
        		//List<University> u = um.getAllUniversity();
        		int max = um.maxUniversity(users);
        		
        		if(total < max || max == 0) {		
        			System.out.println(max);
        			session.setAttribute("typee", "1");
        			if(max == 50) {
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
        					rm.register(re, f);
        				response.sendRedirect("main.jsp");
        			}else {
        				session.setAttribute("checkss","1");
        				response.sendRedirect("Activity.jsp");
        			}
        		}else {
        			System.out.println(max);
        			session.setAttribute("errorR", "จํานวนผู้ลงทะเบียนสมัครครบ 50 คนแล้ว");
        			response.sendRedirect("main.jsp");
        		}
        		
                
            } catch (FileUploadException e) {            	 
                e.printStackTrace();               
            } catch (Exception e) {         	 
                e.printStackTrace();
            }           
        }       
		
	}

}
