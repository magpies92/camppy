package com.notice.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.notice.dao.QuestionDAO;
import com.notice.dto.QuestionDTO;
import com.notice.dto.QuestionPageDTO;

public class QuestionService {
	QuestionDAO questionDAO = null;
	
	public List<QuestionDTO> getQuestionList(QuestionPageDTO questionPageDTO) {
		System.out.println("QuestionService getQuestionList()");
		List<QuestionDTO> questionList = null;
		try {
			// 시작하는 행부터 10개 뽑아오기
			int startRow = (questionPageDTO.getCurrentPage()-1)*questionPageDTO.getPageSize()+1;
			
			// 시작하는 행부터 끝나는 행까지 뽑아오기
			int endRow = startRow+questionPageDTO.getPageSize()-1;
			//pageDTO 저장 <= startRow, endRow
			questionPageDTO.setStartRow(startRow);
			questionPageDTO.setEndRow(endRow);
			
			// questionDAO 객체생성
			questionDAO = new QuestionDAO();
			// questionList = getQuestionList() 메서드 호출
			questionList = questionDAO.getQuestionList(questionPageDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return questionList;
	}

	public int getQuestionCount() {
		System.out.println("QuestionService getQuestionCount()");
		int notice_cnt = 0;
		try {
			// questionDAO 객체생성
			questionDAO = new QuestionDAO();
			// notice_cnt = getNoticeCount() 호출
			notice_cnt = questionDAO.getQuestionCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return notice_cnt;
	} // getQuestionCount
	
	
	
	public void insertQuestion(HttpServletRequest request) {
		try {
			System.out.println("QuestionService insertQuestion()");
			
			request.setCharacterEncoding("utf-8");
			
			String created_by = request.getParameter("created_by");
			int post_type = Integer.parseInt(request.getParameter("post_type"));
			String title = request.getParameter("title");
			int member_id = Integer.parseInt(request.getParameter("member_id"));
			String content = request.getParameter("content");
			int notice_cnt = 0;
			Timestamp create_date = new Timestamp(System.currentTimeMillis());
			Timestamp last_modified_date = new Timestamp(System.currentTimeMillis());
			
			questionDAO = new QuestionDAO();
			System.out.println("member_id" + member_id);
			QuestionDTO questionDTO = new QuestionDTO();
			
			questionDTO.setCreated_by(created_by);
			questionDTO.setPost_type(post_type);
			questionDTO.setTitle(title);
			questionDTO.setMember_id(member_id);
			questionDTO.setContent(content);
			questionDTO.setNotice_cnt(notice_cnt);
			questionDTO.setCreate_date(create_date);
			questionDTO.setLast_modified_date(last_modified_date);
			
			
			questionDAO.insertQuestion(questionDTO);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // insertQuestion
	
	
	public QuestionDTO getQuestion(HttpServletRequest request) {
		System.out.println("QuestionService getQuestion()");
		QuestionDTO questionDTO = null;
		try {
			request.setCharacterEncoding("utf-8");
			
			int inquriy_id = Integer.parseInt(request.getParameter("inquriy_id"));
				 
			questionDAO = new QuestionDAO();
			
			questionDTO = questionDAO.getQuestion(inquriy_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return questionDTO;
	} // getQuestion



	
	
	public void updateQuestion(HttpServletRequest request) {
		System.out.println("QuestionService updateQuestion()");
		
		try {
			request.setCharacterEncoding("utf-8");
			
			int inquriy_id = Integer.parseInt(request.getParameter("inquriy_id"));
			String created_by = request.getParameter("created_by");
			int post_type = Integer.parseInt(request.getParameter("post_type"));
			String title= request.getParameter("title");
			String content= request.getParameter("content");
			
			QuestionDTO questionDTO = new QuestionDTO();
			
			questionDTO.setInquriy_id(inquriy_id);
			questionDTO.setCreated_by(created_by);
			questionDTO.setPost_type(post_type);
			questionDTO.setTitle(title);
			questionDTO.setContent(content);
			
			
			questionDAO = new QuestionDAO();
			
			questionDAO.updateQuestion(questionDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // updateQuestion

	public void deleteQuestion(HttpServletRequest request) {
		System.out.println("QuestionService deleteQuestion()");
		try {
			request.setCharacterEncoding("utf-8");
			
			int inquriy_id = Integer.parseInt(request.getParameter("inquriy_id"));
			questionDAO = new QuestionDAO();
			questionDAO.deleteQuestion(inquriy_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} //  deleteQuestion

	public void notice_cnt(HttpServletRequest request) {
		System.out.println("QuestionService notice_cnt()");
		try {
			request.setCharacterEncoding("utf-8");
			
			int inquriy_id = Integer.parseInt(request.getParameter("inquriy_id"));
			
			questionDAO = new QuestionDAO();
			
			questionDAO.notice_cnt(inquriy_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
