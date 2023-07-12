<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*, java.util.ArrayList"%>
    <%
    	Board board = (Board)request.getAttribute("board");
    	Attachment attachment = (Attachment)request.getAttribute("attachment");
    	ArrayList<Category> categoryList = (ArrayList<Category>)request.getAttribute("clist");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#update-form>table{
		border: 1px solid white;
	}
	#update-form input, textarea{
		width:100%;
		box-sizing:border-box;
	}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<div class="outer">
		<h2 align="center">글 수정 페이지</h2>
		<!-- 카테고리, 제목, 내용, 첨부파일 , 작성자번호-->
		<form action="<%=contextPath%>/update.bo" method="post" id="update-form" enctype="multipart/form-data">
			<!-- 게시글 번호 숨겨보내기 -->
			<input type="hidden" name="boardNo" value="<%=board.getBoardNo() %>">
			<!-- 카테고리 테이블에서 조회해온 카테고리 목록 선택상자 만들기 -->
			<script>
				$(function(){
					//option에 있는 text와 조회해온 게시글 카테고리와 일치하는지 찾아내어 선택되어있게 작업하기
					$("#update-form option").each(function(){
						//현재 접근된 요소객체의 text와 조회해온 카테고리가 같다면
						if($(this).text() == "<%=board.getCategory()%>"){
							//해당 요소를 선택되어있게 만들기
							$(this).attr("selected",true);
						}
					});
				});
			</script>
			<table align="center">
				<tr>
					<th width="100">카테고리</th>
					<td width="500">
						<select name="category">
							<%for(Category c : categoryList) {%>
								<option value="<%=c.getCategoryNo() %>"><%=c.getCategoryName() %></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="<%=board.getBoardTitle() %>" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="10" cols="30" required><%=board.getBoardContent() %></textarea>
					</td>				
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
					<%if(attachment != null){ %>
					<!-- 기존 첨부파일이 있었을 경우 수정할때 첨부파일 정보를 보내야한다 -->
					<!-- 파일번호, 변경된 파일명 전달하기 -->
						<%=attachment.getOriginName() %>
						<input type="hidden" name="fileNo" value="<%=attachment.getFileNo() %>">
						<input type="ihdden" name="originFileName" value="<%=attachment.getChangeName() %>">
					<%} %>
						<input type="file" name="reUpfile">
					</td>
				</tr>
			</table>
			<br>
			<div align="center">
			<button type="submit">수정하기</button>
			
			</div>
		</form>
	</div>
</body>
</html>