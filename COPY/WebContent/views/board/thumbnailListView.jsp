<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Board" %>
<%
    ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
    img{
        width: 200px;
        height: 150px;
        padding: 10px;
    }
    .outer{
		background-color: white;
		color: black;
		width: 1000px;
		height: 1000px;
		margin: auto;
		margin-top: 50px;
	}
    .list-area{
        width: 760;
        margin: auto;
    }
    .thumbnail{
        border: 1px solid black;
        width: 200px;
        display: inline-block;
        color: black;
        margin: 13px;
        background-color: rgb(130, 227, 230);
    }
    .thumbnail:hover{
        cursor: pointer;
        opacity: 0.6;
    }

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">

        <br>
        <h2 align="center">사진게시판</h2>
        <br>

        <% if(loginUser != null) { %>
            <div align="right" style="width: 850;">
                <a href="<%=contextPath %>/enrollForm.jsp" class="btn btn-sm btn-secondary">글작성</a>
                <br>
            </div>
        <% } %>


        <div class="list-area">
            
            <% if(list != null) { %>
                <% for(Board b : list) {%>
                    <div class="thumbnail" align="center">
                        <input type="hidden" value="<%= b.getBoardNo()%>">
                        <img src="<%= b.getTitleImg() %>">
                        <p>
                            No. <%= b.getBoardNo()%> / <%=b.getBoardTitle() %> <br>
                            조회수 : <%= b.getCount()%> 
                        </p>
                    </div>
                <% } %>    
            <% } else { %>
                등록된 게시글이 없습니다.
            <% } %>

        </div>

    </div>

    <script>
        $(function(){
            $(".thumbnail").click(function(){

                // 클릭될때마다 url요청 => location.href
                var bno = $(this).children().eq(0).val();

                location.href = "<%=contextPath %>/detail.th?bno=" + bno;
                // /jsp/detail.th?bno=?








            });
        });

    </script>
	

<br><br><br>
</body>
</html>