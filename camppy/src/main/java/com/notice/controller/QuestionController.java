package com.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notice.dto.QuestionDTO;
import com.notice.dto.QuestionPageDTO;
import com.notice.service.QuestionService;

import camppy.member.MemberDTO;
import camppy.member.MemberService;

public class QuestionController extends HttpServlet{
		QuestionService questionService = null;
		RequestDispatcher dispatcher = null;
		MemberService memberService = null;
		
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
				
				// questionService 객체생성
				questionService = new QuestionService();
				// List<QuestionDTO> NoticeController.java = getQuestionList(); 메서드 호출
				List<QuestionDTO> questionList = questionService.getQuestionList(questionPageDTO);
				
				// 게시판 전체 글 개수 구하기 
				int count = questionService.getQuestionCount();
				
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
				
				// questionPageDTO 저장
				questionPageDTO.setCount(count);
				questionPageDTO.setPageBlock(pageBlock);
				questionPageDTO.setStartPage(startPage);
				questionPageDTO.setEndPage(endPage);
				questionPageDTO.setPageCount(pageCount);
				
				// request에 "questionList",questionList 저장
				request.setAttribute("questionList", questionList);
				request.setAttribute("questionPageDTO", questionPageDTO);
				
				// 주소변경없이 이동 notice/questionList/questionList.jsp
				dispatcher = request.getRequestDispatcher("notice/questionList/questionList.jsp");
				dispatcher.forward(request, response);
			}//
			
			
			
			if(sPath.equals("/write.qu")) {
				HttpSession session = request.getSession();
				String id = (String)session.getAttribute("id");
				
				memberService = new MemberService();
				MemberDTO  memberDTO =memberService.getMember(id);
				request.setAttribute("memberDTO", memberDTO);
				
				// 주소변경없이 이동 notice/noticeInsert/noticeInsert.jsp
				dispatcher = request.getRequestDispatcher("notice/questionInsert/questionInsert.jsp");
				dispatcher.forward(request, response);
			}
			if(sPath.equals("/writePro.qu")) {
				System.out.println("뽑은 가상주소 비교 : /writePro.qu");
				// questionService 객체생성
				questionService = new QuestionService();
				questionService.insertQuestion(request);
				response.sendRedirect("list.qu");
			}
			
			
			
			if(sPath.equals("/content.qu")) {
				System.out.println("뽑은 가상주소 비교 : /content.qu");
				
				questionService = new QuestionService();
				
				questionService.notice_cnt(request);
				
				QuestionDTO questionDTO = questionService.getQuestion(request);
				
				request.setAttribute("questionDTO", questionDTO);
				
				dispatcher = request.getRequestDispatcher("notice/questionContents/questionContents.jsp");
				dispatcher.forward(request, response);
			}
			
			
			
			if(sPath.equals("/update.qu")) {
				System.out.println("뽑은 가상주소 비교 : /update.qu");
				
				questionService = new QuestionService();
				
				QuestionDTO questionDTO = questionService.getQuestion(request);
				
				request.setAttribute("questionDTO", questionDTO);
				
				dispatcher = request.getRequestDispatcher("notice/questionUpdate/questionUpdate.jsp");
				dispatcher.forward(request, response);
				
			}
			if(sPath.equals("/updatePro.qu")) {
				System.out.println("뽑은 가상주소 비교 : /updatePro.qu");
				// noticeService 객체생성
				questionService = new QuestionService();
				questionService.updateQuestion(request);
				response.sendRedirect("list.qu");
			}
			
			
			
			if(sPath.equals("/delete.qu")) {
				System.out.println("뽑은 가상주소 비교 : /delete.qu");
				// noticeService 객체생성
				questionService = new QuestionService();
				questionService.deleteQuestion(request);
				response.sendRedirect("list.qu");
			}
		}
		
}
