<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String contextPath = request.getContextPath();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나는 메뉴바다</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

    #login-form, #user-info {float: right;}

    #user-info a{
        text-decoration: none;
        color: black;
        font-size: 12px;
    }

    .nav-area{background-color: darkcyan;}
    .menu{
        display: table-cell;
        height: 50px;
        width: 150px;
    }
    .menu a{
        text-decoration: none;
        color: white;
        font-size: 20px;
        font-weight: bold;
        display: block;
        width: 100%;
        height: 100%;
        line-height: 50px;
    }
    
    .menu a:hover{background-color: rgb(0, 80, 82);}




</style>
</head>
<body>
	
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg"/>
	</c:if>

	<h1 align="center">자~ 드가자</h1>
	
	<div class="login-area">
	
	<c:choose >
	   <c:when test="${ empty loginUser }">		
			<form id="login-form" method="post" action="<%=contextPath %>/login.me">
				<table>
					<tr>
	                    <th>아이디</th>
	                    <td><input type="text" name="userId" required></td>
	                </tr>
	                <tr>
	                    <th>비밀번호</th>
	                    <td><input type="password" name="userPwd" required></td>
	                </tr>
	                <tr>
	                    <th colspan="2">
	                        <button type="submit">로그인</button>
	                        <button type="button" onclick="enrollPage()">회원가입</button>
	                    </th>
	                </tr>
					
				</table>
			</form>
			<script>
				function enrollPage(){
					// location.href = "<%= contextPath%>/views/member/memberEnrollForm.jsp";
					location.href = "<%= contextPath %>/enrollForm.me";
				}
			</script>
			</c:when>
		<c:otherwise>			
	        <div id="user-info">
	            <b> ${loginUser.getUserName() }</b>님 환영합니다.<br><br>
	            <div align="center">
	                <a href="<%=contextPath %>/myPage.me">마이페이지</a>
	                <a href="<%=contextPath %>/logout.me">로그아웃</a>
	            </div>
	        </div>
	     </c:otherwise>
	
	</c:choose>




	</div>

    <br clear="both"><br>
    <div class="nav-area" align="center">
        <div class="menu"><a href="<%=contextPath %>">HOME</a></div>
        <div class="menu"><a href="<%=contextPath%>/list.no">공지사항</a></div>
        <div class="menu"><a href="<%=contextPath%>/list.bo?cpage=1">일반게시판</a></div>
        <div class="menu"><a href="<%=contextPath%>/list.th">사진게시판</a></div>
    </div>







</body>
</html>