<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@page session="true"%>
<%@ include file="../mydbcon.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>식자재 관리</title>
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
	 
	 function textChk(){
		 var text = document.getElementById("num");
		 if(!text){
			alert('폐기할 수량을 입력해주세요!');
			return false;
		 }else{return true;}
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
			<li id="menu_li"><button onclick="location.href='./adminProductor.jsp'">납품자관리</button>
			<li id="menu_li"><button style="background-color:#BCC6CC;color:white;" onclick="location.href='./adminProduct.jsp'">식자재관리</button>
			<li id="menu_li"><button onclick="location.href='./adminPurchase.jsp'">거래내역</button>
		</ul>
	</nav>
	
	<div id="quickmenu">
		<button style="width:100%;bgcolor:white" onclick="goTop()">Top<br>맨 위로</button>
		<button style="width:100%;bgcolor:white" onclick="goBottom()">Bottom<br>맨 아래로</button>
	</div>
	
	<aside>
		<ul style="padding-left:5px;padding-top:20px;">
			<li><a href="./adminProduct.jsp"><b>식자재 추가</b></a></li><br>
			<li><a href="./adminDispose.jsp"><b>식자재 폐기</b></a></li>
		</ul>
	</aside>
	
	<section>
	<form action="" onSubmit="return textChk()">
	<table>
	<tr><th>상품명</th><th>종류</th><th>재고량</th><th>납품자id</th><th>납품일자</th><th></th></tr>
	<%
	String sql = "select * from product";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){%>
		<tr><td><%=rs.getString("name") %></td><td><%=rs.getString("kind") %></td><td><%=rs.getInt("many") %></td>
			<td><%=rs.getString("productor_id") %></td><td><%=rs.getString("date") %></td>
			<td><input type=hidden name="name" value="<%=rs.getString("name") %>"/>
			<input type=hidden name="many" value="<%=rs.getInt("many") %>"/>
			<input type=text name=num id="num"/><b>개</b><br>
			<input type=submit value="폐기하기"/>
	<%}
	%>
	</table>
	</form>
	</section>
</div>
</body>
</html>