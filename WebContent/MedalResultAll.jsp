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

		ActivityManager am = new ActivityManager();
		int[] c = am.getActivityMedalAll("KU");
		int[] c1 = am.getActivityMedalAll("KKU");
		int[] c2 = am.getActivityMedalAll("CMU");
		int[] c3 = am.getActivityMedalAll("TSU");
		int[] c4 = am.getActivityMedalAll("TU");
		int[] c5 = am.getActivityMedalAll("NU");
		int[] c6 = am.getActivityMedalAll("MSU");
		int[] c7 = am.getActivityMedalAll("SU");
		int[] c8 = am.getActivityMedalAll("PSU");
		int[] c9 = am.getActivityMedalAll("UBU");
		int[] c10 = am.getActivityMedalAll("KMITL");
		int[] c11 = am.getActivityMedalAll("MJU");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="image/logo-2.png" type="image/png" sizes="16x16">
<meta charset="UTF-8">
<title>รายงานผลการแข่งขัน</title>
</head>
<style>
.responsive-h {
  width: 70%;
  height: auto;
}

</style>
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

        <h2 class="text-center f" style="color:black"> รายงานผลการแข่งขัน </h2> 
            <table  style="text-align:center; margin-left:auto;" class="table  bg-white table-striped table-bordered border-0">
                <thead class="text-white thead-g">
                    <tr>
                    	
                        <th> โลโก้ </th>
                        <th> มหาวิทยาลัย </th>
                        <th><img src="image/m1.png" style="width: 40px; height: 40px;"></th>
                        <th><img src="image/m2.png" style="width: 40px; height: 40px;"></th>
                        <th><img src="image/m3.png" style="width: 40px; height: 40px;"></th>
                        <th> รวม </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="center"><img src="image/1.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยเกษตรศาสตร์</td>
                        <td><%=  c[0] %></td>
                        <td><%= c[1] %></td>
                        <td><%= c[2] %></td>
                        <td><%= c[0]+c[1]+c[2] %></td>
                    </tr>
                     <tr>
                        <td align="center"><img src="image/2.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยขอนแก่น</td>
  						<td><%=  c1[0] %></td>
                        <td><%= c1[1] %></td>
                        <td><%= c1[2] %></td>
                        <td><%= c1[0]+c1[1]+c1[2] %></td>
                    </tr> 
                    <tr>
                        <td align="center"><img src="image/3.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยเชียงใหม่ </td>
  						<td><%=  c2[0] %></td>
                        <td><%= c2[1] %></td>
                        <td><%= c2[2] %></td>
                        <td><%= c2[0]+c2[1]+c2[2] %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/4.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยทักษิน</td>
  						<td><%=  c3[0] %></td>
                        <td><%= c3[1] %></td>
                        <td><%= c3[2] %></td>
                        <td><%= c3[0]+c3[1]+c3[2] %></td>
                    </tr> 
                    <tr>
                        <td align="center"><img src="image/5.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยธรรมศาสตร์</td>
  						<td><%=  c4[0] %></td>
                        <td><%= c4[1] %></td>
                        <td><%= c4[2] %></td>
                        <td><%= c4[0]+c4[1]+c4[2] %></td>
                    </tr>   
                    <tr>
                        <td align="center"><img src="image/6.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยนเรศวร  </td>
  						<td><%= c5[0] %></td>
                        <td><%= c5[1] %></td>
                        <td><%= c5[2] %></td>
                        <td><%= c5[0]+c5[1]+c5[2] %></td>
                    </tr> 
 					<tr>
                        <td align="center"><img src="image/7.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยมหาสารคาม</td>
  						<td><%=  c6[0] %></td>
                        <td><%= c6[1] %></td>
                        <td><%= c6[2] %></td>
                        <td><%= c6[0]+c6[1]+c6[2] %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/8.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยศิลปากร</td>
  						<td><%=  c7[0] %></td>
                        <td><%= c7[1] %></td>
                        <td><%= c7[2] %></td>
                        <td><%= c7[0]+c7[1]+c7[2] %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/9.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยสงขลานครินทร์</td>
  						<td><%=  c8[0] %></td>
                        <td><%= c8[1] %></td>
                        <td><%= c8[2] %></td>
                        <td><%= c8[0]+c8[1]+c8[2] %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/10.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยอุบลราชธานี</td>
  						<td><%=  c9[0] %></td>
                        <td><%= c9[1] %></td>
                        <td><%= c9[2] %></td>
                        <td><%= c9[0]+c9[1]+c9[2] %></td>
                    </tr>
                    <tr>
                        <td align="center"> <img src="image/11.png" style="width: 70px; height: 70px;"></td>
                        <td>สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</td>
  						<td><%=  c10[0] %></td>
                        <td><%= c10[1] %></td>
                        <td><%= c10[2] %></td>
                        <td><%= c10[0]+c10[1]+c10[2] %></td>
                    </tr>
                    <tr>
                        <td align="center"><img src="image/12.png" style="width: 70px; height: 70px;"></td>
                        <td>มหาวิทยาลัยแม่โจ้</td>
 						<td><%=  c11[0] %></td>
                        <td><%= c11[1] %></td>
                        <td><%= c11[2] %></td>
                        <td><%= c11[0]+c11[1]+c11[2] %></td>
                    </tr>                                    
                </tbody>
            </table>

		</div></div>
		</div>
</body>
</html>
<% } %>