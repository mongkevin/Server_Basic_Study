<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립팅 원소</title>
</head>
<body>
	<h1>스크립팅 원소</h1>
	<!-- HTML 주석: 개발자도구에 노출된다 -->
	<%-- JSP 주석: 개발자도구에 노출되지 않음 --%>
	
	<%
		//스크립틀릿: 이안에 일반적인 자바 코드 작성 (변수 선언 및 초기화, 제어문 등등...)
		
		int sum = 0;
		for(int i=0; i<100; i++){
			sum+=i;
		}
		System.out.println("덧셈 완료: "+ sum);
	%>
	
	<p>
		화면으로 출력하고자 한다면<br>
		스크립틀릿을 이용하여 출력 가능: <%out.println(sum); %><br>
		표현식(출력식)으로 출력 가능: <%= sum %>	
	</p>
	
	<%
		//배열 사용
		String[] menu ={"SK","제육볶음","뼈해장국"};
	%>
	
	<h5>배열 길이: <%=menu.length %></h5>
	<%=menu %> <br> <%--menu 변수에 담긴 주소값이 출력된다. --%>
	<%=String.join(",",menu) %>
	
	<h4>반복문으로 각 요소 li로 뽑기</h4>
	<ul>
		<%for(int i=0; i<menu.length; i++){ %>
			<li><%=menu[i] %></li>
		<%} %>
	</ul>
</body>
</html>