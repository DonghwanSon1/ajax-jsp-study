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
<title>공지사항 수정 페이지</title>
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
    #update-area{
        text-align: center;
        border: 2px solid white;
        font-weight: 600;
    }

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
	
		<br>
		<h2 align="center">공지사항 상세보기!!</h2>
		<br><br>
        <form action="<%=contextPath%>/update.no" method="post" id="update-form">
        	<input type="hidden" name="nno" value="<%=n.getNoticeNo() %>">

            <table id="update-area" align="center" border="1">
                <tr>
                    <th width="80">제목</th>
                    <td width="500"><input type="text" value="<%=n.getNoticeTitle() %>" name="title" required></td>
                </tr>
                <tr>
                    <th colspan="2">내용</th>
                    
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea  width="500" name="content" rows="10" required><%=n.getNoticeContent() %></textarea>
                    </td>
                </tr>
            </table>

            <br><br>

            <div align="center">
                <button type="submit" class="btn btn-sm btn-primary">수정하기</button>
                <button type="button" onclick="history.back();" class="btn btn-sm btn-primary">뒤로가기</button>
            </div>
    </form>
















<br><br><br>
</body>
</html>