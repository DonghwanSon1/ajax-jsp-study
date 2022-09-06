package com.kh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.model.vo.Person;

/**
 * Servlet implementation class ELServlet
 */
@WebServlet("/el.do")
public class ELServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ELServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 그동안 수하물을 담을 때 request, session, application, page에 담았음
		// JSP내장객체(== Scope 내장객체)
		/*
		 * 데이터들을 담을 수 있는 JSP 내장객체 종류 4가지
		 * 
		 * 1. ServletContext(application scope)
		 * 한 어플리케이션(웹사이트)당 단 1개 존재하는 객체
		 * 이 영역에 데이터를 담으면 어플리케이션 전역에서 사용 가능
		 * => 공유 범위가 가장 크다.
		 * 
		 * 2. HttpSession (session scope)
		 * 한 브라우저당 1개 존재하는 객체
		 * 이 영역에 데이터를 담으면 jsp/servlet단에서 사용 가능
		 * 값이 한번 담기면 서버가 멈추거나, 브라우저가 닫히기 전까지 사용 가능 (로그인 기능)
		 * => 공유범위가 다소 제한적
		 * 
		 * 3. HttpServletRequest(request scope)
		 * 요청 및 응답 시 매번 생성되는 객체
		 * 이 영역에 데이터를 담으면 해당 request객체를
		 * 포워딩 받는 응답 jsp에서만 사용 가능 
		 * => 공유범위가 해당 요청에 대한 응답 jsp 단 하나뿐(1회성)
		 * 
		 * 4. PageContext(page scope)
		 * 현재 그 jsp페이지에서만 사용 가능
		 * => 공유범위가 가장 작음
		 * 
		 * 
		 * => 위에 객체들에 값을 담을 때는 -> .setAttribute("키","벨류");
		 * 				값을 뽑을 때는 -> .getAttribute("키"); (Object타입으로)
		 * 			      지우고자 할때는 -> .removeAttribute("키");
		 * 
		 * 
		 */
		
		// requestScope에 담기
		request.setAttribute("classRoom", "C강의장");
		request.setAttribute("student", new Person("김정길", 31, "남자"));
		
		// sessionScope에 담기
		HttpSession session = request.getSession();
		session.setAttribute("academy", "KH정보교육원");
		session.setAttribute("teacher", new Person("이승철", 34, "남자"));
		
		// 항상 키값은 중복X (덮어씌워졌었음) 
		// 테스트 : requestScope와 sessionScope에 동일한 키값으로 데이터 담으면?? 
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		
		// applicationScope에 담기
		ServletContext application = request.getSession().getServletContext();
		application.setAttribute("scope", "application");
		
		// 수하물 다 붙였으면 응답 뷰 지정
		// => 포워딩(파일 경로 제시할 때), 리다이렉션(contextPath로 부터 시작하는 찐 url방식을 요청 보낼 경우)
		RequestDispatcher view = request.getRequestDispatcher("views/1_EL/01_el.jsp");
		view.forward(request, response);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
