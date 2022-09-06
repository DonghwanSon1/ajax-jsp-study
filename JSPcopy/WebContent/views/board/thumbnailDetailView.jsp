<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.*"%>
<%
    Board b = (Board)request.getAttribute("b");
    ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
		.outer{
		background-color: rgb(139, 192, 246);
		color: white;
		width: 1000px;
		height: 900px;
		margin: auto;
		margin-top: 50px;
	}
    #detail-form{
        color: black;
    }
	#detail-form>table{border: 2px solid white;}
	#detail-form input, #detail-form textarea{
		width: 100%;
		box-sizing: border-box;
		border-radius: border-box;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <br>
        <h2 align="center">사진게시판 작성하기</h2>
        <br>

            
            <table id="detail-form" align="center" border="2">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3" width="600"><%=b.getBoardTitle() %></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><%=b.getBoardWriter() %></td>
                    <th>작성일</th>
                    <td><%=b.getCreateDate() %></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
						<p style="height: 100px;">
                            <%= b.getBoardContent()%>
                        </p>
                    </td>
                </tr>
                <!-- 미리보기 영역 -->
                <tr>
                    <th>대표이미지</th>
                    <td colspan="3" align="center">
                        <img width="500" height="300" src="<%=contextPath%>/<%= list.get(0).getFilePath()+list.get(0).getChangeName() %>">
                    </td>
                </tr>
                <tr>
                    <th>상세이미지</th>
                    <td colspan="3">
                        <% for(int i = 1; i < list.size(); i++) { %>
                            <img src="<%=contextPath%>/<%= list.get(i).getFilePath()+list.get(i).getChangeName() %>" width="200" height="150">
                        <% } %>
                    </td>
                </tr>

            </table>
            <br>

            <div align="center">
                <a href="<%=contextPath%>/list.th" class="btn btn-sm btn-secondary">목록</a>

            </div>




    </div>













</body>
</html>