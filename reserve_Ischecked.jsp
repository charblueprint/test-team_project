<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/dbconfig.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
String reservenum = request.getParameter("reser_num");
String rpname = request.getParameter("reser_nm");
String rptel = request.getParameter("reser_tel");
String rpemail = request.getParameter("reser_email");
String ridx = null;
out.print("확인중입니다. 잠시만 기다려주세요...");

String sql = "select * from reserve_room where reservenum=? and rpname=? and rptel=? and rpemail=?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, reservenum);
ps.setString(2, rpname);
ps.setString(3, rptel);
ps.setString(4, rpemail);

ResultSet rs = ps.executeQuery();
boolean result = rs.next();

if (result == false) {
	out.print("<script> alert('입력하신 정보를 다시 확인하세요.'); history.go(-1); </script>");
} else if (result == true) {
	session.setAttribute("ridx", reservenum);
	out.print("<script> location.href='./reserve_info.jsp'; </script>");
} else {
	out.print(
	"<script> alert('오류발생으로 인해 메인으로 돌아갑니다. 반복되실 경우 관리자에게 문의바랍니다.'); location.href='http://192.168.100.205:8080/reser_system/index.jsp';  </script>");
}
%>
<%
rs.close();
ps.close();
%>