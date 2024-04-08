<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@page session="true"%>
    <%@ include file="../mydbcon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user_id = request.getParameter("id_input");
	String user_pwd = request.getParameter("pwd_input");
	String table = request.getParameter("position");
	
	String sql="SELECT id FROM "+table+" WHERE id='"+user_id+"' AND pwd='"+user_pwd+"'";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		do{
			session.setAttribute("id",rs.getString("id"));
			String str1 = "<script>alert('로그인에 성공했습니다!');";
			if(table.equals("customer")){
				String str2 = str1 + "location.replace('../product/Main.jsp');</script>";
				out.println(str2);
			}
			else if(table.equals("productor")){
				session.setAttribute("type","login");
				String str2 = str1 + "location.replace('../product/listProducts.do');</script>";
				out.println(str2);
			}
			else if(table.equals("manager")){
				String str2 = str1 + "location.replace('../admin/adminMain.jsp');</script>";
				out.println(str2);
			}
		}while(rs.next());
	}
	else{
		out.println("<script>alert('아이디나 비밀번호를 다시 확인하세요.'); location.href='login.jsp'; </script>");
	}
%>

</body>
</html>