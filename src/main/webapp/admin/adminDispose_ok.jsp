<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@page session="true"%>
	<%@ include file="../mydbcon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
	String name = request.getParameter("name");
	int num = Integer.parseInt(request.getParameter("num"));
	
	String sql = "UPDATE product SET many = many - "+ num +" WHERE name = '"+ name +"'";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.executeUpdate();
	
	out.println("<script>alert('폐기하였습니다.'); location.replace('../admin/adminDispose.jsp');</script>");
	} catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>