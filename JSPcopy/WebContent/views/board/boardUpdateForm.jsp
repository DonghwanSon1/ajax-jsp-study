<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.kh.board.model.vo.*" %>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
	Board b = (Board)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
		.outer{
		background-color: rgb(139, 192, 246);
		color: white;
		width: 1000px;
		height: 800px;
		margin: auto;
		margin-top: 50px;
	}
	#update-form>table{border: 2px solid white;}
	#update-form input, #update-form textarea{
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
        <h2 align="center">일반게시글 수정하기</h2>
        <br>
		
		<!-- 파일을 첨부하는 요청을 할 때는 반드시 enctype="multipart/form-data"를 추가해야한다. -->
        <form id="update-form" enctype="multipart/form-data" action="<%=contextPath %>/update.bo" method="post">
            
            <input type="hidden" value="<%= b.getBoardNo() %>" name="bno">
            
            <!-- 제목, 내용, 카테고리, 첨부파일 입력받기  + userNo -->
            <table align="center" border="2">
                <tr>
                    <th width="70">카테고리</th>
                    <td width="600">
                        <select name="category">
                        	<% for(Category c : list) { %>
                            	<option value="<%=c.getCategoryNo() %>"><%= c.getCategoryName() %></option>
                        	<% } %>
                        </select>
                        <script>
                        	$(function(){
								
                        		$("#update-form option").each(function(){
									// 지금돌고 있는 옵션태그의 카테고리명이랑 보드객체에 있는 카테고리랑 동일하면?	
                        			if($(this).text() == "<%=b.getCategory() %>"){
                     					$(this).attr("selected", "true")   				
                        			}
                        		})
                        	})
                        </script>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" value="<%= b.getBoardTitle() %>" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content" rows="10" required style="resize: none;"><%=b.getBoardContent() %></textarea>
                    </td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <!-- 기존파일이 있다면 원본명을 보여주자 ex) aaa.jpg-->
					<td>
						&nbsp;<% if(at != null) { %>
							<%=at.getOriginName() %>
							<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
							<input type="hidden" name="originFileName" value="<%= at.getChangeName() %>">
							
						<% } %>					
                    <!-- 기존파일이 없다면 -->
                    <input type="file" name="reUpfile">
					</td>
                </tr>
            </table>
            <br><br>

            <div align="center">
                <button type="submit">수정하기</button>
                <button type="reset">취소하기</button>
            </div>
        </form>
    
    
    </div>

</body>
</html>