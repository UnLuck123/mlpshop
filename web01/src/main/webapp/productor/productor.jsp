<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="../mydbcon.jsp" %>


<title>납품 페이지</title>
<link rel="stylesheet" href="../css/productor.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	 $(document).ready(function(){
		  var currentPosition = parseInt($("#quickmenu").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $("#quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
		  });
		});
	 
	 function logout(){
			if(confirm('로그아웃 하시겠습니까?')){
				alert('로그아웃 되었습니다.');
				window.location.href="../login/logout.jsp";
				return true;
			}
			else{
				return false;
			}	
	}
</script>

</head>
<body>
<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//session.setAttribute("id", "mirygm");
		String id = (String)session.getAttribute("id");
		
		pstmt = conn.prepareStatement("select * from product where productor_id ='" + id + "'");
	    rs = pstmt.executeQuery();
	    
	  
%>

<div id="wrapper">
	<button id="btn1" onclick="return logout()">LogOut</button>
	<header>납품 페이지</header>
</div>
	<div id="quickmenu">
	퀵메뉴
	</div>
	
	<div id="productor_table1">
		<br><br><a>최근 납품 내역</a><br><br>
		<table class="tb1">
		 <thead>
		  <tr>
			<th>물품명</th> <th>종류</th> <th>수량</th> <th>생산 일자</th> <th>상태</th>
		  </tr>
		 </thead>
		 <tbody>
		 <%
		 while (rs.next()) {
	      %><tr>
	      		<%
	        	out.println("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(6) + "</td>");
	      		%>
 		    </tr><%
		    }      
		 %>
		 </tbody>
		</table>
	</div>
	<div id="productor_table2">
		<form name="productorform" action="${contextPath}../Product/addProduct.do"  method="post" enctype="multipart/form-data">
		  <br><br><a>납품 입력</a><br><br>
            <table class = "tb2">
				<tr>
				 <td>물품명</td><td><input type="text" name="name" id="obj_name" minlength='1' maxlength='10' required></td>
				</tr>
				<tr>
				 <td>종류</td>
				 <td>
				  <select name="kind" id="obj_kind" required>
									    <option value=""disabled selected>-선택-</option>
									    <option value="채소">채소</option>
									    <option value="육류">육류</option>
									    <option value="유제품">유제품</option>
									    <option value="소스류">소스류</option>
				 </select>
				</td>
				</tr>
				<tr>
				 <td>수량</td><td><input type="text" name="amount" id="obj_amount" minlength='1' maxlength='10' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required></td>
				</tr>
				<tr>
				 <td>제품 사진</td>
				 <td>
				 <div class="imgbtn">
        			<label for="obj_img">
            			파일 업로드
        			</label>
    			</div>
				 <input type="file" id="obj_img" name="img" accept="image/*" required></td>
				</tr>
				<tr>
				 <td>생산일자</td><td><input type="date" name="date" id="obj_date"required></td>
				</tr>
            </table>
        <button type="submit" id="btn2">입력</button>
        </form>
    </div>
	
	
	

<script>
var now_utc = Date.now()
var timeOff = new Date().getTimezoneOffset()*60000;
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("obj_date").setAttribute("max", today)
</script>	
</body>
</html>