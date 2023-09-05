package com.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.dto.QuestionDTO;
import com.notice.dto.QuestionPageDTO;
import com.notice.service.QuestionService;

public class QuestionController extends HttpServlet{
		QuestionService questionService = null;
		RequestDispatcher dispatcher = null;
		
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("QuestionController doGet()");
			doProcess(request, response);
		}
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("QuestionController doPost()");
			doProcess(request, response);
		}
		
		
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("QuestionController doProcess()");
			//가상주소 뽑아오기
			String sPath = request.getServletPath();
			System.out.println("뽑아온 가상주소:"+sPath);
			
			if(sPath.equals("/list.qu")) {
				System.out.println("뽑은 가상주소 비교 : /list.qu");
				// 한페이지에서 보여지는 글개수 설정
				int pageSize = 10;
				// 페이지번호 
				String pageNum=request.getParameter("pageNum");
				// 페이지번호가 없으면 1페이지 설정
				if(pageNum == null) {
					pageNum = "1";
				}
				
				// 페이지 번호를 => 정수형 변경
				int currentPage = Integer.parseInt(pageNum);
				
				QuestionPageDTO questionPageDTO = new QuestionPageDTO();
				questionPageDTO.setPageSize(pageSize);
				questionPageDTO.setPageNum(pageNum);
				questionPageDTO.setCurrentPage(currentPage);
				
				// noticeService 객체생성
				questionService = new QuestionService();
				// List<NoitceDTO> noticeList = getNoticeList(); 메서드 호출
				List<QuestionDTO> questionList = questionService.getQuestionList(questionPageDTO);
				
				// 게시판 전체 글 개수 구하기 
				int count = questionService.getNoticeCount();
				
				// 한 화면에 보여줄 페이지 개수 설정
				int pageBlock = 10;
				
				// 시작하는 페이지 번호
				int startPage = (currentPage-1)/pageBlock*pageBlock+1;
				
				// 끝나는 페이지 번호 
				int endPage = startPage+pageBlock+1;
				int pageCount = count / pageSize + (count % pageSize == 0?0:1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				
				// noticepageDTO 저장
				questionPageDTO.setCount(count);
				questionPageDTO.setPageBlock(pageBlock);
				questionPageDTO.setStartPage(startPage);
				questionPageDTO.setEndPage(endPage);
				questionPageDTO.setPageCount(pageCount);
				
				// request에 "boardList",boardList 저장
				request.setAttribute("questionList", questionList);
				request.setAttribute("questionPageDTO", questionPageDTO);
				
				// 주소변경없이 이동 center/notice.jsp
				dispatcher = request.getRequestDispatcher("notice/questionList/questionList.jsp");
				dispatcher.forward(request, response);
			}//
			
			
		}
		
}
