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
		
		String uni = (String) session.getAttribute("uni");
		
		FacultyManager fc = new FacultyManager();
		List<Faculty> f = fc.getAllFaculty();
		
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Regis</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Kanit&display=swap" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/regis.css">
    <link rel="stylesheet" href="css/fullcss.css">
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/fo.css">
	<script async src="js/header.js"></script>
  </head>
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
  	
    <div class="container fontst col-sm-12 c">
      <div class="row">
        <div class="col-md-6 col-sm-8 col-xs-12 col-md-offset-3 col-sm-offset-2">
          <div class="register-form">
            <form action="SUpdateServlet" method="post">
              <h2 class="text-center" style="color:black"> แบบฟอร์มสมัครเข้าร่วมกิจกรรม (นักศึกษา) </h2>
              <div class="row">
                <div class="col-md-12 col-xs-12">
                 <div class="form-group col-sm-12">
              		<p> เพศ  : </p> 
                	<input type="radio" name="gender" required="required" value="m"> ชาย
                	<input type="radio" name="gender" required="required" value="f"> หญิง 
              	 </div>
              <div class="form-group col-sm-10">
                 <p style="color:black"> ตําแหน่ง : </p> 
                 	<input type="radio" name="position" required="required" value="นักศึกษาทั่วไป"> นักศึกษาทั่วไป
                	<input type="radio" name="position" required="required" value="นายกสโมสร"> นายกสโมสร
                	<input type="radio" name="position" required="required" value="รองนายก"> รองนายก
              </div>
               <br><br><br><br><br><br><br>
                  <div class="form-group col-sm-5">
                    <p style="color:black"> คํานําหน้า : </p> 
                    <select name="prefix" class="form-control">
                    	<option value="นาย"> นาย </option>
                    	<option value="นาง"> นาง </option>
                    	<option value="นางสาว"> นางสาว </option>
                    </select>
                  </div>
                  <div class="form-group col-sm-12">
                    <p style="color:black"> ชื่อ-นามสกุล : </p> 
                    <input type="text" name="fullname" class="form-control" placeholder="ชื่อ-นามสกุล " >
                  </div>
                </div>   
              </div>
              <div class="form-group col-sm-12">
               <p> ชื่อเล่น : </p> 
                <input type="text" name="nickname" class="form-control" placeholder="ชื่อเล่น" >
              </div>
              <div class="form-group col-sm-12">
              <p> เบอร์โทร    : </p> 
                <input type="text" name="tell" class="form-control" placeholder="เบอร์โทร " >
              </div> 
              <div class="form-group col-sm-12" >
              <p> มหาวิทยาลัย  : </p> 
                <input type="text" name="university" class="form-control" values="<%= uni %>" placeholder="<%= uni %>" readonly>
              </div>
              <div class="form-group col-sm-12">
              <p> คณะ  : </p> 
              	<select name="faculty" class="form-control">
              	<% for(Faculty fac : f) {%>
              		<% if(fac.getUniversity().getUniversityName().equals(uni)){ %>
                    	<option value="<%= fac.getIdFaculty() %>"><%= fac.getFacultyName() %> </option>
              	<%} } %> 
              	 </select>
              </div>
              <div class="form-group col-sm-12">
              <p> รูปภาพ </p>
              <input type="file" name="pic" accept="image/*">
              </div>
              <div class="form-group col-sm-12">
              <p> รายละเอียดการเดินทางมามหาวิทยาลัยแม่โจ้  : </p> 
              	<input type="radio" name="travelVehicle" value="รถบัส"> รถบัส
                <input type="radio" name="travelVehicle" value="รถไฟ">  รถไฟ
                <input type="text" name="travelDetail" class="form-control" placeholder=" รายละเอียดการเดินทาง " >
              </div>
              <div class="form-group col-sm-12">
              <p> รายละเอียดการเดินทางกลับ  : </p> 
              	<input type="radio" name="travelBackVehicle" value="รถบัส"> รถบัส
                <input type="radio" name="travelBackVehicle" value="รถไฟ">  รถไฟ
                <input type="text" name="travelBackDetail" class="form-control" placeholder=" รายละเอียดการเดินทาง " >
              </div>
              <div class="form-group col-sm-12">
              <p> อาหาร  : </p> 
              	<input type="radio" name="foodtype" value="ทั่วไป"> ทั่วไป
                <input type="radio" name="foodtype" value="เจ-มังสวิรัติ"> เจ-มังสวิรัติ
                <input type="text" name="foodallegy" class="form-control" placeholder=" อาหารที่แพ้ " >
               </div>      
              <div class="row">
                <div class="col-md-6 col-xs-12">
                  <div class="form-group">
                    <button type="submit" class="btn btn-success form-control " value="">ต่อไป</button>
                  </div>
                </div>
                <div class="col-md-6 col-xs-12">
                  <div class="form-group">
                     <button type="reset" class="btn btn-danger form-control " value="" onclick="history.back()"> ยกเลิก </button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
<% } %>