<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.board.model.vo.*, java.util.ArrayList"%>
<%
	Board b = (Board)(request.getAttribute("board"));
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("aList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp"  %>
	<div class="outer">
		<br><br>
        <h2 align="center">사진게시판 상세보기</h2>
        <br>
        <table class="list-area" align="center" border="1">
                <tr>
                    <th width="70">제목</th>
                    <th width="300" colspan="3"><%=b.getBoardTitle() %></th>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><%=b.getBoardWriter()%></td>	
                    <td>작성일</td>
                    <td><%=b.getCreateDate() %></td>
                </tr>
                <tr>
                    <td height="200">내용</td>
                    <td colspan="3"><p><%=b.getBoardContent() %></p></td>

                </tr>
                <tr>
                	<th>대표이미지</th>
                	<td colspan="3" align="center">
                		<img src="<%=contextPath+"/"+list.get(0).getFilePath()+list.get(0).getChangeName() %>" width="250" height="170">
                	</td>
                </tr>
                <tr>
                	<th>상세이미지</th>
                	<%for(int i=1; i<list.size(); i++){ %> %>
                		<td colspan="3" align="center"><img src="<%=contextPath+"/"+list.get(i).getFilePath()+list.get(i).getChangeName() %>" width="250" height="170">
                	<%} %>
                </tr>
        </table>
        <br><br>
        <%-- <%if(loginUser != null && loginUser.getUserId().equals(){ %> --%>
        <div align="center">
        	<button onclick="location.href='<%=contextPath %>/update.bo?bno='" class="btn btn-info">수정하기</button>
        	<button onclick="location.href='<%=contextPath %>/delete.bo?bno='" class="btn btn-danger">삭제하기</button>
        </div>
        <%-- <%} %> --%>
	</div>
</body>
</html>