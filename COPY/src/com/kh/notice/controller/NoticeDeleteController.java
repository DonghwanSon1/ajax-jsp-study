package com.kh.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDeleteController
 */
@WebServlet("/delete.no")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// POST
		// 1) 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기
		// 뽑아야하는 값 : 게시글 번호 
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		// 3) 가공
		
		// 4) Service단으로 토스
		int result = new NoticeService().deleteNotice(noticeNo);
		
		// 5) 결과값에 따라 응답페이지 지정
		if(result > 0) {
			// 해당 글 상세보기 페이지로 응답뷰 지정 + alert 띄어주기
			// localhost:8001/jsp/detail.no?nno=XX
			
			request.getSession().setAttribute("alertMsg", "공지사항을 삭제했습니다.");
			response.sendRedirect(request.getContextPath() + "/list.no");
			
			
			
		}else {
			request.setAttribute("errorMsg", "공지사항 삭제 실패했습니다!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
