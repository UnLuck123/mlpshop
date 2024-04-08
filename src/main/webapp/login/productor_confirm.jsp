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
<title>regist 테이블에서 insert한 productor테이블 확인</title>

</head>
<body>


<%
	String access_id = request.getParameter("target");
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	String sql = "INSERT INTO productor select * from regist where id = ?";
	String sql2 = "DELETE FROM regist WHERE id = ?";
	String sql3 = "SELECT * FROM productor";
	
	ResultSet rs1 = null;
	try{
		pstmt3 = conn.prepareStatement(sql3);
		
		rs1 = pstmt3.executeQuery();
		
		while(rs1.next()){
			String id_check = rs1.getString("id");
			
			if(id_check.equals(access_id)){
				out.println("<script>alert('"+access_id+"은(는) 등록되었습니다.');</script>");
				out.print("<script> history.back();</script>");
				conn.close();
				return;				
			}
		}
		pstmt = conn.prepareStatement(sql);
		pstmt2 = conn.prepareStatement(sql2);
		
		pstmt.setString(1,access_id);
		pstmt2.setString(1, access_id);
		
		pstmt.executeUpdate();
		pstmt2.executeUpdate();
		
		pstmt.close();
		pstmt2.close();
		
	} catch(SQLException e){
		e.printStackTrace();
	}
%>
	<center>
		<table border=1 bordercolor="blue">
		<tr style="text-align: center; background: rgb(111,167,235); color: white ;">
			<th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>기업</th>
		</tr>
		<%
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		
		String sql1 = "SELECT * FROM productor";
		pstmt1 = conn.prepareStatement(sql1);
		
		rs = pstmt1.executeQuery();
		
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
		</tr>
		<%
		}
		%>	
		</table>
	</center>	
</body>
</html>