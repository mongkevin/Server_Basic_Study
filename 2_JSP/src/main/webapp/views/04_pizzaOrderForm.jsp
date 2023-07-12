<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error500.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>피자 주문 페이지</h1>

	<h2>오늘의 날짜</h2>
	<%@ include file="dateprint.jsp" %>
	
	<br>
	<br>

	<form action="/jsp/pizzaOrder.do" method="post">

		<fieldset>
			<legend>주문자 정보</legend>
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="userName" required></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" required></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" required></td>
				</tr>
				<tr>
					<th>요청사항</th>
					<td><textarea name="content" cols="30" rows="10"
							style="resize: none"></textarea></td>
				</tr>
			</table>
		</fieldset>

		<fieldset>
			<legend>주문 정보</legend>
			<table>
				<tr>
					<th>피자</th>
					<td><select name="pizza">
							<option>콤비네이션</option>
							<option>치즈피자</option>
							<option>페퍼로니 피자</option>
							<option>고구마 피자</option>
							<option>치즈크러스트 피자</option>
					</select></td>
				</tr>
				<tr>
					<th>토핑</th>
					<td><input type="checkbox" name="topping" value="bacon">베이컨
						<input type="checkbox" name="topping" value="sweetpotato">고구마무스
						<input type="checkbox" name="topping" value="snowcheeze">눈꽃치즈
						<input type="checkbox" name="topping" value="shrimp">블랙타이거새우
						<input type="checkbox" name="topping" value="olive">올리브 <input
						type="checkbox" name="topping" value="pig">이베리코</td>
				</tr>
				<tr>
					<th>사이드</th>
					<td><input type="checkbox" name="side" value="cola">콜라
						<input type="checkbox" name="side" value="spagetti">스파게티 <input
						type="checkbox" name="side" value="wings">윙봉 <input
						type="checkbox" name="side" value="galic">갈릭소스 <input
						type="checkbox" name="side" value="cheezeball">치즈볼</td>
				</tr>
				<tr>
					<th>결제방식</th>
					<td><input type="radio" name="payment" value="card" checked>카드결제
						<input type="radio" name="payment" value="cash"> 현금결제</td>
				</tr>
			</table>
		</fieldset>

		<br>
		<br> <input type="submit" value="submit"> <input
			type="reset" value="reset">
	</form>
</body>
</html>