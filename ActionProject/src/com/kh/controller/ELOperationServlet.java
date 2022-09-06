package com.kh.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.model.vo.Person;

/**
 * Servlet implementation class ELOperationServlet
 */
@WebServlet("/operation.do")
public class ELOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ELOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 테스트 할 수 있는 값 넘기기
		
		request.setAttribute("big", 10);
		request.setAttribute("small", 3); // 산술, 비교
		
		request.setAttribute("sOne", "안녕");
		request.setAttribute("sTwo", new String ("안녕"));
		
		request.setAttribute("pOne", new Person("홍길동", 10, "남자"));
		request.setAttribute("pTwo", null);
		
		ArrayList<String> list1 = new ArrayList<>();
		request.setAttribute("1One", list1);
		
		ArrayList<String> list2	= new ArrayList<>();
		list2.add("면접준비!!!");
		request.setAttribute("1Two", list2);
		
		// 여기까지 requestScope에 총 8쌍의 값이 담겨있음
		request.getRequestDispatcher("views/1_EL/01_elOperation.jsp").forward(request, response);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
