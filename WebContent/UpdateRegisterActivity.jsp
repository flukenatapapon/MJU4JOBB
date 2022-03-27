<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,controller.*,bean.*,java.text.*" %>
<%
	String login = (String) session.getAttribute("login");
	if(null == login){
		response.sendRedirect("index.jsp");
	}else{
		String u = (String) session.getAttribute("user");
		if(u.equals("Admin4Jobb")){
			response.sendRedirect("AdminMenu.jsp");
		}		
		ActivityManager list = new ActivityManager();
		List<Activity> ac = list.getAllActivity();
		String id = (String) session.getAttribute("uid");
		String user = (String) session.getAttribute("user");
		String ty = (String) session.getAttribute("typee");
		RegisManager lists = new RegisManager();
		List<Register> r = lists.getAlls(user);
		List<RegisterActivity> acc = lists.getAll(user, id);
		int cu = 0;
		String c = (String) session.getAttribute("chhss");
		session.removeAttribute("chhss");
		DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy hh:mm",new Locale("th", "TH")); 
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="image/logo-2.png" type="image/png" sizes="16x16">
<meta charset="UTF-8">
<title> รายชื่อกิจกรรม  </title>
    <link href="https://fonts.googleapis.com/css?family=Kanit&display=swap" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/regis.css">
	<link rel="stylesheet" href="css/list.css">
	<script async src="js/jslist.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=KoHo:700&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="css/fullcss.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/fo.css">
<script async src="js/header.js"></script>
</head>
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
      <h1><a href="main.jsp"><img class="responsive-h" src="image/logo.png" height="1000px" width="auto"></a></h1>
    </div>
    <div class="col-md-6">
    <h5>ระบบลงทะเบียนเข้าร่วมงานประเพณี 4 จอบ แห่งชาติ ครั้งที่ 37  </h5>
    </div>
    <div  class="col-md-4">
	   <nav id="nav-menu-container" style="padding-top: 2%;">
        <ul class="nav-menu">
        <li><a href="main.jsp" style="font-size:100%">หน้าหลัก</a></li>
         <li class="menu-has-children menu-active" ><a style="font-size:100%" href="#">สมัครเข้าร่วมงาน</a>
            <ul>
              <li><a style="font-size:100%" href="regis.jsp">อาจารย์</a></li>
              <li><a style="font-size:100%" href="regisStudent.jsp">นักศึกษา</a></li>
            </ul>
          </li>
           <li><a style="font-size:100%" href="UniversityServlet"> ออกจากระบบ </a></li>
        </ul>
      </nav>
    </div>
  </div>
</div>
</header>
<form action="UpdateActivityServlet" method="post">
<div class="container py-4 my-2 fontst fade show active " id="taksa">
    <div class="card border-0">
        <div class="card-body m-0 p-0 ">
        <h2 class="text-center fontst" style="color:black">รายชื่อกิจกรรมทักษะ </h2>
            <table id="example" class="table bg-white table-striped table-bordered border-0">
                <thead class="text-white">
                    <tr>
                        <th> # </th>
                        <th> กิจกรรม </th>
                        <th> เวลาและวันที่แข่งขัน </th>
                        <th> สถานที่แข่งขัน </th>
                        <th> จํานวนผู้เข้าแข่งขัน  </th>
                    </tr>
                </thead>
                <tbody>
                <%for(Activity a : ac){  int maxA = list.maxActivity(user, a.getActivityID()); %>
                	<% if(ty.equals("1")) {%>
                		
                		<% for(RegisterActivity acs : acc) {%>
							<% if(acs.getPk().getAc().getActivityID().equals(a.getActivityID())){ %>
								<% cu = 1; %>
							<%} %>			
                		<% } %>
               
                	<%if(a.getType().equals("1") && cu ==1){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>" checked></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td><%= a.getMaxPerson() %></td>
                    </tr>
                    <% cu =0; }else if(a.getType().equals("1")){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>"></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td><%= a.getMaxPerson() %></td>
                    </tr>
                	<%cu =0; }cu =0;  %>
                		
                	<%}else{ %>
                		
                		<% for(RegisterActivity acs : acc) {%>
							<% if(acs.getPk().getAc().getActivityID().equals(a.getActivityID())){ %>
								<% cu = 1; %>
							<%} %>			
                		<% } %>
               
                	<%if(a.getType().equals("1") && cu ==1){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>" checked></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td  align="center"><%= maxA %>/<%= a.getMaxPerson() %></td>
                    </tr>
                    <% cu =0; }else if(a.getType().equals("1") && maxA >= a.getMaxPerson()){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>" disabled></td>
                        <td><%= a.getActivityName() %> <p style="color:red"> จำนวนคนเต็มเเล้ว </p></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td  align="center"><%= maxA %>/<%= a.getMaxPerson() %></td>
                    </tr>
                	<%cu =0; }else if(a.getType().equals("1")){cu =0;  %>
                	<tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>"></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td  align="center"><%= maxA %>/<%= a.getMaxPerson() %></td>
                    </tr>
                	<%}cu =0; %>
                		
                	<%}} %>	
                </tbody>
            </table>
            <% if(c != null){ %>
             <p align="left" style="color:red">**สําหรับบุคลากรเลือกทักษะเข้าร่วมตัดสิน</p>
             <% }else{ %>
             <p align="left" style="color:red">**สําหรับนิสิตนักศึกษาเลือกทักษะเข้าร่วมแข่งขัน</p>
             <% } %>
        </div>
    </div>
</div>

<div class="container py-4 my-2 fontst " id="sport">
    <div class="card border-0">
        <div class="card-body m-0 p-0">
        <h2 class="text-center fontst" style="color:black"> รายชื่อกิจกรรมกีฬาสากล </h2>
            <table id="example" class="table bg-white table-striped table-bordered border-0">
                <thead class="text-white">
                    <tr>
                        <th> # </th>
                        <th> กิจกรรม </th>
                        <th> เวลาและวันที่แข่งขัน </th>
                        <th> สถานที่แข่งขัน </th>
                        <th> จํานวนผู้เข้าแข่งขัน  </th>
                    </tr>
                </thead>
                <tbody>
                                     <%for(Activity a : ac){  int maxA = list.maxActivity(user, a.getActivityID()); %>
                	<% if(ty.equals("1")) {%>
                		
                		<% for(RegisterActivity acs : acc) {%>
							<% if(acs.getPk().getAc().getActivityID().equals(a.getActivityID())){ %>
								<% cu = 1; %>
							<%} %>			
                		<% } %>
               
                	<%if(a.getType().equals("2") && cu ==1){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>" checked></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td><%= a.getMaxPerson() %></td>
                    </tr>
                    <% cu =0; }else if(a.getType().equals("2")){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>"></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td><%= a.getMaxPerson() %></td>
                    </tr>
                	<%cu =0; }cu =0;  %>
                		
                	<%}else{ %>
                		
                		<% for(RegisterActivity acs : acc) {%>
							<% if(acs.getPk().getAc().getActivityID().equals(a.getActivityID())){ %>
								<% cu = 1; %>
							<%} %>			
                		<% } %>
               
                	<%if(a.getType().equals("2") && cu ==1){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>" checked></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td  align="center"><%= maxA %>/<%= a.getMaxPerson() %></td>
                    </tr>
                    <% cu =0; }else if(a.getType().equals("2") && maxA >= a.getMaxPerson()){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>" disabled></td>
                        <td><%= a.getActivityName() %> <p style="color:red"> จำนวนคนเต็มเเล้ว </p></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td  align="center"><%= maxA %>/<%= a.getMaxPerson() %></td>
                    </tr>
                	<%cu =0; }else if(a.getType().equals("2")){cu =0;  %>
                	<tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>"></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td  align="center"><%= maxA %>/<%= a.getMaxPerson() %></td>
                    </tr>
                	<%}cu =0; %>
                		
                	<%}} %>	
                </tbody>
            </table>
             <% if(c != null){ %>
            <p align="left" style="color:red">**สําหรับบุคลากรเลือกกีฬาสากลเข้าร่วมตัดสิน</p>
            <% }else{ %>
             <p align="left" style="color:red">**สําหรับนิสิตนักศึกษาเลือกกีฬาสากลเข้าร่วมแข่งขัน</p>
            <% } %>
        </div>
    </div>
</div>
<div class="container py-4 my-2 fontst" id="other">
    <div class="card border-0">
        <div class="card-body m-0 p-0">
        <h2 class="text-center fontst" style="color:black"> รายชื่อกิจกรรมทั่วไป </h2>
            <table id="example" class="table bg-white table-striped table-bordered border-0">
                <thead class="text-white">
                    <tr>
                        <th> # </th>
                        <th> กิจกรรม </th>
                        <th> เวลาและวันที่แข่งขัน </th>
                        <th> สถานที่แข่งขัน </th>
                        <th> จํานวนผู้เข้าแข่งขัน  </th>
                    </tr>
                </thead>
                <tbody>
                                    <%for(Activity a : ac){  int maxA = list.maxActivity(user, a.getActivityID()); %>
                	<% if(ty.equals("1")) {%>
                		
                		<% for(RegisterActivity acs : acc) {%>
							<% if(acs.getPk().getAc().getActivityID().equals(a.getActivityID())){ %>
								<% cu = 1; %>
							<%} %>			
                		<% } %>
               
                	<%if(a.getType().equals("3") && cu ==1){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>" checked></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td><%= a.getMaxPerson() %></td>
                    </tr>
                    <% cu =0; }else if(a.getType().equals("3")){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>"></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td><%= a.getMaxPerson() %></td>
                    </tr>
                	<%cu =0; }cu =0;  %>
                		
                	<%}else{ %>
                		
                		<% for(RegisterActivity acs : acc) {%>
							<% if(acs.getPk().getAc().getActivityID().equals(a.getActivityID())){ %>
								<% cu = 1; %>
							<%} %>			
                		<% } %>
               
                	<%if(a.getType().equals("3") && cu ==1){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>" checked></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                       <td  align="center"><%= maxA %>/<%= a.getMaxPerson() %></td>
                    </tr>
                    <% cu =0; }else if(a.getType().equals("3") && maxA >= a.getMaxPerson()){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>" disabled></td>
                        <td><%= a.getActivityName() %> <p style="color:red"> จำนวนคนเต็มเเล้ว </p></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td  align="center"><%= maxA %>/<%= a.getMaxPerson() %></td>
                    </tr>
                	<%cu =0; }else if(a.getType().equals("3")){cu =0;  %>
                	<tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>"></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td  align="center"><%= maxA %>/<%= a.getMaxPerson() %></td>
                    </tr>
                	<%}cu =0; %>
                		
                	<%}} %>	
                </tbody>
            </table>
            <% if(c != null) {%>
            <p align="left" style="color:red">**สําหรับบุคลากรเลือกเข้าร่วมตัดสิน</p>
             <% }else{ %>
             <p align="left" style="color:red">**สําหรับนิสิตนักศึกษาเลือกทักษะเข้าร่วมแข่งขัน</p>
             <% } %>
        </div>
    </div>
</div><br>
<div align="center">
 <div class="col-md-6 col-xs-6">
     <div class="form-group">
           <input type="submit" value="ยืนยัน" class="btn btn-success btn-block btn-lg f" tabindex="6">
      </div>
</div>
<div class="col-md-6 col-xs-6">
   <div class="form-group">
          <input type="reset" value="ยกเลิก" class="btn btn-danger btn-block btn-lg f" tabindex="7" onclick="history.back()">
   </div>
 </div>
</div>
</form>
</body>
</html>
<% } %>