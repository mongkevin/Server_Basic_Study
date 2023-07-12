<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*"%>
    <%
    	Board board = (Board)request.getAttribute("board");
    	Attachment attachment = (Attachment)request.getAttribute("attachment");
    	//request.getSession().setAttribute("attachment", attachment);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
    <div class="outer">
    <br><br>
        <h2 align="center">일반게시판 상세보기</h2>
        <br>
        <table class="list-area" align="center" border="1">
            <thead>
                <tr>
                    <th>카테고리</th>
                    <th width="50"><%=board.getCategory() %></th>
                    <th width="70">제목</th>
                    <th width="300"><%=board.getBoardTitle() %></th>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><%=board.getBoardWriter() %></td>	
                    <td>작성일</td>
                    <td><%=board.getCreateDate() %></td>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <td height="200">내용</td>
                    <td colspan="3"><%=board.getBoardContent() %></td>

                </tr>
                <tr>
                    <td>첨부파일</td>
                    <%if(attachment == null){ %>
                    	<td colspan="3">첨부파일없음</td>
                    <%}else { %>	
                    <td colspan="3"><a href="<%=contextPath %><%=attachment.getFilePath() %>/<%=attachment.getChangeName() %>" download><%=attachment.getOriginName() %></a></td>
                    <%} %>
                </tr>
            </tbody>
        </table>
        <br><br>
        <%if(loginUser != null && loginUser.getUserId().equals(board.getBoardWriter())){ %>
        <div align="center">
        	<button onclick="location.href='<%=contextPath %>/update.bo?bno=<%=board.getBoardNo() %>'" class="btn btn-info">수정하기</button>
        	<button onclick="location.href='<%=contextPath %>/delete.bo?bno=<%=board.getBoardNo() %>'" class="btn btn-danger">삭제하기</button>
        </div>
        <%} %>


	<br>
		<div id="reply-area">
			<table border="1" align="center">
				<thead>
				<%if(loginUser!=null){ %>
					<tr>
						<th>댓글작성</th>
						<td><textarea id="replyContent" rows="3" cols="50" style="resize:none"></textarea></td>
						<td><button onclick="insertReply();">댓글등록</button></td>
					</tr>
				<%}else{ %>
					<tr>
						<th>댓글작성</th>
						<td>
							<textarea rows="3" cols="50" style="resize:none" readonly>로그인 후 이용가능한 기능입니다.</textarea>
						</td>
						<td><button onclick="insertReply();" disabled>댓글등록</button></td>
					</tr>
				<%} %>
				</thead>
				<tbody>
					
				</tbody>
			</table>
    </div>
			<br><br>
			
			<script>
			
			$(function(){
				selectReplyList();
			});
				function insertReply(){
					//댓글 삽입
					//게시글 번호
					//성공시에는 댓글 리스트 조회 함수 실행 후 textarea 비워주기
					console.log("dd");
					$.ajax({
						url:"test.do",
						data:{
							content: $("#replyContent").val(),
							boardno: <%=board.getBoardNo()%>
						},
						type:"post",
						success: function(result){
							console.log("응");
							console.log(result)
							if(result>0){
								alert("댓글 작성 완료");
								//selectReplyList();
								$("#replyContent").val("");
							};
						},
						error: function(){
							console.log("통신 실패");
						}
					});
				}
				
				function selectReplyList(){
					//댓글 목록 조회
					//조회해온 데이터를 tbody에 tr로 출력해주기
					var boardNo = $("input[type=hidden]");
					$.ajax({
						url:"selectReply.bo",
						data:{
							boardno : <%=board.getBoardNo()%>
						},
						success: function(rlist){
							var result = "";
							
							for(var i in rlist){
								result += "<tr>"
								          	+ "<td>" + rlist[i].replyWriter + "</td>"
								          	+ "<td>" + rlist[i].replyContent + "</td>"
								          	+ "<td"> + rlist[i].createDate + "</td>"
								          	+ "</tr>";
							}
							$("#reply-area tbody").html(result);
						},
						error: function(){
							console.log("통신 실패");
						}
					});
				}
			</script>
		</div>
</body>
</html>