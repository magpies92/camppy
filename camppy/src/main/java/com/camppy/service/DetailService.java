package com.camppy.service;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.multi.MultiButtonUI;

import com.camppy.dao.DetailDAO;
import com.camppy.dto.DetailDTO;

public class DetailService {
	
	DetailDAO detailDAO = null;

	public DetailDTO getDetail(HttpServletRequest request) {
		System.out.println("DetailDTO getDetail()" );
		
		DetailDTO detailDTO = null;
		
		try {
			// request 한글 처리
			request.setCharacterEncoding("utf-8");
			
			//request 파라미터 값 가져오기 -> String campId
			int campId = Integer.parseInt(request.getParameter("campId"));
			
			
			//DetailDAO 객체 생성
			//detailDTO = getDetail(campid) 메서드 호출
			detailDAO=new DetailDAO();
			detailDTO=detailDAO.getDetail(campId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return detailDTO;
	}//getDetail()

	public DetailDTO getPosition(HttpServletRequest request) {
		System.out.println("DetailDTO getPosition()" );
		DetailDTO detailDTO = null;
		
		try {
			//request 한글 처리
			request.setCharacterEncoding("utf-8");
			
			//request 파라미터 가져오기 -> int camp_id
			int campId = Integer.parseInt(request.getParameter("campId"));
			
			
			//DetailDAO 객체 생성
			//detailDTO = getDetail(campid) 메서드 호출
			detailDAO=new DetailDAO();
			detailDTO=detailDAO.getPosition(campId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return detailDTO;
	}//getPosition()

	
	
	
	
	
	
}//DetailService
