<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시어</title>
</head>
<body>
	<h1>include 지시어</h1>
	<h2>01_ScriptingElement.jsp 파일 include</h2>
	<%@ include file="01_ScriptingElement.jsp" %>
	
	포함한 jsp파일의 변수를 가져다 사용할 수 있다. <br>
	합계: <%= sum %>
	
	<h2>오늘 날짜</h2>
	<%@ include file="dateprint.jsp" %>
</body>
</html>