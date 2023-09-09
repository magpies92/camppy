package com.notice.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.notice.dao.NoticeDAO;
import com.notice.dto.NoticeDTO;
import com.notice.dto.NoticePageDTO;


public class NoticeService {
		NoticeDAO noticeDAO = null;

		public List<NoticeDTO> getNoticeList(NoticePageDTO noticePageDTO) {
			System.out.println("NoticeService getNoticeList()");
			List<NoticeDTO> noticeList = null;
			try {
				// 시작하는 행부터 10개 뽑아오기
				int startRow = (noticePageDTO.getCurrentPage()-1)*noticePageDTO.getPageSize()+1;
				
				// 시작하는 행부터 끝나는 행까지 뽑아오기
				int endRow = startRow+noticePageDTO.getPageSize()-1;
				//pageDTO 저장 <= startRow, endRow
				noticePageDTO.setStartRow(startRow);
				noticePageDTO.setEndRow(endRow);
				
				// NoticeDAO 객체생성
				noticeDAO = new NoticeDAO();
				// noticeList = getNoticeList() 메서드 호출
				noticeList = noticeDAO.getNoticeList(noticePageDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return noticeList;
		} // getNoticeList

		public int getNoticeCount() {
			System.out.println("NoticeService getNoticeCount()");
			int notice_cnt = 0;
			try {
				// NoticeDAO 객체생성
				noticeDAO = new NoticeDAO();
				// notice_cnt = getNoticeCount() 호출
				notice_cnt = noticeDAO.getNoticeCount();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return notice_cnt;
		} // getNoticeCount

		
		public void insertNotice(HttpServletRequest request) {
			try {
				System.out.println("NoticeService insertNotice()");
				
				request.setCharacterEncoding("utf-8");
				
				String created_by = request.getParameter("created_by");
				int post_type = Integer.parseInt(request.getParameter("post_type"));
				String title = request.getParameter("title");
				int member_id = Integer.parseInt(request.getParameter("member_id"));
				String content = request.getParameter("content");
				int notice_cnt = 0;
				Timestamp create_date = new Timestamp(System.currentTimeMillis());
				Timestamp last_modified_date = new Timestamp(System.currentTimeMillis());
				
				noticeDAO = new NoticeDAO();
//				int notice_id = noticeDAO.getMaxNotice_id() +1;
				System.out.println("member_id" + member_id);
				NoticeDTO noticeDTO = new NoticeDTO();
				
//				noticeDTO.setNotice_id(notice_id);
				noticeDTO.setCreated_by(created_by);
				noticeDTO.setPost_type(post_type);
				noticeDTO.setTitle(title);
				noticeDTO.setMember_id(member_id);
				noticeDTO.setContent(content);
				noticeDTO.setNotice_cnt(notice_cnt);
				noticeDTO.setCreate_date(create_date);
				noticeDTO.setLast_modified_date(last_modified_date);
				
				
				noticeDAO.insertNotice(noticeDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} // insertNotice

		public NoticeDTO getNotice(HttpServletRequest request) {
			System.out.println("NoticeService getNotice()");
			NoticeDTO noticeDTO = null;
			try {
				request.setCharacterEncoding("utf-8");
				
				int notice_id = Integer.parseInt(request.getParameter("notice_id"));
					 
				noticeDAO = new NoticeDAO();
				
				noticeDTO = noticeDAO.getNotice(notice_id);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return noticeDTO;
		} // getNotice



		
		
		public void updateNotice(HttpServletRequest request) {
			System.out.println("NoticeService updateNotice()");
			
			try {
				request.setCharacterEncoding("utf-8");
				
				int notice_id = Integer.parseInt(request.getParameter("notice_id"));
				String created_by = request.getParameter("created_by");
				int post_type = Integer.parseInt(request.getParameter("post_type"));
				String title= request.getParameter("title");
				String content= request.getParameter("content");
				
				NoticeDTO noticeDTO = new NoticeDTO();
				
				noticeDTO.setNotice_id(notice_id);
				noticeDTO.setCreated_by(created_by);
				noticeDTO.setPost_type(post_type);
				noticeDTO.setTitle(title);
				noticeDTO.setContent(content);
				
				
				noticeDAO = new NoticeDAO();
				
				noticeDAO.updateNotice(noticeDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} // updateNotice

		public void deleteNotice(HttpServletRequest request) {
			System.out.println("NoticeService deleteNotice()");
			try {
				request.setCharacterEncoding("utf-8");
				
				int notice_id = Integer.parseInt(request.getParameter("notice_id"));
				noticeDAO = new NoticeDAO();
				noticeDAO.deleteNotice(notice_id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} //  deleteNotice

		public void notice_cnt(HttpServletRequest request) {
			System.out.println("NoticeService notice_cnt");
			try {
				request.setCharacterEncoding("utf-8");
				
				int notice_id = Integer.parseInt(request.getParameter("notice_id"));
	 
				noticeDAO = new NoticeDAO();
				
				noticeDAO.notice_cnt(notice_id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		
		
		
}
