<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page session="true"%>
<%@ include file="../mydbcon.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>납품업체 관리</title>
<link rel="stylesheet" href="../css/admincss.css">
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
<div id="wrapper">
	<button style="float:right" onclick="return logout()">로그아웃</button>
	<header class="shadow">MLP&nbsp;쇼핑몰</header>
	<nav>
		<ul id="menu">
			<li id="menu_li"><button onclick="location.href='./adminMain.jsp'">회원관리</button>
			<li id="menu_li"><button style="background-color:#BCC6CC;color:white;" onclick="location.href='./adminProductor.jsp'">납품자관리</button>
			<li id="menu_li"><button onclick="location.href='./adminProduct.jsp'">식자재관리</button>
			<li id="menu_li"><button onclick="location.href='./adminPurchase.jsp'">거래내역</button>
		</ul>
	</nav>
	
	<div id="quickmenu">
		<button style="width:100%;bgcolor:white" onclick="goTop()">Top<br>맨 위로</button>
		<button style="width:100%;bgcolor:white" onclick="goBottom()">Bottom<br>맨 아래로</button>
	</div>
	
	<aside>
		<ul style="padding-left:5px;padding-top:20px;">
			<li><a href="./adminProductor.jsp">납품 업체 관리</a></li><br>
			<li><a href="./adminPermission.jsp">등록 승인/승인취소</a></li>
		</ul>
	</aside>
	
	<section>
	<table>
		<tr style="text-align:center;background:rgb(111,167,235);"><th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>기업명</th><th></th></tr>
	<% 
	String sql="select * from productor";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){
	%>
		<tr style="text-align:center"><td><%=rs.getString("id") %></td><td><%=rs.getString("pwd") %></td><td><%=rs.getString("name") %></td>
		<td><%=rs.getString("email") %></td><td><%=rs.getString("company") %></td>
		<td><button onclick="location.href='productor_delete.jsp?id=<%=rs.getString("id")%>'">삭제</button></td></tr>
	<%
	}
	%>
	</table>
	</section>
</div>
</body>
</html>