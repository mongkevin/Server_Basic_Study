<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date" errorPage="error500.jsp"%>
<%@ page import="java.util.ArrayList, java.util.Scanner" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어</title>
</head>
<body>
	<h1>page 지시어</h1>
	
	<%
		//ArrayList 사용
		
		ArrayList<String> list = new ArrayList<>();
		
		list.add("JSP");
		list.add("Servlet");
		//import할 클래스가 여러개라면 , 로 구분지어 연이어 작성하면 됨
		//하나의 페이지 지시어 형식 안에서 작성하여도 된다.
		Date today = new Date();
	
	%>
	
	<p>
		리스트의 길이: <%=list.size() %> <br>
		0번 인덱스의 값: <%= list.get(0) %> <br>
		1번 인덱스의 값: <%= list.get(1) %> <br>
		현재 날짜및 시간 : <%= today %> <br>
	</p>
	
	<%--<%=list.get(10) 인덱스 벗어나면 오류 발생--%>
</body>
</html>