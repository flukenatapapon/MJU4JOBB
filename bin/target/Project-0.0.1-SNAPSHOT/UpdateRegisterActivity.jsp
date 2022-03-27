<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,controller.*,bean.*" %>
<%
	String login = (String) session.getAttribute("login");
	if(null == login){
		response.sendRedirect("index.jsp");
	}else{
		
		ActivityManager list = new ActivityManager();
		List<Activity> ac = list.getAllActivity();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> รายชื่อกิจกรรม  </title>
    <link href="https://fonts.googleapis.com/css?family=Kanit&display=swap" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/regis.css">
	<link rel="stylesheet" href="css/list.css">
	<script async src="js/jslist.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="css/fullcss.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/fo.css">
<script async src="js/header.js"></script>
</head>
<body>
<header id="header">
    <div class="container">
      <div id="logo" class="pull-left">
        <h1><a href="main.jsp"><img src="image/logo.png" high="80px" width="150px"></a></h1>
      </div>
      <div id="logo" class="pull-left g">
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<img src="image/4job_1.png" high="30px" width="300px" class="responsive"><br><br>
         &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<img src="image/4job_2.png" high="30px" width="300px" class="responsive">&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;
      </div>
      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="main.jsp">หน้าเเรก</a></li>
          <li class="menu-has-children"><a href="#">สมัครเข้าร่วมงาน</a>
            <ul>
              <li><a href="regis.jsp">อาจารย์</a></li>
              <li><a href="regisStudent.jsp">นักศึกษา</a></li>
              <li><a href="#">สังเกตการ</a></li>
            </ul>
          </li>
          <li><a href="UniversityServlet">ออกจากระบบ</a></li>
        </ul>
      </nav>
      </div>
  	</header>
  	
<form action="UpdateActivityServlet" method="post">
 <div class="col-md-12 c" align="center">
 <button class="btn btn-success f" type="button" data-toggle="collapse" data-target="#taksa" aria-expanded="false" aria-controls="taksa"> ทักษะ </button>
<button class="btn btn-success f" type="button" data-toggle="collapse" data-target="#sport" aria-expanded="false"  aria-controls="sport" >กีฬาสากล</button>
<button class="btn btn-success f" type="button" data-toggle="collapse" data-target="#other" aria-expanded="false" aria-controls="other"> กิจกรรมอื่นๆ </button>
</div>
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
                <% int i =1; for(Activity a : ac){ %>
                	<%if(a.getType().equals("1")){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>"></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= a.getMatchDate().getTime() %></td>
                        <td><%= a.getPlace() %></td>
                        <td><%= a.getMaxPerson() %></td>
                    </tr>
                    <% }i++; } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="container py-4 my-2 fontst collapse" id="sport">
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
                     <% int ii =1; for(Activity a : ac){ %>
                	<%if(a.getType().equals("2")){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>"></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= a.getMatchDate().getTime() %></td>
                        <td><%= a.getPlace() %></td>
                        <td><%= a.getMaxPerson() %></td>
                    </tr>
                    <% }ii++; } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="container py-4 my-2 fontst collapse " id="other">
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
                    <% int iii =1; for(Activity a : ac){ %>
                	<%if(a.getType().equals("3")){ %>
                    <tr>
                        <td><input type="checkbox" name="activity" value="<%= a.getActivityID() %>"></td>
                        <td><%= a.getActivityName() %></td>
                        <td><%= a.getMatchDate().getTime() %></td>
                        <td><%= a.getPlace() %></td>
                        <td><%= a.getMaxPerson() %></td>
                    </tr>
                    <% }iii++; } %>
                </tbody>
            </table>
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