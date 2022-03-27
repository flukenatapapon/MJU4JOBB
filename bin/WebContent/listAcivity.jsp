<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,controller.*,bean.*,java.text.*" %>
<%
	String login = (String) session.getAttribute("login");
	String u = (String) session.getAttribute("user");
	if(login != null){
		if(u.equals("Admin4Jobb")){
			response.sendRedirect("AdminMenu.jsp");
		}else{
			response.sendRedirect("main.jsp");
		}
		
	}else{
	 ActivityManager acm = new ActivityManager();
	 List<Activity> ac = acm.getActivitys();
	 DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy",new Locale("th", "TH"));  
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="image/logo-2.png" type="image/png" sizes="16x16">
<meta charset="UTF-8">
<title>รายชื่อกิจกรรม</title>
</head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="css/regis.css">
	<link rel="stylesheet" href="css/list.css">
	<script async src="js/jslist.js"></script>
	  
  
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://fonts.googleapis.com/css?family=KoHo:700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Kanit&display=swap" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/fullcss.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/fo.css">
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
      <h1><a href="index.jsp"><img class="responsive-h" src="image/logo.png" height="1000px" width="auto"></a></h1>
    </div>
    <div class="col-md-6">
    <h5>ระบบลงทะเบียนเข้าร่วมงานประเพณี 4 จอบ แห่งชาติ ครั้งที่ 37  </h5>
    </div>
    <div  class="col-md-4">
	 <nav id="nav-menu-container" style="padding-top: 2%; ">
        <ul class="nav-menu">
        <li><a href="index.jsp" style="font-size:15px">หน้าแรก</a></li>
       <li><a href="#" style="font-size:15px">ข้อมูลการลงทะเบียน</a><ul>
             
              <li><a style="font-size:100%" href="AllRegister.jsp">จํานวนผู้สมัครทั้งหมด</a></li>
              <li><a style="font-size:100%" href="listAcivity.jsp">กำหนดการแข่งขัน</a></li>
            </ul>
       </li>
        	<li class="menu-has-children" ><a style="font-size:15px" href="#">ผลการแข่งขัน</a>
            <ul>
             
              <li><a style="font-size:100%" href="MedalResultAll.jsp">รายงานผลการแข่งขัน</a></li>
              <li><a style="font-size:100%" href="ResultAll.jsp">ตารางสรุปผลการแข่งขันทั้งหมด</a></li>
            </ul>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
</header>
 <div class="container py-4 my-2 fontst">
    <div class="card border-0">
        <div class="card-body m-0 p-0">
        <h2 class="text-center f" style="color:black"> กำหนดการแข่งขัน </h2>
            <table id="example" class="table bg-white table-striped table-bordered border-0">
                <thead style="text-align:center" class="text-white">
                    <tr>
                    	
                        <th>  การแข่งขัน </th>
                        <th> วันที่แข่งขัน </th>
                        <th>สถานที่แข่งขัน</th>
                        <th>รายชื่ออาจารย์เข้าร่วมตัดสิน</th>
                        
                    </tr>
                </thead>
                <tbody>
         		
                <%int l =1; for(Activity a : ac) {%>
                <% if(a.getType().equals("1")) { %>
                <% List<Register> re = acm.getActivityTName(a.getActivityID()); %>
                    <tr>
                        <td><a href="StudentListActivity.jsp?id=<%= a.getActivityID() %>&name=<%= a.getActivityName() %>"><%= l %>) <%= a.getActivityName() %></a></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td>
                        <% int j=1; for(Register res : re){ %>
                        <%= j %>) <%= res.getPrefix() %> <%= res.getFullName() %>
                        <br>
                        <% j++;} %>
                        </td>
                    </tr>
                    <% l++; }else{} %>   
                 <% } %>
                                            
                </tbody>
            </table>
        </div>
    </div>
</div>  
 <div class="container py-4 my-2 fontst">
    <div class="card border-0">
        <div class="card-body m-0 p-0">
        <h2 class="text-center f" style="color:black"> ตารางรายชื่อการแข่งขันกีฬาสากล </h2>
            <table id="example" class="table bg-white table-striped table-bordered border-0">
                <thead style="text-align:center" class="text-white">
                    <tr>
                    	
                        <th>  การแข่งขัน </th>
                        <th> วันที่แข่งขัน </th>
                        <th>สถานที่แข่งขัน</th>
                        <th>รายชื่ออาจารย์เข้าร่วมตัดสิน</th>
                        
                    </tr>
                </thead>
                <tbody>
         		
                <%int as =1; for(Activity a : ac) {%>
                <% if(a.getType().equals("2")) { %>
                <% List<Register> re = acm.getActivityTName(a.getActivityID()); %>
                    <tr>
                        <td><a href="StudentListActivity.jsp?id=<%= a.getActivityID() %>&name=<%= a.getActivityName() %>"><%= as %>) <%= a.getActivityName() %></a></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td>
                        <% int j=1; for(Register res : re){ %>
                        <%= j %>) <%= res.getPrefix() %> <%= res.getFullName() %>
                        <br>
                        <% j++; } %>
                        </td>
                    </tr>
                    <%  as++; }else{} %>   
                 <% } %>
                                            
                </tbody>
            </table>
        </div>
    </div>
</div>  
  <div class="container py-4 my-2 fontst">
    <div class="card border-0">
        <div class="card-body m-0 p-0">
        <h2 class="text-center f" style="color:black"> ตารางรายชื่อการแข่งขันทั่วไป </h2>
            <table id="example" class="table bg-white table-striped table-bordered border-0">
                <thead style="text-align:center" class="text-white">
                    <tr>
                    	
                        <th>  การแข่งขัน </th>
                        <th> วันที่แข่งขัน </th>
                        <th>สถานที่แข่งขัน</th>
                        <th>รายชื่ออาจารย์เข้าร่วมตัดสิน</th>
                        
                    </tr>
                </thead>
                <tbody>
         		
                <%int j = 1; for(Activity a : ac) {%>
                <% if(a.getType().equals("3")) { %>
                <% List<Register> re = acm.getActivityTName(a.getActivityID()); %>
                    <tr>
                        <td><a href="StudentListActivity.jsp?id=<%= a.getActivityID() %>&name=<%= a.getActivityName() %>"><%= j %>) <%= a.getActivityName() %></a></td>
                        <td><%= dateFormat.format(a.getMatchDate().getTime()) %></td>
                        <td><%= a.getPlace() %></td>
                        <td>
                        <% int k=1; for(Register res : re){ %>
                        <%= k %>) <%= res.getPrefix()  %> <%= res.getFullName() %>
                        <br>
                        <% k++; } %>
                        </td>
                    </tr>
                    <% j++;  }else{} %>   
                 <% } %>
                                            
                </tbody>
            </table>
        </div>
    </div>
</div>              
</body>
</html>
<% } %>