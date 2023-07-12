<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String str = sdf.format(today);
	%>
	
	<h4><%= str %></h4>
</body>
</html>