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
<title>보류 - productor에 있는 데이터를 삭제하는 코드</title>
</head>
<body>
<%
	String cut_id = request.getParameter("target");
	PreparedStatement pstmt = null;
	String sql = "DELETE FROM regist WHERE id = ?";
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,cut_id);
		pstmt.executeUpdate();
		pstmt.close();
	} catch(SQLException e){
		e.printStackTrace();
	}
	
%>
	<script>
		alert("<%=cut_id%>님과의 계약을 해지했습니다.");
		window.location.href = 'regist_confirm.jsp';
	</script>	
</body>
</html>