<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,bean.*,controller.*"%>
<%
	String login = (String) session.getAttribute("login");
	if(login == null){
		response.sendRedirect("index.jsp");
	}else{
		String ua = (String) session.getAttribute("user");
		if(!ua.equals("Admin4Jobb")){
			response.sendRedirect("main.jsp");
		}
		UniversityManager um = new UniversityManager();
		List<University> u = um.getAllUniversity();
		String user = (String) session.getAttribute("user");
		String nameU = (String) session.getAttribute("uaa");
		
		String acname = (String) session.getAttribute("aids");
		String acnames = (String) session.getAttribute("aname");
		UniversityManager umrg = new UniversityManager();
		String uuaa = umrg.getAllUniversitys(nameU);
		ActivityManager amrg = new ActivityManager();
		String errors = (String) session.getAttribute("errorM");
		session.removeAttribute("errorM");		
		List<University> list = um.getAllUniversity();
		RegisManager rm = new RegisManager();
		List<Register> re = rm.getAlls(user);
		String chkm = (String) session.getAttribute("checkmedals");
		
		
%>      
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="image/logo-2.png" type="image/png" sizes="16x16">
<meta charset="UTF-8">
<title>หน้าแรกผุ้ดูแลระบบ</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kanit&display=swap"
	rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css?family=KoHo:700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/fullcss.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/list.css">
<link rel="stylesheet" href="css/fo.css">
<script src="js/carousel.js"></script>
<link rel="stylesheet" href="css/gall.css">
<script async src="js/header.js"></script>
<style>
.responsive-h {
  width: 70%;
  height: auto;
}
</style>
<!-- unis=TSU -->
<body>	
<header id="header">
<div class="container">
  <div class="row">
    <div id="logo" class="col-md-2">
      <h1><a href="AdminMenu.jsp"><img class="responsive-h" src="image/logo.png" height="1000px" width="auto"></a></h1>
    </div>
    <div class="col-md-6">
    <h5>ระบบลงทะเบียนเข้าร่วมงานประเพณี 4 จอบ แห่งชาติ ครั้งที่ 37  </h5>
    </div>
    <div  class="col-md-4">
	   <nav id="nav-menu-container" style="padding-top: 2%;">
        <ul class="nav-menu">
        <li><a href="AdminMenu.jsp" style="font-size:100%">หน้าหลัก</a></li>
        <li><a style="font-size:100%" href="UniversityServlet"> ออกจากระบบ </a></li>
        </ul>
      </nav>
    </div>
  </div>
</div>
</header>
<br>
<div class="container py-4 my-2 fontst">
    <div class="card border-0">
        <div class="card-body m-0 p-0">
        <h2 class="text-center f" style="color:black"> <%= acnames %> </h2>
        <h2 class="text-center f" style="color:black"> รายการแข่งขันทักษะ </h2>
            <table style="text-align:center" id="example" class="table bg-white table-striped table-bordered border-0 f">
                <thead  class="text-white">
                    <tr>
                    	<th>มหาวิทยาลัย</th>
                        <th>อัพเดทผลการแข่งขัน</th>
                        <th>ลบ</th>
                    </tr>
                </thead>
                <tbody>
                
                <% String[] medal = {"เหรียญทอง","เหรียญเงิน","เหรียญทองแดง",""}; %>
                <%for(University st : list) { %>
                <% List<RegisterActivity> ac = amrg.getActivityMedal(st.getUsername()); %>
                <%int i=1; for(RegisterActivity a : ac){ %>
                    <tr>
                    
                <% if(st.getUsername().equals(a.getPk().getRe().getFaculty().getUniversity().getUsername()) && a.getPk().getAc().getActivityID().equals(acname)){ %>
                        <td><%= st.getUniversityName() %></td>
                       
                        <td  align="center">
							<% for(int j=0 ; j < 3 ;j++){ %>
							<% if(a.getMedal().equals(medal[j])) {%>
								<a href="MedalServlet?medal=<%= medal[j] %>&aidd=<%= a.getPk().getRe().getFaculty().getUniversity().getUsername() %>"><img class="one" src="image/m<%= j+1 %>.png" height="60px" width="60px"></a>
							<% }else if(a.getMedal().equals("")){ %>
							<a href="MedalServlet?medal=<%= medal[j] %>&aidd=<%= a.getPk().getRe().getFaculty().getUniversity().getUsername() %>"><img class="one" src="image/m<%= j+1 %>.png" height="60px" width="60px"></a>
							<% } %>
							<% } %>
						</td>
                         <% if(a.getMedal().equals("")){ %>
                        <td></td>
                        <%}else{ %>
                        <td><a onClick="return confirm('แน่ใจหรือไม่ที่จะลบ')" href="MedalServlet?medal=<%= medal[3] %>&aidd=<%= a.getPk().getRe().getFaculty().getUniversity().getUsername() %>"><img alt="" src="image/deleteicon.png" height="25px" width="25px"></a></td>
						<% }} %>
                        
					</tr>
					<%i++; }} %>
                
               
                </tbody>
            </table>
           
        </div>
    </div>
</div>     	
</body>
</html>
<% } %>