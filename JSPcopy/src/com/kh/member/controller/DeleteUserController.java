package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/deleteUser.me")
public class DeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1) POST방식이므로 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) request로부터 값 뽑기
		String userPwd = request.getParameter("userPwd");
		// 현재 로그인한 회원의 정보를 얻는 방법
		// 방법1. input type="hidden"으로 애초에 요청시 숨겨서 전달해버린다.
		// 방법2. session 영역에 담겨있는 회원객체로부터 뽑아온다.
		
		// 세션에 담겨있는 기존 로그인된 사용자의 정보를 얻어와보자!
		HttpSession session = request.getSession();
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		// 3) VO 객체에 담아서 가공 => 담을 값이 너무 적을때는 패싱 가능
		
		// 4) Service단으로 토스
		int result = new MemberService().deleteUser(userId, userPwd);
		
		// 5) 결과값을 통해 성공 실패여부에 따른 응답화면 지정
		
		
		if(result > 0) { // 성공
			// invalidate() 세션을 만료시킴
			// alert못쓴다..
			// removeAttribute()요거를 써서 로그아웃 시킨다
			session.removeAttribute("loginUser");
			// 로그아웃이 되었으므로 마이페이지가 보이면 안됌
			// 메인페이지로 보내버리자  => localhost:8001/jsp
			response.sendRedirect(request.getContextPath());
			
		}else {// 실패
			session.setAttribute("alertMsg", "회원탈퇴 실패!");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
