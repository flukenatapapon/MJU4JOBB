<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,bean.*,controller.*" %>
<%
	String login = (String) session.getAttribute("login");
	if(null != login){
		response.sendRedirect("main.jsp");
	}else{
	
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/fullcss.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/fo.css">
<script async src="js/header.js"></script>


<body>

	<header id="header">
    <div class="container">
      <div id="logo" class="pull-left">
        <h1><a href="index.jsp"><img src="image/logo.png" high="80px" width="150px"  class="img-fluid"></a></h1>
      </div>
      <div id="logo" class="w3-display-middle">
          <img src="image/4job_1.png" high="30px" width="300px"  class="img-fluid"><br><br>
         <img src="image/4job_2.png" high="30px" width="300px"  class="img-fluid">
      </div>
      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="index.jsp">????????????????????????</a></li>
          <li><a href="login.jsp">?????????????????????????????????</a></li>
        </ul>
      </nav>
      </div>
  	</header>


 		<footer class="footer c">
		<div class="container bottom_border">
		<div class="row">

		<div class="container">	
		<!--foote_bottom_ul_amrc ends here-->
		<p class="text-center f">?????????????????????????????? ??? ???????????????????????????????????? ???????????????????????? ?????? ???. ??????????????????????????????????????????????????????</p>
	
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
		<li><img src="image/??????????????????????????????.png" high="60px" width="60px"></li>
		<li><img src="image/????????????.png" high="60px" width="60px"></li>
		</ul>
		<!--social_footer_ul ends here-->
		</div>
		</div>
		</div>
		</footer>
 
		</body>
		</html>
<% } %>