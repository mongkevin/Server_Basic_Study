<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList" 
    import = "com.kh.board.model.vo.Attachment" 
    import = "com.kh.board.model.vo.Board"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	ArrayList<Board> bList = (ArrayList<Board>)(request.getAttribute("atList"));
%>
<style>
	.list-area{
		width:760px;
		margin:auto;
	}
	.thumbnail{
		border: 1px solid white;
		width : 220px;
		display : inline-block;
		margin:14px;
	}
	.thumbnail:hover{
		cursor: pointer;
		opacity : 0.7;
	}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<h2 align="center">사진 게시판</h2>
		<br>
		<br>
		<%if(loginUser != null) {%>
		<div align="center">
			<a href="<%=contextPath %>/insert.ph" class="btn btn-info">글작성</a>
			<br><br>
		</div>
		<%} %>
		
		<div class="list-area">
		<%for(Board b : bList){ %>
			<div class="thumbnail" align="center">
				<input type="hidden" name="pno" value="<%=b.getBoardNo() %>">
				<img src="<%=contextPath+"/"+b.getTitleImg() %>" width="200px" height="150px">
				<p>
					NO. <%=b.getBoardNo() %><br>
					<%=b.getBoardTitle() %><br>
					조회수 : <%=b.getCount() %>
				</p>
			
			</div>
		<%} %>
		</div>
	</div>
			<script>
				$(function(){
					$(".thumbnail").click(function(){	
						var pno = $(this).children().eq(0).val();
						//$(this).children("input[type=hidden]").val();
						//$(this).children("input[name=bno]").val();
						
						location.href="<%=contextPath%>/detail.ph?pno="+pno;
					});
				});
			</script>
	
</body>
</html>