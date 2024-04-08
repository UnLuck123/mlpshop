<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>

<%@page import="org.json.simple.JSONObject"%>


<%
	Connection conn = null;
	
	String dbURL = "jdbc:mysql://localhost:3306/shop?serverTimezone=Asia/Seoul";
	String dbID = "root";                     //MySQL에 접속을 위한 계정의 ID
	String dbPassword = "6608";            //MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	
%>
