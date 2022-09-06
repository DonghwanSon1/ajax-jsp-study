<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.common.model.vo.PageInfo" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	// 페이징바 만들때 필요한 변수 미리 셋팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.outer{
		background-color: white;
		color: white;
		width: 1000px;
		margin: auto;
		margin-top: 30px;
	}

    .table{
        text-align: center;
        border: 2px solid white;
        font-weight: 300;
    }
    .table>tbody>tr:hover{
        cursor: pointer;
        font-size: large;
        font-weight: 500;
    }
	#write{
		color: white;
		font-weight: 700;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		
		<br>
		<h2 align="center">일반게시판</h2>	
		<br>
	

		<div align="right">
			<!-- 로그인한 회원만 보여지는 버튼 : loginUser가 null인지 아닌지 판단 -->
			<% if(loginUser != null ) { %>
				<a id="write" href="<%=contextPath %>/enrollForm.bo" class="btn btn-warning btn-sm">글작성</a>
				<br><br>
			<% } %>
		</div>
		
		<table align="center" border="1" class="table">
			<thead>
				<tr>
					<th width="70">글번호</th>
					<th width="70">카테고리</th>
					<th width="300">제목</th>
					<th width="100">작성자</th>
					<th width="60">조회수</th>
					<th width="100">작성일</th>
				</tr>
			</thead>
			<tbody>
				<!-- 게시글 출력 : 게시글이 있는지 없는지 => isEmpty() 이용해서 없는 경우 먼저 조건 부여 -->
				
				<% if(list.isEmpty()) { %> <!-- 조회글 없음 -->
					<tr>
						<td colspan="6">조회된 게시글이 없습니다.</td>
					</tr>
				<% } else { %>
					<!-- 반복문 사용 : list에 있는 값을 순차적으로 접근해서 뽑아오기 -->
					<% for(Board b : list) { %>
						<tr>
							<td><%= b.getBoardNo() %></td>
							<td><%= b.getCategory() %></td>
							<td><%= b.getBoardTitle() %></td>
							<td><%= b.getBoardWriter() %></td>
							<td><%= b.getCount() %></td>
							<td><%= b.getCreateDate() %></td>
						</tr>					
					<% } %>
				<% } %>
			</tbody>
		</table>

		<script>
			$(function(){
	
				$(".table>tbody>tr").click(function(){
	
					//console.log("클릭~");
	
					// 클릭했을때 해당 공지사항의 번호를 넘겨야함
					// 해당 tr태그의 자손 중에서도 첫번째 td태그의 값만 필요함
	
					var bno = $(this).children().eq(0).text();
	
					//console.log(nno);
	
					// 글번호를 이용한 요청
					// => 대놓고 요청 => url에 키와 벨류를 대놓고 작성해서 요청을 보내버리겠다.
					// => GET방식 : 요청할 url?키=벨류&키=벨류&키=벨류...
					// "쿼리 스트링" : ? 뒤의 내용들, 직접 쿼리스트링을 만들어서 요청
					// localhost:8001/jsp/detail.no?nno=글번호
	
					location.href="<%=contextPath%>/detail.bo?bno=" + bno;
	
				})
	
			})
		</script>

		<br><br>

		<div align="center" class="paging-area">
			<% if(currentPage != 1 ) { %>
				<button onclick="location.href='<%= contextPath%>/list.bo?cpage=<%= currentPage -1 %>'" class="btn btn-sm btn-danger">&lt;</button>
			<% } %>
			<% for(int i = startPage; i <= endPage; i++) { %>
				<% if(i != currentPage) { %>
					<button onclick="location.href='<%= contextPath%>/list.bo?cpage=<%= i %>'" class="btn btn-sm btn-secondary" style="text-decoration: underline;"><%= i %></button>
				<% } else { %>
					<button class="btn btn-sm btn-secondary" style="font-weight: 700;" disabled><%= i %></button>
				<% } %>		
			
			<% } %>
			<% if(currentPage != maxPage) { %> 
				<button onclick="location.href='<%= contextPath%>/list.bo?cpage=<%= currentPage +1 %>'" class="btn btn-sm btn-danger">&gt;</button>
			<% } %>

		</div>
	
	
	
	
	
	
	
	
	







	</div>
 <br><br><br><br>
</body>
</html>