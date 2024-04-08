<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>


<%
	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/shop?useSSL=false&serverTimezone=UTC"; //Database 이름은 shop
	String id = "root";                     //MySQL에 접속을 위한 계정의 ID
	String pwd = "5764";            //MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pwd);



	
%>
