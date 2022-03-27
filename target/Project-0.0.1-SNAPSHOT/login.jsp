<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,bean.*,controller.*" %>
<%
	String error = (String) request.getAttribute("error");
	String login = (String) session.getAttribute("login");
	if(null != login){
		response.sendRedirect("main.jsp");
	}else{
		
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Kanit&display=swap" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/fullcss.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/fo.css">
<script async src="js/header.js"></script>
<body>
<header id="header">
    <div class="container">
      <div id="logo" class="pull-left">
        <h1><a href="index.jsp"><img src="image/logo.png" high="80px" width="150px"></a></h1>
      </div>
      <div id="logo" class="pull-left g">
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<img src="image/4job_1.png" high="30px" width="300px" class="responsive"><br><br>
         &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<img src="image/4job_2.png" high="30px" width="300px" class="responsive">&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;
      </div>
      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li><a href="index.jsp">หน้าเเรก</a></li>
          <li class="menu-active"><a href="login.jsp">เข้าสู่ระบบ</a></li>
        </ul>
      </nav>
      </div>
  	</header>
 
  
<div class="container f c">
      
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
 		<footer class="footer c">
		<div class="container bottom_border">
		<div class="row">

		<div class="container">	
		<!--foote_bottom_ul_amrc ends here-->
		<p class="text-center f">งานประเพณี ๔ จอบเเห่งชาติ ครั้งที่ ๓๗ ณ. มหาวิทยาลัยเเม่โจ้</p>
	
		<ul class="social_footer_ul">
		<li><img src="image/01.png" high="60px" width="60px"></li>
		<li><img src="image/mju.png" high="60px" width="60px"></li>
		<li><img src="image/CMU.png" high="60px" width="60px"></li>
		<li><img src="image/ku.png" high="60px" width="60px"></li>
		<li><img src="image/ladkrabang.png" high="60px" width="60px"></li>
		<li><img src="image/mhk.png" high="60px" width="60px"></li>
		<li><img src="image/nu.png" high="60px" width="60px"></li>
		<li><img src="image/psu.png" high="60px" width="60px"></li>
		<li><img src="image/silapakorn.png" high="60px" width="60px"></li>
		<li><img src="image/ts.png" high="60px" width="60px"></li>
		<li><img src="image/ธรรมศาสตร์.png" high="60px" width="60px"></li>
		<li><img src="image/อุบล.png" high="60px" width="60px"></li>
		</ul>
		<!--social_footer_ul ends here-->
		</div>
		</div>
		</div>
		</footer>
</body>
</html>
<% } %>