<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection con = null;
try{
	String dbdrive = "com.mysql.jdbc.Driver";
	String dburl = "jdbc:mysql://kbsn.or.kr:3306/cclass";
	String dbid = "java_c";
	String dbpass = "java_cclass";
	
	Class.forName(dbdrive);
	con = DriverManager.getConnection(dburl, dbid, dbpass);
}catch(Exception e){
	out.print(e);
}
%>