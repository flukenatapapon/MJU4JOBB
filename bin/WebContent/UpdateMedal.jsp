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
		String nameU = (String) session.getAttribute("uaa");
		UniversityManager umrg = new UniversityManager();
		String uuaa = umrg.getAllUniversitys(nameU);
		String aid = (String) session.getAttribute("aids");
		ActivityManager amrg = new ActivityManager();
		String s = amrg.getAllActivitys(aid);
%> 
<html>
<head>
<link rel="icon" href="image/logo-2.png" type="image/png" sizes="16x16">
<meta charset="UTF-8">
<title>กรอกผลกสรแข่งขัน</title>
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
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/fo.css">
<link rel="stylesheet" href="css/list.css">
<link rel="stylesheet" href="css/regis.css">
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
<br>
<div class="col-md-12 col-sm-12 col-lg-12 container-fluid">
<h1 align="center">เลือกเหรียญรางวัล</h1>
<h2 align="center"><%= uuaa %>  กิจกรรม  <%= s %>   </h2>
	<div class="row">
		
		<div class="col-md-4 col-sm-4 col-lg-4 medal" align="center">
		<h2>เหรียญทอง</h2> 
			<a href="MedalServlet?m=เหรียญทอง" ><img class="one" src="image/goldmedal.png"></a>
			
		</div>
		<div class="col-md-4 col-sm-4 col-lg-4 medal"  align="center">
		<h2>เหรียญเงิน</h2> 
			<a  href="MedalServlet?m=เหรียญเงิน"><img class="one" src="image/silvermedal.png"></a>
		</div>
		<div class="col-md-4 col-sm-4 col-lg-4 medal"  align="center">
		<h2>เหรียญทองแดง</h2> 
			<a href="MedalServlet?m=เหรียญทองแดง"><img class="one"  src="image/bronzemedal.png"></a>
		</div>
	</div>
</div>
<footer class="footer fs ">
		<div class="container bottom_border">
		<div class="row">

		<div class="container">	
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