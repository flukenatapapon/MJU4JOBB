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
		RegisManager list = new RegisManager();
		UniversityManager umrg = new UniversityManager();
		String uuaa = umrg.getAllUniversitys(nameU);
		List<Register> r = null;
			 r = list.getAlls(nameU);
		
		
		
%>  
<html>
<head>
<link rel="icon" href="image/logo-2.png" type="image/png" sizes="16x16">
<meta charset="UTF-8">
<title>รายชื่อผู้สมัคร</title>
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
        <h2 class="text-center f" style="color:black"> รายชื่ออาจารย์ </h2>
            <table id="example" class="table bg-white table-striped table-bordered border-0">
                <thead class="text-white">
                    <tr>
                    	
                        <th> ลําดับที่ </th>
                        <th>ชื่อ-สกุล</th>
                        <th>เข้าร่วมตัดสิน</th>
                        <th>ชื่อเล่น </th>
                        <th>เบอร์โทร</th>
                        <th>อาหาร</th>
                        <th>เเก้ไข</th>
                        <th>ลบ</th>
                    </tr>
                </thead>
                <tbody>
                	<%int countT= 0;for(Register re : r){ %>
                	<% List<RegisterActivity> ac = list.getAll(nameU, re.getIdRegister()); %>
                	<% if(re.getType() == 1){ countT++; %>
                    <tr>
                        <td><%= countT %></td>
                        <td><%= re.getPrefix() %> <%= re.getFullName() %></td>
                        <td><% int j=0; for(RegisterActivity acs : ac) { j++;%><%= j+") "+ acs.getPk().getAc().getActivityName()  %><br><% } %></td>

                        <td><%= re.getNickName() %></td>
                        <td><%= re.getPhone() %></td>
                        <td><%= re.getFoodtype() %></td>
                        <td><a href="AdminUpdateTServlet?id=<%=re.getIdRegister()%>"><img alt="" src="image/icon.png" height="25px" width="25px"></a></td>
                       	<td><a onClick="return confirm('แน่ใจหรือไม่ที่จะลบ')" href="DeleteAdminServlet?id=<%= re.getIdRegister()%>"><img alt="" src="image/deleteicon.png" height="25px" width="25px"></a></td>

                    </tr>
                    <%}} %>
                    <tr>
                        <td colspan="8">รวม : <%= countT %></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>          
<div class="container py-4 my-2 fontst">
    <div class="card border-0">
        <div class="card-body m-0 p-0">
        <h2 class="text-center f" style="color:black"> รายชื่อนักศึกษา </h2>
            <table id="example" class="table bg-white table-striped table-bordered border-0">
                <thead class="text-white">
                    <tr>
                        <th> ลําดับที่ </th>
                        <th>ชื่อ-สกุล</th>
                        <th>เข้าร่วมกิจกรรม</th>
                        <th>ชื่อเล่น</th>
                        <th>เบอร์โทร</th>
                        <th>อาหาร</th>
                        <th>เเก้ไข</th>
                        <th>ลบ</th>
                    </tr>
                </thead>
                <tbody>
                <%int i =0;for(Register re : r){ %>
                
                <% List<RegisterActivity> ac = list.getAll(nameU, re.getIdRegister()); %>
                	<% if(re.getType() == 2){i++; %>
                    <tr>
                    	<td><%= i %></td>
                        <td><%= re.getPrefix() %> <%= re.getFullName() %></td>
                        <td><% int j=0;for(RegisterActivity acs : ac) { j++;%><%= j+") "+acs.getPk().getAc().getActivityName()  %><br><% } %></td>
                        <td><%= re.getNickName() %></td>
                        <td><%= re.getPhone() %></td>
                        <td><%= re.getFoodtype() %></td>
                        <td><a href="UpdateAdminSServlet?id=<%=re.getIdRegister()%>"><img alt="" src="image/icon.png" height="25px" width="25px"></a></td>
                        <td><a onClick="return confirm('แน่ใจหรือไม่ที่จะลบ')" href="DeleteAdminServlet?id=<%= re.getIdRegister()%>"><img alt="" src="image/deleteicon.png" height="25px" width="25px"></a></td>

                    </tr>
                 <% }} %>
                 	<tr>
                        <td colspan="8">รวม : <%= i %></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
  		<footer class="footer">
		<div class="container bottom_border">
		<div class="row">

		<div class="container">	
		<!--foote_bottom_ul_amrc ends here-->
		<p class="text-center f">งานประเพณี ๔ จอบเเห่งชาติ ครั้งที่ ๓๗ ณ มหาวิทยาลัยเเม่โจ้</p>
	
		<ul class="social_footer_ul">
		<li><img src="image/01.png" height="60px" width="60px"></li>
		<li><img src="image/ku.png" height="60px" width="60px"></li>
		<li><img src="image/CMU.png" height="60px" width="60px"></li>
		<li><img src="image/ts.png" height="60px" width="60px"></li>
		<li><img src="image/ธรรมศาสตร์.png" height="60px" width="60px"></li>
		<li><img src="image/nu.png" height="60px" width="60px"></li>
		<li><img src="image/mhk.png" height="60px" width="60px"></li>
		<li><img src="image/08.png" height="60px" width="60px"></li>
		<li><img src="image/psu.png" height="60px" width="60px"></li>
		<li><img src="image/อุบล.png" height="60px" width="60px"></li>
		<li><img src="image/ladkrabang.png" height="60px" width="60px"></li>
		<li><img src="image/mju.png" height="60px" width="60px"></li>
		</ul>
		<!--social_footer_ul ends here-->
		</div>
		</div>
		</div>
		</footer> 
</body>
</html>
<% } %>