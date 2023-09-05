package com.notice.service;

import java.util.List;

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
			
			// NoticeDAO 객체생성
			questionDAO = new QuestionDAO();
			// noticeList = getNoticeList() 메서드 호출
			questionList = questionDAO.getQuestionList(questionPageDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return questionList;
	}

	public int getNoticeCount() {
		System.out.println("QuestionService getQuestionCount()");
		int count = 0;
		try {
			// NoticeDAO 객체생성
			questionDAO = new QuestionDAO();
			// count = getNoticeCount() 호출
			 count = questionDAO.getQuestionCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
