<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,controller.*,bean.*,java.text.*"%>
<%
	String login = (String) session.getAttribute("login");
	String u = (String) session.getAttribute("user");
	if (login != null) {
		if (u.equals("Admin4Jobb")) {
			response.sendRedirect("AdminMenu.jsp");
		} else {
			response.sendRedirect("main.jsp");
		}

	} else {
		ActivityManager acm = new ActivityManager();
		List<Activity> ac = acm.getActivitys();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		List<Register> re = acm.getActivitySName(id);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="image/logo-2.png" type="image/png" sizes="16x16">
<meta charset="UTF-8">
<title>รายชื่อกิจกรรม</title>
<link href="https://fonts.googleapis.com/css?family=Kanit&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=KoHo:700&display=swap"
	rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="css/regis.css">
<link rel="stylesheet" href="css/list.css">
<script async src="js/jslist.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
					<h1>
						<a href="index.jsp"><img class="responsive-h"
							src="image/logo.png" height="1000px" width="auto"></a>
					</h1>
				</div>
				<div class="col-md-6">
					<h5>ระบบลงทะเบียนเข้าร่วมงานประเพณี 4 จอบ แห่งชาติ ครั้งที่ 37
					</h5>
				</div>
				<div class="col-md-4">
					<nav id="nav-menu-container" style="padding-top: 2%;">
						<ul class="nav-menu">
							<li><a href="index.jsp" style="font-size: 15px">หน้าแรก</a></li>
							<li><a href="#" style="font-size: 15px">ข้อมูลการลงทะเบียน</a>
							<ul>

									<li><a style="font-size: 100%" href="AllRegister.jsp">จํานวนผู้สมัครทั้งหมด</a></li>
									<li><a style="font-size: 100%" href="listAcivity.jsp">กำหนดการแข่งขัน</a></li>
								</ul></li>
							<li class="menu-has-children"><a style="font-size: 15px"
								href="#">ผลการแข่งขัน</a>
								<ul>

									<li><a style="font-size: 100%" href="MedalResultAll.jsp">รายงานผลการแข่งขัน</a></li>
									<li><a style="font-size: 100%" href="ResultAll.jsp">ตารางสรุปผลการแข่งขันทั้งหมด</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<div class="container py-4 my-2 fontst fade show active " id="taksa">
		<div class="card border-0">
			<div class="card-body m-0 p-0 ">
				<h2 class="text-center fontst" style="color: black">รายชื่อผู้เข้าเเข่งขัน <%=name%>
				</h2>

				<table id="example"
					class="table bg-white table-striped table-bordered border-0">
					<thead class="text-white">
						<tr>
							<th>มหาวิทยาลัย</th>
							<th>ชื่อ</th>

						</tr>
					</thead>
					<tbody>
						<%
							String uniname = "";
						%>
						<%
						 int j =1;for (int i = 0; i < re.size(); i++) {
									Register res = re.get(i);
						%>
						

							<%
								if (!uniname.equals(res.getFaculty().getUniversity().getUniversityName())) { j = 1;
							%><tr>
							<td><%=res.getFaculty().getUniversity().getUniversityName()%></td>
							<td><%= j %>) <%=res.getPrefix()%><%=res.getFullName()%><br>
								<%
									} else {
								%> <%= j+1 %>) <%=res.getPrefix()%><%=res.getFullName()%><br>

								<%
									if (i == re.size() - 2) {
													String nextuni = re.get(i + 1).getFaculty().getUniversity().getUniversityName();
													if (!nextuni.equals(res.getFaculty().getUniversity().getUniversityName())) {
								%>
							</td>
							<%
								} else {
							%>
							</td></tr>
							<%
								}
											}
							%>
							<%
								}
										uniname = res.getFaculty().getUniversity().getUniversityName();
							%>
						
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
<%
	}
%>