<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
    
<%@ include file="../dbconn.jsp" %> <!-- 본인의 dbcon.jsp를 사용하시면 됩니다. -->
<html>
<head>
<meta charset="utf-8">
<title>regist 테이블 확인 및 productor 테이블에 insert</title>
<script>
	function access(id){
		if(confirm(id + "를(을) 승인하시겠습니까?") == true){
			location.href = "productor_confirm.jsp?target=" + id;
		} else{
			return false;
		}
	}
	function cut(id){
		if(confirm(id + "를(을) 해지하시겠습니까?") == true){
			location.href = "cut_id.jsp?target=" + id;
		} else{
			return false;
		}
	}
</script>
</head>
<body>
<center>
	<table border=1 bordercolor=blue>
		<tr style="text-align: center; background: rgb(111,167,235); color: white ;">
			<th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>기업</th><th>등록</th><th>해지</th>
		</tr>
		<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM regist";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();		
		
		while(rs.next()){
			String id = rs.getString("id");
			String pwd = rs.getString("pwd");
			String name = rs.getString("name");
			String email = rs.getString("email");
			String company = rs.getString("company");
			
		%>
		<tr style="text-align:center">
			<td><%=id %></td>
			<td><%=pwd %></td>
			<td><%=name %></td>
			<td><%=email %></td>
			<td><%=company %></td>
			<td><button id=<%=id %> onClick = "access(this.id);">승인</button></td>
			<td><button id=<%=id %> onClick = "cut(this.id);">해지</button></td>
		</tr>
		<%
		}
		%>
	</table>
</center>
</body>
</html>