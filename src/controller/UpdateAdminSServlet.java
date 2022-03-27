package controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.Faculty;
import bean.Register;

/**
 * Servlet implementation class UpdateAdminSServlet
 */
@WebServlet("/UpdateAdminSServlet")
public class UpdateAdminSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminSServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			request.setCharacterEncoding("UTF-8");
			RegisManager rm = new RegisManager();
			String id = request.getParameter("id");
			
			System.out.println(id);
			Register rt = rm.getRegisterByID(id);
			String rts = rm.getRegisterByIDA(id);
			session.setAttribute("updateS", rts);
			request.setAttribute("update",rt);
			session.setAttribute("uid",id);
			
			goTo("/UpdateAdminS.jsp",request,response);
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UtF-8");
		response.setCharacterEncoding("UTF-8");
		String user = (String) session.getAttribute("user");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {     	 
         // Create a factory for disk-based file items     	 
         FileItemFactory factory = new DiskFileItemFactory();
         // Create a new file upload handler
         ServletFileUpload upload = new ServletFileUpload(factory);
         
            try {      	 
             // Parse the request       	 
            	upload.setHeaderEncoding("UTF-8");
            	String nameU = (String) session.getAttribute("uaa");
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
		String id = (String) session.getAttribute("uid");
		Faculty f = new Faculty();
		f.setIdFaculty(faculty);
		if(!"".equals(pic)) {
			String filename = fullname.replaceAll(" ","-"); 
            String nameimage = pic.substring(pic.lastIndexOf("."));
    		pic = filename+nameimage;
			String path = request.getServletContext().getRealPath("/")+"//Upload//" ; 
	        File uploadedFile = new File(path + "/" + pic);                         
	        System.out.println(uploadedFile.getAbsolutePath());                        
	        items.get(8).write(uploadedFile);                
 		}else {
 			RegisManager mg = new RegisManager();
 			Register re =mg.getAllsss(nameU, id);
 			pic = re.getImage();
 		}               
		
		Register re = new Register(id,2,gender,position,prefix,fullname,nickname,tell,"",travelType,travelVehicle,travelDetail,travelTypeR,travelVehicleR,travelDetailR,foodtype,foodallegy,pic,"","",f);
		
		session.setAttribute("register",re);
		session.setAttribute("faculty",f);
		session.setAttribute("typee", "2");
		RegisManager rm = new RegisManager();
		if(faculty.equals("15") || faculty.equals("16")) {
			rm.updateRegisterS(re);
			response.sendRedirect("main.jsp");
		}else {
			response.sendRedirect("UpdateRegisterActivityAdmin.jsp");
		}
		
	     
            } catch (FileUploadException e) {            	 
                e.printStackTrace();               
            } catch (Exception e) {         	 
                e.printStackTrace();
            }    
	}
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
