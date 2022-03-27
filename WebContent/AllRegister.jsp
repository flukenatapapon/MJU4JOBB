<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,bean.*,controller.*" %>
<%
	String login = (String) session.getAttribute("login");
	String u = (String) session.getAttribute("user");
	if(null != login){
		if(u.equals("Admin4Jobb")){
			response.sendRedirect("AdminMenu.jsp");
		}else{
			response.sendRedirect("main.jsp");
		}
	}else{	
		RegisManager rmrg = new RegisManager();
		int count = 0;
		int max = 0;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="image/logo-2.png" type="image/png" sizes="16x16">
<meta charset="UTF-8">
<title> รายงานจํานวนผู้เข้าร่วมกิจกรรม </title>
</head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="css/regis.css">
	<link rel="stylesheet" href="css/list.css">
	<script async src="js/jslist.js"></script>
	  
  
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://fonts.googleapis.com/css?family=KoHo:700&display=swap" rel="stylesheet">
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
 <div class="container py-4 my-2 fontst">
    <div class="card border-0">
        <div class="card-body m-0 p-0">
        <h2 class="text-center f" style="color:black"> รายงานจํานวนผู้ลงทะเบียน </h2> 
            <table style="text-align:center"   id="example" class="table bg-white table-striped table-bordered border-0 ">
                <thead  class="text-white">
                    <tr>
                    	
                        <th> โลโก้ </th>
                        <th> มหาวิทยาลัย </th>
                        <th> อาจารย์ </th>
                        <th> นักศึกษา  </th>
                        <th> รวม  </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td ><img src="image/1.png"  style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยเกษตรศาสตร์</td>
                        <td><%= count = rmrg.allRegisT("KU") %></td>
                        <td><%= count = rmrg.allRegisS("KU") %></td>
                        <td><%= max = rmrg.countRegister("KU") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/2.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยขอนแก่น</td>
                        <td><%= count = rmrg.allRegisT("KKU") %></td>
                        <td><%= count = rmrg.allRegisS("KKU") %></td>
                        <td><%= max = rmrg.countRegister("KKU") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/3.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยเชียงใหม่ </td>
                        <td><%= count = rmrg.allRegisT("CMU") %></td>
                        <td><%= count = rmrg.allRegisS("CMU") %></td>
                        <td><%= max = rmrg.countRegister("CMU") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/4.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยทักษิน</td>
                        <td><%= count = rmrg.allRegisT("TSU") %></td>
                        <td><%= count = rmrg.allRegisS("TSU") %></td>
                        <td><%= max = rmrg.countRegister("TSU") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/5.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยธรรมศาสตร์</td>
                        <td><%= count = rmrg.allRegisT("TU") %></td>
                        <td><%= count = rmrg.allRegisS("TU") %></td>
                        <td><%= max = rmrg.countRegister("TU") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/6.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยนเรศวร  </td>
                        <td><%= count = rmrg.allRegisT("NU") %></td>
                        <td><%= count = rmrg.allRegisS("NU") %></td>
                        <td><%= max = rmrg.countRegister("NU") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/7.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยมหาสารคาม</td>
                        <td><%= count = rmrg.allRegisT("MSU") %></td>
                        <td><%= count = rmrg.allRegisS("MSU") %></td>
                        <td><%= max = rmrg.countRegister("MSU") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/8.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยศิลปากร</td>
                        <td><%= count = rmrg.allRegisT("SU") %></td>
                        <td><%= count = rmrg.allRegisS("SU") %></td>
                        <td><%= max = rmrg.countRegister("SU") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/9.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยสงขลานครินทร์</td>
                        <td><%= count = rmrg.allRegisT("PSU") %></td>
                        <td><%= count = rmrg.allRegisS("PSU") %></td>
                        <td><%= max = rmrg.countRegister("PSU") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/10.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยอุบลราชธานี</td>
                        <td><%= count = rmrg.allRegisT("UBU") %></td>
                        <td><%= count = rmrg.allRegisS("UBU") %></td>
                        <td><%= max = rmrg.countRegister("UBU") %></td>
                    </tr>
                    <tr>
                        <td align="center"> <img src="image/11.png" style="width: 70px; height: 70px;"></td>
                        <td>สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</td>
                        <td><%= count = rmrg.allRegisT("KMITL") %></td>
                        <td><%= count = rmrg.allRegisS("KMITL") %></td>
                        <td><%= max = rmrg.countRegister("KMITL") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/12.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยแม่โจ้</td>
                        <td><%= count = rmrg.allRegisT("MJU") %></td>
                        <td><%= count = rmrg.allRegisS("MJU") %></td>
                        <td><%= max = rmrg.countRegister("MJU") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/13.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยพะเยา</td>
                        <td><%= count = rmrg.allRegisT("UP") %></td>
                        <td><%= count = rmrg.allRegisS("UP") %></td>
                        <td><%= max = rmrg.countRegister("UP") %></td>
                    </tr>    
                    <tr>
                        <td align="center"><img  src="image/14.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยมหิดล</td>
                        <td><%= count = rmrg.allRegisT("MAHIDOL") %></td>
                        <td><%= count = rmrg.allRegisS("MAHIDOL") %></td>
                        <td><%= max = rmrg.countRegister("MAHIDOL") %></td>
                    </tr>
                    <tr>
                        <td align="center"><img  src="image/npu.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยนครพนม</td>
                        <td><%= count = rmrg.allRegisT("NPU") %></td>
                        <td><%= count = rmrg.allRegisS("NPU") %></td>
                        <td><%= max = rmrg.countRegister("NPU") %></td>
                    </tr> 
                    <tr>
                    	<td><h3><b>รวม</b></h3></td>
                    	<td></td>
                    	 <td> <h3><b><%= count = rmrg.allRegisT("NPU")+rmrg.allRegisT("MAHIDOL")+rmrg.allRegisT("UP")+rmrg.allRegisT("MJU")+ rmrg.allRegisT("KMITL")+rmrg.allRegisT("UBU")+rmrg.allRegisT("PSU")+rmrg.allRegisT("SU")+rmrg.allRegisT("MSU")+rmrg.allRegisT("NU")+rmrg.allRegisT("TU")+rmrg.allRegisT("TSU")+rmrg.allRegisT("CMU")+rmrg.allRegisT("KKU")+rmrg.allRegisT("KU") %></b></h3></td>
                    	<td>  <h3><b><%= count = rmrg.allRegisS("NPU")+rmrg.allRegisS("MAHIDOL")+rmrg.allRegisS("UP")+rmrg.allRegisS("MJU")+ rmrg.allRegisS("KMITL")+rmrg.allRegisS("UBU")+rmrg.allRegisS("PSU")+rmrg.allRegisS("SU")+rmrg.allRegisS("MSU")+rmrg.allRegisS("NU")+rmrg.allRegisS("TU")+rmrg.allRegisS("TSU")+rmrg.allRegisS("CMU")+rmrg.allRegisS("KKU")+rmrg.allRegisS("KU") %></b></h3></td>
                    	<td>  <h3><b><%= count = rmrg.countRegister("NPU")+rmrg.countRegister("MAHIDOL")+rmrg.countRegister("UP")+rmrg.countRegister("MJU")+ rmrg.countRegister("KMITL")+rmrg.countRegister("UBU")+rmrg.countRegister("PSU")+rmrg.countRegister("SU")+rmrg.countRegister("MSU")+rmrg.countRegister("NU")+rmrg.countRegister("TU")+rmrg.countRegister("TSU")+rmrg.countRegister("CMU")+rmrg.countRegister("KKU")+rmrg.countRegister("KU") %></b></h3></td>
                    </tr>                            
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
<% } %>