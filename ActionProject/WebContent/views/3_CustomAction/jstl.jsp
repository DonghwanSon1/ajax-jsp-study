<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 페이지</title>
</head>
<body>


	<h1>JSTL이란?</h1>
	
	<p>
		JSP Standard Tag Library의 약자로 JSP에서 사용되는 커스텀 액션 태그 <br>
		공통적으로 사용되는 코드들의 집합을 보다 쉽게 사용할 수 있도록 태그화 해서 표준으로 제공하는 라이브러리
	</p>
	
	<hr>
	
	<h3>* 라이브러리 다운로드 후 추가 방법</h3>
	1) https://tomcat.apache.org/download-taglibs.cgi 접속 <br>
	2) Standard-1.2.5 Jar files 4개 다 다운로드 <br>
	3) WEB-INF/lib 폴더에 추가 <br>

	<h3>* JSTL 선언방법</h3>
	
	<p>
		JSTL을 사용하고자하는 해당 jsp페이지 상단에 <br>
		taglib 지시어를 사용해서 선언함 <br>
		
		[ 표현법 ]
		&lt;%@ taglib prefix="접두어" uri="라이브러리 파일상의 uri주소" %&gt;
	</p>

	<hr>
	
	<h3> * JSTL 분류</h3>
	
	<h4>1. JSTL Core Library</h4>
	
	<p>
		변수와 조건무, 반복문 등의 로직과 관련된 문법을 제공
	</p>

	<a href="01_core.jsp">core library</a>
	
	<br>
	
	<h4>2. JSTL Formatting Library</h4>
	
	<p>
		숫자, 날짜 및 시간 데이터의 출력 형식을 지정할 때 사용하는 문법을 제공
	</p>

	<a href="02_formatting.jsp">formatting library</a>
	
	<br>

	
	<h4> 3. JSTL Functions Library</h4>
	
	<p>
		EL구문안에서 메소드 사용가능
	</p>

	<a href="03_functions.jsp">functions library</a>


</body>
</html>