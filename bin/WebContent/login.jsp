<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,bean.*,controller.*" %>
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
		String error = (String) request.getAttribute("error");
		Cookie[] cookies = request.getCookies();
		String uname = "";
		String pwd = "";
		for(int i =0;i< cookies.length;i++){
			if("name".equals(cookies[i].getName())){
				uname = cookies[i].getValue();
			}
			if("pw".equals(cookies[i].getName())){
				pwd = cookies[i].getValue();
			}
			
		}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="image/logo-2.png" type="image/png" sizes="16x16">
<meta charset="UTF-8">
<title>เข้าสู่ระบบ</title>
</head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Kanit&display=swap" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=KoHo:700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/fullcss.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/fo.css">
<script src="js/carousel.js"></script>
<link rel="stylesheet" href="css/gall.css">
<script async src="js/header.js"></script>
<script async src="js/gall.js"></script>

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
<div class="container f">
      
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">เข้าสู่ระบบ</h5>
            <form class="form-signin" action="UniversityServlet" method="post">
              <div class="form-label-group">
                <input type="text" id="inputEmail" class="form-control" placeholder="Email address" required value="<%= uname %>" autofocus name="user">
                <label for="inputEmail">ชื่อผู้ใช้</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required value="<%= pwd %>" name="password">
                <label for="inputPassword">รหัสผ่าน</label>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1" name="rememberUser" checked>
                <label class="custom-control-label" for="customCheck1">จดจำชื่อผู้ใช้เเละรหัสผ่าน</label>
              </div>
              <button class="btn btn-lg btn-success btn-block text-uppercase" type="submit">เข้าสู่ระบบ</button><br>
             <% if(null != error){ %>
			&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">* <%= error %></font>
			<%} %>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
 		<footer class="footer ">
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