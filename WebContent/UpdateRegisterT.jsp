<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,controller.*,bean.*" %>
<%
response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.addHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%
	String login = (String) session.getAttribute("login");
	if(null == login){
		response.sendRedirect("index.jsp");
	}else{
		String u = (String) session.getAttribute("user");
		if(u.equals("Admin4Jobb")){
			response.sendRedirect("AdminMenu.jsp");
		}		
		ActivityManager list = new ActivityManager();
		List<Activity> ac = list.getAllActivity();
		
		String uni = (String) session.getAttribute("uni");
		String id = (String) session.getAttribute("uid");
		String user = (String) session.getAttribute("user");
		FacultyManager fc = new FacultyManager();
		List<Faculty> f = fc.getAllFaculty();
		RegisManager mg = new RegisManager();
		
		
		Register re =mg.getAllsss(user, id);
		Register regis = mg.getAllss(user, id);
		String path = request.getServletContext().getRealPath("/")+"Upload\\" ; 
%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <link rel="icon" href="image/logo-2.png" type="image/png" sizes="16x16">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> แก้ไขรายชื่อ อ</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Kanit&display=swap" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=KoHo:700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Kanit&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <script>
var loadFile = function(event) {
	var image = document.getElementById('output');
	image.src = URL.createObjectURL(event.target.files[0]);
};
</script>  
  	<link rel="stylesheet" href="css/regis.css">
    <link rel="stylesheet" href="css/fullcss.css">
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
      <h1><a href="main.jsp"><img class="responsive-h" src="image/logo.png" height="1000px" width="auto"></a></h1>
    </div>
    <div class="col-md-6">
    <h5 style="font-size:18px">ระบบลงทะเบียนเข้าร่วมงานประเพณี 4 จอบ แห่งชาติ ครั้งที่ 37  </h5>
    </div>
    <div  class="col-md-4">
	   <nav id="nav-menu-container" style="padding-top: 2%;">
        <ul class="nav-menu">
        <li><a href="main.jsp" style="font-size:100%">หน้าหลัก</a></li>
         <li class="menu-has-children menu-active" ><a style="font-size:100%" href="#">สมัครเข้าร่วมงาน</a>
            <ul>
              <li><a style="font-size:100%" href="regis.jsp">อาจารย์</a></li>
              <li><a style="font-size:100%" href="regisStudent.jsp">นักศึกษา</a></li>
            </ul>
          </li>
           <li><a style="font-size:100%" href="UniversityServlet"> ออกจากระบบ </a></li>
        </ul>
      </nav>
    </div>
  </div>
</div>
</header>
   <div class="col-md-2"></div>
    <div class="container fontst col-sm-8 ">
      <div class="row">
        <div class="col-md-10" style="margin-left:8%;">
          <div class="register-form">
            <form action="UpdateRegisterServlet" style=" margin:0 auto; " method="post" enctype="multipart/form-data">
			<h2 class="text-center" style="color:black"> แบบฟอร์มสมัครเข้าร่วมกิจกรรม (อาจารย์) </h2>
              <div class="row">
                <div class="col-md-12 col-xs-12">
                  <div class="form-group col-md-2">
                    <p style="color:black"> คํานําหน้า : </p> 
                   <input class="form-control" type="text" list="cars" name="prefix" value="<%= re.getPrefix() %>">
						<datalist id="cars" >
							<option value=""> กรุณาเลือก </option>
							<option value="นาย"> นาย</option>
							<option value="นาง"> นาง </option>
							<option value="นางสาว"> นางสาว </option>
							<option value="อาจารย์"> อาจารย์ </option>
							<option value="อาจารย์ ดร."> อาจารย์ ดร. </option>
							<option value="ผู้ช่วยศาสตราจารย์"> ผู้ช่วยศาสตราจารย์ </option>
							<option value="รองศาสตราจารย์ "> รองศาสตราจารย์ </option>
							<option value="ศาสตราจารย์"> ศาสตราจารย์ </option>
							<option value="ผู้ช่วยศาสตราจารย์ ดร."> ผู้ช่วยศาสตราจารย์ ดร. </option>
							<option value="รองศาสตราจารย์ ดร."> รองศาสตราจารย์ ดร.</option>
							<option value="ศาสตราจารย์ ดร."> ศาสตราจารย์ ดร. </option>
						</datalist> 
                  </div>
                  <div class="form-group col-md-6">
                    <p style="color:black"> ชื่อ-นามสกุล : </p> 
                    <input type="text" name="fullname" class="form-control" value="<%= re.getFullName() %>" placeholder="ชื่อ-นามสกุล " >
                  </div>
                </div>   
              </div>
              <div class="row">
              <div class="col-md-12 col-xs-12">
              <div class="form-group  col-sm-2">
               <p style="color:black"> ชื่อเล่น : </p> 
                <input type="text" name="nickname" value="<%= re.getNickName() %>" class="form-control" placeholder="ชื่อเล่น" >
              </div>
              </div>
              </div>
              <div class="row">
              <div class="col-md-12 col-xs-12">
              <div class="form-group col-sm-12">
              		<p style="color:black"> เพศ  : </p> 
              		<% if(re.getGender().equals("m")){ %>
                	<input type="radio" name="gender" required="required" value="m" checked> ชาย
                	<input type="radio" name="gender" required="required" value="f"> หญิง 
                	<% }else{ %>
                	<input type="radio" name="gender" required="required" value="m"> ชาย
                	<input type="radio" name="gender" required="required" value="f" checked> หญิง 
                	<% } %>
              	 </div></div></div>
              	 <div class="row">
              <div class="col-md-12 col-xs-12">
              	 <div class="form-group col-md-6">
                 <p style="color:black"> ตําแหน่งบริหาร : </p> 
                 <input class="form-control" type="text" list="cars" name="position" value="<%= re.getPosition() %>">
						<datalist id="cars" >
							<option value=""> กรุณาเลือก </option>
							<option value="อธิการบดี"> อธิการบดี </option>
							<option value="รองอธิการบดี"> รองอธิการบดี </option>
							<option value="ผู้ช่วยอธิการบดี"> ผู้ช่วยอธิการบดี </option>
							<option value="คณบดี"> คณบดี </option>
							<option value="รองคณบดี"> รองคณบดี </option>
							<option value="ผู้ช่วยคณบดี"> ผู้ช่วยคณบดี </option>
						</datalist> 
				<p style = "color:red; font-size:100%;"> **กรณีที่ไม่มีตําแหน่งบริหารไม่ต้องเลือกฟิลด์นี้ </p>
              	</div></div></div>
              	<div class="row">
              <div class="col-md-12 col-xs-12">
              <div class="form-group col-sm-3">
              <p style="color:black"> เบอร์โทร    : </p> 
                <input type="text" name="tell" value="<%= re.getPhone() %>" class="form-control" placeholder="เบอร์โทร " >
              </div></div></div>
              <div class="row">
              <div class="col-md-12 col-xs-12"> 
              <div class="form-group col-sm-4" >
              <p style="color:black"> มหาวิทยาลัย  : </p> 
                <input type="text" name="university" class="form-control" values="<%= uni %>" placeholder="<%= uni %>" readonly>
              </div>
              <div class="form-group col-sm-4">
              <p style="color:black"> คณะ  : </p>
              	<select name="faculty" class="form-control">
              	<% for(Faculty fac : f) {%>
              		<% if(fac.getUniversity().getUniversityName().equals(uni) && fac.getIdFaculty().equals(regis.getFaculty().getIdFaculty())){ %>
                    	<option value="<%= fac.getIdFaculty() %>" selected><%= fac.getFacultyName() %> </option>
                   <% }else if(fac.getUniversity().getUniversityName().equals(uni)){ %> 
                   <option value="<%= fac.getIdFaculty() %>"><%= fac.getFacultyName() %> </option>	
              	<%} } %> 
              	 </select>
              </div></div></div>
              <div class="row">
              <div class="col-md-12 col-xs-12">
              <div class="form-group col-sm-12">
              <p style="color:black"> รูปภาพสำหรับติดบัตร   <span style="color:red">* อัตราส่วนที่เหมาะสม กว้าง 1 นิ้ว สูง 1.5 นิ้ว</span> </p>
              <input type="file" name="pic" accept="image/*" onchange="loadFile(event)" value="<%= path+re.getImage() %>">
              <img id="output" height="200px" width="150px" src="Upload/<%= re.getImage() %>">
              </div>
              </div></div>
              <div class="row">
              <div class="col-md-12 col-xs-12">
              <div class="form-group col-sm-8">
              <p style="color:black">  การเดินทาง : </p> 
              	<% if(re.getTravel().equals("ให้ไปรับ")){ %>
                <input type="radio" name="travelType"  value="ให้ไปรับ" checked>ให้ไปรับ
                <input type="radio" name="travelType" value="ไม่ต้องไปรับ">  ไม่ต้องไปรับ
                <% }else{ %>
                <input type="radio" name="travelType"  value="ให้ไปรับ" >ให้ไปรับ
                <input type="radio" name="travelType" value="ไม่ต้องไปรับ" checked>ไม่ต้องไปรับ
                <% } %>
              </div></div></div>
              <div class="row">
              <div class="col-md-12 col-xs-12"> 
              <div class="form-group col-sm-8">
              <p style="color:black">  รายละเอียดการเดินทางมามหาวิทยาลัยแม่โจ้  : </p>
              <% if(re.getTraveling().equals("รถยนต์ส่วนตัว")){ %> 
              	<input type="radio" name="travelVehicle" checked value="รถยนต์ส่วนตัว">  รถยนต์ส่วนตัว
                <input type="radio" name="travelVehicle" value="รถไฟ">  รถไฟ
                <input type="radio" name="travelVehicle" value="รถทัวร์">  รถทัวร์
                <input type="radio" name="travelVehicle" value="เครื่องบิน"> เครื่องบิน
                <% }else if(re.getTraveling().equals("รถไฟ")){ %>
                <input type="radio" name="travelVehicle" value="รถยนต์ส่วนตัว">  รถยนต์ส่วนตัว
                <input type="radio" name="travelVehicle" checked value="รถไฟ">  รถไฟ
                <input type="radio" name="travelVehicle" value="รถทัวร์">  รถทัวร์
                <input type="radio" name="travelVehicle" value="เครื่องบิน"> เครื่องบิน
                <% }else if(re.getTraveling().equals("รถทัวร์")){ %>
                <input type="radio" name="travelVehicle" value="รถยนต์ส่วนตัว">  รถยนต์ส่วนตัว
                <input type="radio" name="travelVehicle" value="รถไฟ">  รถไฟ
                <input type="radio" name="travelVehicle" checked value="รถทัวร์">  รถทัวร์
                <input type="radio" name="travelVehicle" value="เครื่องบิน"> เครื่องบิน
                <%}else{ %>
                <input type="radio" name="travelVehicle" value="รถยนต์ส่วนตัว">  รถยนต์ส่วนตัว
                <input type="radio" name="travelVehicle" value="รถไฟ">  รถไฟ
                <input type="radio" name="travelVehicle" value="รถทัวร์">  รถทัวร์
                <input type="radio" name="travelVehicle" checked value="เครื่องบิน"> เครื่องบิน
                <% } %>
                <textarea rows="4" cols="50" name="travelDetail" class="form-control" placeholder=" รายละเอียดการเดินทาง "><%= re.getTravelDetail() %></textarea>
               <p style="color:red"> *หากต้องการให้ไปรับกรุณากรอกรายละเอียดการเดินทาง </p> 
              </div></div></div>
                            <div class="row">
              <div class="col-md-12 col-xs-12"> 
              <div class="form-group col-sm-8">
              <p style="color:black">  การเดินทางกลับ : </p> 
              <% if(re.getReturns().equals("ให้ไปส่ง")){ %>
                <input type="radio" name="travelTypeR" checked value="ให้ไปส่ง">  ให้ไปส่ง
                <input type="radio" name="travelTypeR" value="ไม่ต้องไปส่ง">  ไม่ต้องไปส่ง
                <% }else{ %>
                <input type="radio" name="travelTypeR" value="ให้ไปส่ง">  ให้ไปส่ง
                <input type="radio" name="travelTypeR" checked value="ไม่ต้องไปส่ง">  ไม่ต้องไปส่ง
                <% } %>
              </div> 
              <div class="form-group col-sm-8">
              <p> รายละเอียดการเดินทางกลับ : </p> 
              	<% if(re.getReturning().equals("รถยนต์ส่วนตัว")){ %> 
              	<input type="radio" name="travelVehicleR" checked value="รถยนต์ส่วนตัว">  รถยนต์ส่วนตัว
                <input type="radio" name="travelVehicleR" value="รถไฟ">  รถไฟ
                <input type="radio" name="travelVehicleR" value="รถทัวร์">  รถทัวร์
                <input type="radio" name="travelVehicleR" value="เครื่องบิน"> เครื่องบิน
                <% }else if(re.getReturning().equals("รถไฟ")){ %>
                <input type="radio" name="travelVehicleR" value="รถยนต์ส่วนตัว">  รถยนต์ส่วนตัว
                <input type="radio" name="travelVehicleR" checked value="รถไฟ">  รถไฟ
                <input type="radio" name="travelVehicleR" value="รถทัวร์">  รถทัวร์
                <input type="radio" name="travelVehicleR" value="เครื่องบิน"> เครื่องบิน
                <% }else if(re.getReturning().equals("รถทัวร์")){ %>
                <input type="radio" name="travelVehicleR" value="รถยนต์ส่วนตัว">  รถยนต์ส่วนตัว
                <input type="radio" name="travelVehicleR" value="รถไฟ">  รถไฟ
                <input type="radio" name="travelVehicleR" checked value="รถทัวร์">  รถทัวร์
                <input type="radio" name="travelVehicleR" value="เครื่องบิน"> เครื่องบิน
                <%}else{ %>
                <input type="radio" name="travelVehicleR" value="รถยนต์ส่วนตัว">  รถยนต์ส่วนตัว
                <input type="radio" name="travelVehicleR" value="รถไฟ">  รถไฟ
                <input type="radio" name="travelVehicleR" value="รถทัวร์">  รถทัวร์
                <input type="radio" name="travelVehicleR" checked value="เครื่องบิน"> เครื่องบิน
                <% } %>
 				<textarea rows="4" cols="50" name="travelDetailR" class="form-control" placeholder=" รายละเอียดการเดินทาง "><%= re.getReturndetail() %></textarea>
              </div></div></div>
                            <div class="row">
              <div class="col-md-12 col-xs-12"> 
              <div class="form-group col-sm-8">
              <p style="color:black"> อาหาร  : </p>
                <% if(re.getFoodtype().equals("ทั่วไป")) {%>
              	<input type="radio" name="foodtype" checked value="ทั่วไป"> ทั่วไป
                <input type="radio" name="foodtype" value="เจ-มังสวิรัติ"> เจ-มังสวิรัติ
                <input type="radio" name="foodtype" value="อิสลาม">อิสลาม 
               <%}else if(re.getFoodtype().equals("เจ-มังสวิรัติ")){ %>
              	<input type="radio" name="foodtype"  value="ทั่วไป"> ทั่วไป
                <input type="radio" name="foodtype" checked value="เจ-มังสวิรัติ"> เจ-มังสวิรัติ
                <input type="radio" name="foodtype" value="อิสลาม">อิสลาม 
               <% }else{ %>
               	<input type="radio" name="foodtype"  value="ทั่วไป"> ทั่วไป
                <input type="radio" name="foodtype" value="เจ-มังสวิรัติ"> เจ-มังสวิรัติ
                <input type="radio" name="foodtype" checked value="อิสลาม">อิสลาม 
               <% } %>
                <input type="text" name="foodallegy" value="<%= re.getFoodallergy() %>" class="form-control" placeholder=" อาหารที่แพ้ " >
               
              </div></div></div>      
              <div class="row">
                <div class="col-md-4 col-xs-6">
                  <div class="form-group">
                    <button type="submit" class="btn btn-success form-control " value="">ต่อไป</button>
                  </div>
                </div>
                <div class="col-md-4 col-xs-6">
                  <div class="form-group">
                    <button type="reset" class="btn btn-danger form-control" value="" onclick="history.back()"> ยกเลิก </button>
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