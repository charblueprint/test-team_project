<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/dbconfig.jsp"%>
<%@ include file="/session.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
// if(number1 == "" || number1 == null){
// 	out.print("<script> alert('유효하지 않은 접근입니다.'); location.href='http://192.168.100.205:8080/reser_system/index.jsp'; </script>");
// }]
if(number==null||number.equals("")){
	out.print("<script> alert('유효하지 않은 접근입니다.'); location.href='http://192.168.100.205:8080/reser_system/index.jsp'; </script>");
}

String sql="select * from reserve_room where reservenum=? ";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, number);
ResultSet rs = ps.executeQuery();

ArrayList<String> al = new ArrayList<>();
while(rs.next()){
	al.add(0,rs.getString("reservenum"));
	al.add(1,rs.getString("reserve_date"));
	al.add(2,rs.getString("rnm"));
	al.add(3,rs.getString("rpname"));
	al.add(4,rs.getString("rptel"));
	al.add(5,rs.getString("rpemail"));
	al.add(6,rs.getString("rpcount"));
	al.add(7,rs.getString("rparrive"));
	al.add(8,rs.getString("ridx"));
}

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>팬션 예약시스템</title>
<link rel="stylesheet" href="./css/default.css?v=3">
<script src="./js/jquery.js"></script>
<script src="./js/jquery-ui.js"></script>
<script src="./js/index.js"></script>
<script src="./js/reserve_info.js"></script>
<link rel="stylesheet" href="./js/jquery-ui.css?v=1">
</head>
<body>
	<header class="header_css">
		<div class="title">[더조은 펜션 예약시스템]</div>
	</header>
	<nav class="nav_css">
		<ul class="ul_css">
			<li onclick="location.href='http://192.168.100.205:8080/reser_system/index.jsp';">예약현황</li>
			<li onclick="location.href='http://192.168.100.204:8080/reser_system/reserve.jsp';">예약하기</li>
			<li class="li_btn">예약확인</li>
		</ul>
	</nav>
	<section class="section_css">
		<div class="reserve_info">
			<p>예약 정보 확인</p>
			<ul>
				<li>예약번호</li>
				<li><%=al.get(0)%></li>
			</ul>
			<ul>
				<li>예약일자</li>
				<li><%=al.get(1)%></li>
			</ul>
			<ul>
				<li>객실명</li>
				<li><%=al.get(2)%></li>
			</ul>
			<ul>
				<li>예약자</li>
				<li><%=al.get(3)%></li>
			</ul>
			<ul>
				<li>연락처</li>
				<li><%=al.get(4)%></li>
			</ul>
			<ul>
				<li>이메일</li>
				<li><%=al.get(5)%></li>
			</ul>
			<ul>
				<li>인원수</li>
				<li><%=al.get(6)%>명</li>
			</ul>
			<ul>
				<li>도착예정시간</li>
				<li><%=al.get(7)%></li>
			</ul>
		</div>
		<div class="reserve_btn">
			<input type="button" value="예약수정" class="btn1" onclick="go_modify(<%=al.get(8)%>); ">
		</div>
	</section>
	<footer class="footer_css">
		<div>Copyright ⓒ 사이트 주소 2022 All Rights reserved.</div>
	</footer>
</body>
</html>
		<%
		rs.close();
		ps.close();
		con.close();
	%>