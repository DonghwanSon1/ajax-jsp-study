<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 내용</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
    	.outer{
		background-color: rgb(139, 192, 246);
		color: black;
		width: 1000px;
		margin: auto;
		margin-top: 30px;
	}
    #detail-area{
        text-align: center;
        border: 2px solid white;
        font-weight: 600;
    }
    p{
        text-align: left;
        height: 350px;
    }
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
	
		<br>
		<h2 align="center">공지사항 상세보기!!</h2>
		<br><br>

        <table id="detail-area" align="center" border="1">
            <tr>
                <th width="80">제목</th>
                <td width="380" colspan="3"><%=n.getNoticeTitle() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%=n.getNoticeWriter() %></td>
                <th>작성일</th>
                <td><%=n.getCreateDate() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p><%=n.getNoticeContent() %>
                    </p>
                </td>
            </tr>
        </table>

        <br><br>

        <div align="center">
            <a href="<%=contextPath%>/list.no" class="btn btn-sm btn-primary">목록</a>
            <!-- 작성자만 보이게끔 -->
            <!-- 로그인이 되어있고, 그리고 현재 로그인된 사용자가 작성자와 동일할 경우 -->
            <% if(loginUser != null && loginUser.getUserId().equals(n.getNoticeWriter()) ) { %>
                <a href="<%=contextPath%>/updateForm.no?nno=<%=n.getNoticeNo()%>" class="btn btn-danger btn-sm">수정하기</a> <!-- /updateForm.no -->
                <a href="<%=contextPath%>/delete.no?nno=<%=n.getNoticeNo()%>" class="btn btn-danger btn-sm">삭제하기</a> <!-- /delete.no -->
            <% } else { %>

            <% } %>
        </div>


<br><br><br>
</body>
</html>