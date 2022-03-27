<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,controller.*,bean.*" %>
<!DOCTYPE html>
<%
	String login = (String) session.getAttribute("login");
	if(null == login){
		response.sendRedirect("index.jsp");
	}else{
		String ua = (String) session.getAttribute("user");
		if(!ua.equals("Admin4Jobb")){
			response.sendRedirect("main.jsp");
		}
		String user = (String) session.getAttribute("user");
		String nameU = (String) session.getAttribute("uaa");
		UniversityManager umrg = new UniversityManager();
		String uuaa = umrg.getAllUniversitys(nameU);
		ActivityManager amrg = new ActivityManager();
		List<RegisterActivity> ac = amrg.getActivityMedal(nameU);
		String errors = (String) session.getAttribute("errorM");
		session.removeAttribute("errorM");
		
%> 
<html>
<head>
<link rel="icon" href="image/logo-2.png" type="image/png" sizes="16x16">
<meta charset="UTF-8">
<title>กรอกผลการแข่งขัน</title>
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
<link rel="stylesheet" href="css/fo.css">
<link rel="stylesheet" href="css/list.css">
<script src="js/carousel.js"></script>
<link rel="stylesheet" href="css/gall.css">
<script async src="js/header.js"></script>
<style>
.responsive-h {
  width: 70%;
  height: auto;
}
</style>

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

 <div class="container py-4 my-2 fontst">
    <div class="card border-0">
        <div class="card-body m-0 p-0">
        <h2 class="text-center f" style="color:black"> <%= uuaa %> </h2>
        <h2 class="text-center f" style="color:black"> รายการแข่งขันทักษะ </h2>
            <table style="text-align:center" id="example" class="table bg-white table-striped table-bordered border-0 f">
                <thead  class="text-white">
                    <tr>
                    	<th>ลําดับ</th>
                        <th> รายการแข่งขัน </th>
                        <th>อัพเดทผลการแข่งขัน</th>
                        <th> เหรียญ </th>
                    </tr>
                </thead>
                <tbody>
         			<%int i=1; for(RegisterActivity a : ac){ %>
         			<% if(a.getPk().getAc().getType().equals("1")) {%>
                    <tr>
                    	<td><%= i %></td>
                        <td><%= a.getPk().getAc().getActivityName()  %></td>
						<td  align="center">
						<a href="updateMedalServlet?aid=<%= a.getPk().getAc().getActivityID() %>"><img src="image/trop.png" height="40px" width="40px"></a>
						</td>
                        <td><%= a.getMedal() %></td>
					</tr>
					<%i++; }} %>
                </tbody>
            </table>
            <h2 class="text-center f" style="color:black"> รายการแข่งกีฬาสากล </h2>
                        <table style="text-align:center"  id="example" class="table bg-white table-striped table-bordered border-0 f">
                <thead class="text-white">
                    <tr>
                    	<th>ลําดับ</th>
                        <th> รายการแข่งขัน </th>
                        <th>อัพเดทผลการแข่งขัน</th>
                        <th> เหรียญ </th>
                    </tr>
                </thead>
                <tbody>
         			<%int j=1; for(RegisterActivity a : ac){ %>
         			<% if(a.getPk().getAc().getType().equals("2")) {%>
                    <tr>
                    	<td><%= j %></td>
                        <td><%= a.getPk().getAc().getActivityName()  %></td>
						<td  align="center">
						<a href="updateMedalServlet?aid=<%= a.getPk().getAc().getActivityID() %>"><img src="image/trop.png" height="40px" width="40px"></a>
						</td>
                        <td><%= a.getMedal() %></td>
					</tr>
					<%j++; }} %>
                </tbody>
            </table>
            <h2 class="text-center f" style="color:black"> รายชื่อกิจกรรมทั่วไป </h2>
                        <table style="text-align:center" id="example" class="table bg-white table-striped table-bordered border-0 f">
                <thead class="text-white">
                    <tr>
                    	<th>ลําดับ</th>
                        <th> รายการแข่งขัน </th>
                        <th>อัพเดทผลการแข่งขัน</th>
                        <th> เหรียญ </th>
                    </tr>
                </thead>
                <tbody>
         			<%int k=1; for(RegisterActivity a : ac){ %>
         			<% if(a.getPk().getAc().getType().equals("3")) {%>
                    <tr>
                    	<td><%= k %></td>
                        <td><%= a.getPk().getAc().getActivityName()  %></td>
						<td  align="center">
						<a href="updateMedalServlet?aid=<%= a.getPk().getAc().getActivityID() %>"><img src="image/trop.png" height="40px" width="40px"></a>
						</td>
                        <td><%= a.getMedal() %></td>
					</tr>
					<%k++; }} %>
                </tbody>
            </table>
        </div>
    </div>
</div>     
</body>
</html>
<% } %>