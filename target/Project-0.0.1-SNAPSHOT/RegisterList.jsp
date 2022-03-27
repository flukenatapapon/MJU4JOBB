<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,controller.*,bean.*" %>
<%
	String login = (String) session.getAttribute("login");
	if(null == login){
		response.sendRedirect("index.jsp");
	}else{
		ListStuManager list = new ListStuManager();
		List<Register> r = list.getAllRegister();
		
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>รายชื่ออาจารย์</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Kanit&display=swap" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/regis.css">
	<link rel="stylesheet" href="css/list.css">
	<script async src="js/jslist.js"></script>
	  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Kanit&display=swap" rel="stylesheet">
	
</head>
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
        <h1><a href="main.jsp"><img src="image/logo.png" high="80px" width="150px"></a></h1>
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
          <li><a href="RegisterList.jsp">รายชื่อผู้สมัครเข้าร่วม</a></li>
          <li><a href="UniversityServlet">ออกจากระบบ</a></li>
        </ul>
      </nav>
      </div>
  	</header>
<div class="container py-4 my-2 fontst c">
    <div class="card border-0">
        <div class="card-body m-0 p-0">
        <h2 class="text-center" style="color:black"> รายชื่ออาจารย์ </h2>
            <table id="example" class="table bg-white table-striped table-bordered border-0">
                <thead class="text-white">
                    <tr>
                        <th> ลําดับที่ </th>
                        <th>ชื่อ-สกุล</th>
                        <th>เข้าร่วมกิจกรรม</th>
                        <th> ชื่อเล่น </th>
                        <th> เดินทางมา ม.แม่โจ้ </th>
                        <th> เดินทางกลับสถาบัน </th>
                        <th>เบอร์โทร</th>
                        <th>อาหาร</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                	<%for(Register re : r){ %>
                	<% if(re.getType() == 1){ %>
                    <tr>
                        <td><%= re.getIdRegister() %></td>
                        <td><%= re.getFullName() %></td>
                        <td><%= re.getRegisterAc().size() %></td>
                        <td><%= re.getNickName() %></td>
                        <td><%= re.getTravelDetail() %></td>
                        <td><%= re.getReturndetail() %></td>
                        <td><%= re.getPhone() %></td>
                        <td><%= re.getFoodtype() %></td>
                        <td><a href="UpdateRegisterServlet?id=<%=re.getIdRegister()%>">เเก้ไข</a></td>
                    </tr>
                    <%}} %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="container py-4 my-2 fontst">
    <div class="card border-0">
        <div class="card-body m-0 p-0">
        <h2 class="text-center" style="color:black"> รายชื่อนักศึกษา </h2>
            <table id="example" class="table bg-white table-striped table-bordered border-0">
                <thead class="text-white">
                    <tr>
                        <th> ลําดับที่ </th>
                        <th>ชื่อ-สกุล</th>
                        <th>เข้าร่วมกิจกรรม</th>
                        <th>ชื่อเล่น</th>
                        <th>เบอร์โทร</th>
                        <th>อาหาร</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <%for(Register re : r){ %>
                	<% if(re.getType() == 2){ %>
                    <tr>
                        <td><%= re.getIdRegister() %></td>
                        <td><%= re.getFullName() %></td>
                        <td><%= re.getRegisterAc().size() %></td>
                        <td><%= re.getNickName() %></td>
                        <td><%= re.getPhone() %></td>
                        <td><%= re.getFoodtype() %></td>
                        <td><a href="SUpdateServlet?id=<%=re.getIdRegister()%>">เเก้ไข</a></td>
                    </tr>
                 <% }} %>
                </tbody>
            </table>
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