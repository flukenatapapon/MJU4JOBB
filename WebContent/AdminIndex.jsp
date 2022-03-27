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
		String user = (String) session.getAttribute("user");
		UniversityManager um = new UniversityManager();
		List<University> u = um.getAllUniversity();
		
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
	<h1 align="center"> รายชื่อมหาวิทยาลัย </h1>
	<div class="col-sm-12 col-md-12 col-lg-12 fd">
		<div class="row">
			<div align="center" class="col-md-4 col-sm-2 container">
				<a href="AdminServlet?unis=KU"><img class="one"  src="image/01.png" height="auto " width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยเกษตรศาสตร์</h3>
			</div>
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=KKU"><img class="one" src="image/ku.png" height="auto" width="auto"></a>
				<h3>มหาวิทยาลัยขอนแก่น</h3>
			</div>
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=CMU"><img class="one" src="image/CMU.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยเชียงใหม่</h3>
			</div>
		</div>
		<div class="row">
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=TSU"><img class="one" src="image/ts.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยทักษิน</h3>
			</div>
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=TU"><img class="one" src="image/ธรรมศาสตร์.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยธรรมศาสตร์</h3>
			</div>
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=NU"><img class="one" src="image/nu.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยนเรศวร</h3>
			</div>			
		</div>
		<div class="row">
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=MSU"><img class="one" src="image/mhk.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยมหาสารคราม</h3>
			</div>
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=SU"><img class="one" src="image/08.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยศิลปากร</h3>
			</div>
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=PSU"><img class="one" src="image/psu.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยสงขลานครินทร์</h3>
			</div>			
		</div>
		<div class="row">
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=UBU"><img class="one" src="image/อุบล.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยอุบลราชธานี</h3>
			</div>
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=KMITL"><img  class="one" src="image/ladkrabang.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</h3>
			</div>
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=MJU"><img class="one" src="image/mju.png" height="120px" width="120px"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยแม่โจ้</h3>
			</div>			
		</div>
		<div class="row">
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=UP"><img class="one" src="image/payao1.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยพะเยา</h3>
			</div>
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=MAHIDOL"><img  class="one" src="image/mahidol1.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยมหิดล</h3>
			</div>	
			<div align="center" class="col-md-4 col-sm-2">
				<a href="AdminServlet?unis=NPU"><img  class="one" src="image/npu.png" height="auto" width="auto"></a>
				<h3 style="padding-top: 5px">มหาวิทยาลัยนครพนม </h3>
			</div>
			<div class="col-md-3 col-sm-2"></div>
		</div>		
	</div>

</body>
</html>
<% } %>