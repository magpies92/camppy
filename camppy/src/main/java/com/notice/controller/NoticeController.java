package com.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.dto.NoticeDTO;
import com.notice.dto.NoticePageDTO;
import com.notice.service.NoticeService;


public class NoticeController extends HttpServlet {
		NoticeService noticeService = null;
		RequestDispatcher dispatcher = null;
		
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("NoticeController doGet()");
			doProcess(request, response);
		}
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("NoticeController doPost()");
			doProcess(request, response);
		}
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("NoticeController doProcess()");
			//가상주소 뽑아오기
			String sPath = request.getServletPath();
			System.out.println("뽑아온 가상주소:"+sPath);
			
			
			if(sPath.equals("/list.no")) {
				System.out.println("뽑은 가상주소 비교 : /list.no");
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
				
				NoticePageDTO noticePageDTO = new NoticePageDTO();
				noticePageDTO.setPageSize(pageSize);
				noticePageDTO.setPageNum(pageNum);
				noticePageDTO.setCurrentPage(currentPage);
				
				// noticeService 객체생성
				noticeService = new NoticeService();
				// List<NoitceDTO> noticeList = getNoticeList(); 메서드 호출
				List<NoticeDTO> noticeList = noticeService.getNoticeList(noticePageDTO);
				
				// 게시판 전체 글 개수 구하기 
				int count = noticeService.getNoticeCount();
				
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
				noticePageDTO.setCount(count);
				noticePageDTO.setPageBlock(pageBlock);
				noticePageDTO.setStartPage(startPage);
				noticePageDTO.setEndPage(endPage);
				noticePageDTO.setPageCount(pageCount);
				
				// request에 "boardList",boardList 저장
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("noticePageDTO", noticePageDTO);
				
				// 주소변경없이 이동 notice/noticeList/noticeList.jsp
				dispatcher = request.getRequestDispatcher("notice/noticeList/noticeList.jsp");
				dispatcher.forward(request, response);
			}//
			
			
			
			if(sPath.equals("/write.no")) {
				// 주소변경없이 이동 notice/noticeInsert/noticeInsert.jsp
				dispatcher = request.getRequestDispatcher("notice/noticeInsert/noticeInsert.jsp");
				dispatcher.forward(request, response);
			}
			if(sPath.equals("/writePro.no")) {
				System.out.println("뽑은 가상주소 비교 : /writePro.no");
				// noticeService 객체생성
				noticeService = new NoticeService();
				noticeService.insertNotice(request);
				response.sendRedirect("list.no");
			}
			
			
			
			if(sPath.equals("/content.no")) {
				System.out.println("뽑은 가상주소 비교 : /content.no");
				
				noticeService = new NoticeService();
				
				NoticeDTO noticeDTO = noticeService.getNotice(request);
				
				request.setAttribute("noticeDTO", noticeDTO);
				
				dispatcher = request.getRequestDispatcher("notice/noticeContents/noticeContents.jsp");
				dispatcher.forward(request, response);
			}
			
			
			
			if(sPath.equals("/update.no")) {
				System.out.println("뽑은 가상주소 비교 : /update.no");
				
				noticeService = new NoticeService();
				
				NoticeDTO noticeDTO = noticeService.getNotice(request);
				
				request.setAttribute("noticeDTO", noticeDTO);
				
				dispatcher = request.getRequestDispatcher("notice/noticeUpdate/noticeUpdate.jsp");
				dispatcher.forward(request, response);
				
			}
			if(sPath.equals("/updatePro.no")) {
				System.out.println("뽑은 가상주소 비교 : /updatePro.no");
				// noticeService 객체생성
				noticeService = new NoticeService();
				noticeService.updateNotice(request);
				response.sendRedirect("list.no");
			}
			
			
			
			
		}//doProcess()
		

}
