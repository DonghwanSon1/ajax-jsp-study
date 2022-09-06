<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.board.model.vo.*" %>

<%
    Board b = (Board)request.getAttribute("b");
	// 게시글번호, 카테고리명, 제목, 내용, 작성자 아이디, 작성일
	Attachment at = (Attachment)request.getAttribute("at");
	// 파일번호, 원본명, 수정명, 저장경로
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 상세 페이지</title>
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
        <h2 align="center">일반게시판 상세보기</h2>
        <br>

        <table id="detail-area" align="center" border="1">

            <tr>
                <th width="70">카테고리</th>
                <td width="70"><%= b.getCategory() %></td>
                <th width="70">제목</th>
                <td width="370"><%= b.getBoardTitle() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= b.getBoardWriter() %></td>
                <th>작성일</th>
                <td><%= b.getCreateDate() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height: 200px;"><%= b.getBoardContent() %></p>
                </td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td align="left" colspan="3">
                    <!-- 첨부파일이 없을수도 있다-->
				    <% if(at == null) { %>                
				                    첨부파일이 없습니다. <br>
				    <% } else { %>
                    	<!-- 첨부파일이 있을수도 있다. -->
                        &nbsp; 첨부파일 &nbsp; : &nbsp;
                    	<a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%=at.getFilePath()%>/<%=at.getChangeName()%>"><%= at.getOriginName() %></a>
                	<% } %>
                </td>
            </tr>
        </table>
        
        <br>

        
        <div align="center">
            <a href="<%= contextPath %>/list.bo?cpage=1" class="btn btn-sm btn-secondary">목록</a>
            
            <!-- 로그인한 사용자고 그리고 현재 이 게시글의 작성자일 경우에만 수정하기 삭제하기 보여지게끔해보자 -->
            <% if(loginUser != null && b.getBoardWriter().equals(loginUser.getUserName())) { %>
        
                <a href="<%= contextPath %>/updateForm.bo?bno=<%= b.getBoardNo() %>" class="btn btn-sm btn-secondary">수정하기</a>
                <button data-toggle="modal" data-target="#myModal" class="btn btn-sm btn-secondary">삭제하기</button>
                <% } %>
                
            </div>
            
        </div>
        <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
    
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">삭제하시겠습니까??</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
    
        <!-- Modal footer -->
        <div class="modal-footer">
            <a href="<%= contextPath %>/delete.bo?bno=<%=b.getBoardNo() %>" class="btn btn-sm btn-secondary">삭제하기</a>
            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
        </div>
        
    </div>
    </div>
    </div>





</body>
</html>