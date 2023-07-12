<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이 구문을 스크립틀릿이라고 하여 html문서내에 자바코드를 쓸수 있는 영역이다.
	//현재 이jsp에서 필요로하는 데이터들을 추출하는 코드를 작성한다(attribute)
	//request.getAttribute("키값"): Object
	
	String name = (String)request.getAttribute("name");
	String gender = (String)request.getAttribute("gender");
	String city = (String)request.getAttribute("city");
	double height = (double)request.getAttribute("height");
	String[] foods = (String[])request.getAttribute("foods");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답페이지</title>
</head>
<body>
	<h1>응답하는 페이지</h1>
	<!-- 출력부 -->
	<span><%= name%>님은</span>
	<span><%= gender%>이고</span>
	<span><%= city%>에 살고있고</span>
	<span>키는<%= height%>cm인</span>
	<span>좋아하는 음식이
	<%if(foods==null){ %>
		없습니다.
	<%}else{ %>
		<ul>
			<%for(int i=0; i<foods.length; i++){ %>
				<li><%=foods[i] %></li>
			<%} %>
		</ul>
	<%} %>
	</span>
</body>
</html>