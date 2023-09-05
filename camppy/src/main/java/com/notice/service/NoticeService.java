package com.notice.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.notice.dao.NoticeDAO;
import com.notice.dto.NoticeDTO;
import com.notice.dto.NoticePageDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			int count = 0;
			try {
				// NoticeDAO 객체생성
				noticeDAO = new NoticeDAO();
				// count = getNoticeCount() 호출
				 count = noticeDAO.getNoticeCount();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return count;
		} // getNoticeCount

		
		public void insertNotice(HttpServletRequest request) {
			try {
				System.out.println("NoticeService insertNotice()");
				
				request.setCharacterEncoding("utf-8");
				
				String create_by = request.getParameter("create_by");
				String post_type = request.getParameter("post_type");
				String title = request.getParameter("title");
				String member_id = request.getParameter("member_id");
				String content = request.getParameter("content");
				String image_url = request.getParameter("image_url");
				int notice_cnt = 0;
				Timestamp create_date = new Timestamp(System.currentTimeMillis());
				Timestamp last_modified_date = new Timestamp(System.currentTimeMillis());
				
				noticeDAO = new NoticeDAO();
				int notice_id = noticeDAO.getMaxNotice_id() +1;
				
				NoticeDTO noticeDTO = new NoticeDTO();
				
				noticeDTO.setNotice_id(notice_id);
				noticeDTO.setCreated_by(create_by);
				noticeDTO.setPost_type(post_type);
				noticeDTO.setTitle(title);
				noticeDTO.setMember_id(member_id);
				noticeDTO.setContent(content);
				noticeDTO.setImage_url(image_url);
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
		}

		public void finsertNotice(HttpServletRequest request) {
			System.out.println("NoticeService finsertNotice()");
			try {
				String uploadPath = request.getRealPath("/upload");
				
				System.out.println(uploadPath);
				
				int maxSize=10*1024*1024; 
				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize,"utf-8", new DefaultFileRenamePolicy()); 
				
				
				request.setCharacterEncoding("utf-8");
				
				String create_by = multi.getParameter("create_by");
				String post_type = multi.getParameter("post_type");
				String title = multi.getParameter("title");
				String member_id = multi.getParameter("member_id");
				String content = multi.getParameter("content");
				String image_url = multi.getParameter("image_url");
//				String file = multi.getFilesystemName("file");
				int notice_cnt = 0;
				Timestamp create_date = new Timestamp(System.currentTimeMillis());
				Timestamp last_modified_date = new Timestamp(System.currentTimeMillis());
				
				noticeDAO = new NoticeDAO();
				int notice_id = noticeDAO.getMaxNotice_id() +1;
				
				NoticeDTO noticeDTO = new NoticeDTO();
				
				noticeDTO.setNotice_id(notice_id);
				noticeDTO.setCreated_by(create_by);
				noticeDTO.setPost_type(post_type);
				noticeDTO.setTitle(title);
				noticeDTO.setMember_id(member_id);
				noticeDTO.setContent(content);
				noticeDTO.setImage_url(image_url);
				noticeDTO.setNotice_cnt(notice_cnt);
				noticeDTO.setCreate_date(create_date);
				noticeDTO.setLast_modified_date(last_modified_date);
				
//				// 첨부파일
//				noticeDTO.setFile(file);

				noticeDAO.insertBoard(noticeDTO);

				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}

		public void fupdateNotice(HttpServletRequest request) {
			System.out.println("NoticeService fupdateNotice()");
			try {
				String uploadPath = request.getRealPath("/upload");
				
				int maxSize=10*1024*1024;
				MultipartRequest multi = new MultipartRequest(request, uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
				int notice_id = Integer.parseInt(multi.getParameter("notice_id"));
				String create_by = multi.getParameter("create_by");
				String post_type = multi.getParameter("post_type");
				String title = multi.getParameter("title");
				String member_id = multi.getParameter("member_id");
				String content = multi.getParameter("content");
				String image_url = multi.getParameter("image_url");
//				String file = multi.getFilesystemName("file");
//				String file = multi.getFilesystemName("file");
//				if(file == null) {
//					file = multi.getParameter("oldfile");
//				}
				
				NoticeDTO noticeDTO = new NoticeDTO(); 
				
				noticeDTO.setNotice_id(notice_id);
				noticeDTO.setCreated_by(create_by);
				noticeDTO.setPost_type(post_type);
				noticeDTO.setTitle(title);
				noticeDTO.setMember_id(member_id);
				noticeDTO.setContent(content);
				noticeDTO.setImage_url(image_url);
//				// 첨부파일
//				noticeDTO.setFile(file);
				
				noticeDAO = new NoticeDAO();
				

						
						
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} // fupdateNotice
		

		// 첨부파일
		
		
		
		
}
