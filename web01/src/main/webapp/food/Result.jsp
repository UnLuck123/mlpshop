<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page session="true"%>
<%@ include file="../mydbcon.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MLP 쇼핑몰</title>
<link rel="stylesheet" href="../css/mycss.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
<%
String user_id = (String)session.getAttribute("id");	
%>

	$(document).ready(function(){
		var currentPosition = parseInt($("#quickmenu").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop(); 
			$("#quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
		});
	});

	function loginpage(){
		if(true){
			window.location.href="../login/login.jsp";
		}
	}

	function goTop(){
		window.scrollTo(0,0);
	}

	function goBottom(){
		window.scrollTo(0,document.body.scrollHeight);
	}

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

	function login_chk(){
		 var login_id = <%=user_id%>;
		 if(!login_id){
			 alert('로그인을 먼저 해주세요!');
			 window.location.href="../login/login.jsp";
			 return false;
		 }
		 else{
			 return true;
		 }
	 }

</script>

<%
	String str = request.getParameter("str");
	String sql = "select product.name,many,img,company,productor_id from product,productor where product.productor_id=productor.id and kind='"+str+"'";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
</head>
<body>

<div id="wrapper">
	<%
	if(user_id==null){
	%>
		<button style="float:right" onclick="return loginpage()">로그인</button>
	<%
	}
	else{
	%>
		<button style="float:right" onclick="logout()">로그아웃</button>
	<%
	}
%>
	<button style="float:right" onclick="location.href='../Main.jsp'">홈으로</button>
	<header class="shadow">MLP&nbsp;쇼핑몰</header>
	<nav>
		<ul id="menu">
			<li id="menu_li"><button onclick="location.href='Result.jsp?str=채소'">채소</button>
			<li id="menu_li"><button onclick="location.href='Result.jsp?str=육류'">육류</button>
			<li id="menu_li"><button onclick="location.href='Result.jsp?str=유제품'">유제품</button>
			<li id="menu_li"><button onclick="location.href='Result.jsp?str=소스류'">소스류</button>
		</ul>
	</nav>
	
	<div id="quickmenu">
		<button style="width:100%;bgcolor:white" onclick="goTop()">Top<br>맨 위로</button>
		<button style="width:100%;bgcolor:white" onclick="goBottom()">Bottom<br>맨 아래로</button>
	</div>
	<section>
		<%
		while(rs.next()){
			String name = rs.getString("name");
			String many = rs.getString("many");
			String company = rs.getString("company");
			String img = rs.getString("img");
			String pro_id = rs.getString("productor_id");%>
			<div class="div">
				<div style="float:left;width:35%;height:98%;position:relative;overflow:hidden">
					<img src="../img/<%=img %>"/>
				</div>
				<div style="float:right;width:65%;height:100%;display:table">
				<form action=Purchase.jsp method="get" onSubmit="return login_chk()">
				<table style="width:100%;text-align:center;margin-top:12%">
					<tr>
						<td><b>상품명</b> : <%=name %></td>
						<td><b>재고</b> : <%=many %></td>
						<td><b>납품업체</b> : <%=company %></td>
						<td>정기구매<br><input type="radio" name="sub" value="o"/>예
									<input type="radio" name="sub" value="x" checked="checked"/>아니오</td>
						<td><input type="text" name="num" style="width:50px"/>개<br><br>
						<input type="hidden" name="name" value="<%=name %>" />
						<input type="hidden" name="productor_id" value="<%=pro_id %>" />
						<input type="submit" value="구매"/></td>
					</tr>
				</table>
				</form>
				</div>
			</div>
		<%}
		%>
	
	</section>

</div>
</body>
</html>
