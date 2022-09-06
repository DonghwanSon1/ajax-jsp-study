<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.outer{
		background-color: rgb(139, 192, 246);
		color: white;
		width: 1000px;
		margin: auto;
		margin-top: 30px;
	}
	
	#mypage-form table {margin: auto;}
	#mypage-form input {margin: 5px;}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<%
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		
		// 필수 X => "XXXX" / "", 배열의 경우에는 선택 안할경우 null
		String phone = (loginUser.getPhone() == null) ? "" : loginUser.getPhone();
		String email = (loginUser.getEmail() == null) ? "" : loginUser.getEmail();
		String address = (loginUser.getAddress() == null) ? "" : loginUser.getAddress();
		String interest = (loginUser.getInterest() == null) ? "" : loginUser.getInterest();
		// "운동, 게임, 악기 ..."
		
	
	%>

	<div class="outer">
		
		<br>
		<h2 align="center">마이페이지</h2>


		<form id="mypage-form" action="<%= contextPath %>/update.me" method="post">
			
			<!-- 아이디, 비밀번호, 이름, 전화번호, 이메일주소, 주소, 취미 -->
			<table>
				<tr>
					<td>* 아이디</td>
					<td><input readonly type="text"required maxlength="12" name="userId" value="<%=userId %>"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="userName" maxlength="6" required value="<%=userName %>"></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;전화번호</td>
					<td><input type="text" name="phone" placeholder="- 포함해서 입력" value="<%=phone %>"></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;이메일</td>
					<td><input type="email" name="email" value="<%=email %>"></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;주소</td>
					<td><input type="text" name="address" value="<%=address %>"></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;관심분야</td>
					<td colspan="2">
						<input type="checkbox" name="interest" value="운동" id="sports"><label for="sports">운동</label>
						<input type="checkbox" name="interest" value="노래" id="song"><label for="song">노래</label>
						<input type="checkbox" name="interest" value="여행" id="travle"><label for="travle">여행</label>
						<br>
						<input type="checkbox" name="interest" value="게임" id="game"><label for="game">게임</label>
						<input type="checkbox" name="interest" value="영화" id="movie"><label for="movie">영화</label>
						<input type="checkbox" name="interest" value="악기" id="mi"><label for="mi">악기</label>
					</td>
				</tr>
			</table>
			
			<script>
				
				var interest = "<%= interest%>";
				// 모든 체크박스가 배열에 담김
				$('input[type=checkbox]').each(function(){
					// 순차적으로 접근한 checkbox의 value속성값이 interest에 포함되어있을 경우만 체크하겠다.
					// => checked속성부여 => attr(속성명, 속성값);
					
					// 자바스크립트의 indexOf => 찾고자하는 문자가 없을 경우 -1을 리턴 == Jquery의 search메서드
					// Jquery에서 value속성갑을 리턴해주는 메서드 : val()
					// Jquery에서 현재 접근한 요소 지칭 : $(this)
					
					if(interest.search($(this).val()) != -1 ){ // 포함되어있을 경우 => checked속성 부여
						$(this).attr("checked", true);
					}
				})
			</script>
		
			<br><br>

			<div align="center">
				<button type="submit" class="btn btn-secondary">정보변경</button>
				<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button>
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteUser">회원탈퇴</button>
			</div>
			
			<br><br>
		</form>
	</div>

		<!-- The Modal -->
	<div class="modal" id="updatePwdForm">
		<div class="modal-dialog">
		<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">비밀번호 변경</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
	
			<!-- Modal body -->
			<div class="modal-body">
				<form action="<%= contextPath%>/updatePwd.me" method="post">

					<!-- 현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 확인(재입력) -->
					<!-- 확실하게 주인을 판별할 수 있는  id값도 같이 넘겨줌 -->
					<input type="hidden" name="userId" value="<%= userId %>">

					<table>
						<tr>
							<td>현재 비밀번호</td>
							<td><input type="password" required name="userPwd"></td>
						</tr>
						<tr>
							<td>변경할 비밀번호</td>
							<td><input type="password" name="updatePwd" required></td>
						</tr>
						<tr>
							<td>변경할 비밀번호 재입력</td>
							<td><input type="password" name="checkPwd" required></td>
						</tr>
					</table>

					<br>

					<button type="submit" class="btn btn-sm btn-secondary" onclick="return validatePwd();">비밀번호 변경</button>
				</form>

				<script>
					function validatePwd(){

						if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
							alert("비밀번호가 일치하지 않습니다~");
							return false;
						}
						else{
							return true;
						}

					}
				</script>
				
			</div>
	
	
		</div>
		</div>
	</div>


	
			<!-- 탈퇴만들기 -->
	<div class="modal" id="deleteUser">
		<div class="modal-dialog">
		<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">회원 탈퇴</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
	
			<!-- Modal body -->
			<div class="modal-body">
				<form action="<%= contextPath%>/deleteUser.me" method="post">

					<table>
						<tr>
							<td>비밀번호 입력 </td>
							<td><input type="password" required name="userPwd"></td>
						</tr>
					</table>

					<br>

					<button type="submit" class="btn btn-sm btn-danger">회원 탈퇴</button>
				</form>
				
			</div>
	
	
		</div>
		</div>
	</div>



</body>
</html>