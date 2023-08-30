package com.camppy.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

import com.camppy.dto.DetailDTO;
import com.camppy.service.DetailService;

public class DetailController extends HttpServlet{
	
	DetailService detailService = null;
	RequestDispatcher dispatcher = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DetailController doGet()");
		doProcess(request, response);
	}//doGet

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DetailController doPost()");
		doProcess(request, response);
	}//doPost
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DetailController doProcess()");
		//가상 주소 추출
		String sPath=request.getServletPath();
		System.out.println("가상 주소: "+sPath);
		
		
		//주소 비교 -> 실제 페이지 매핑
		if(sPath.equals("/detail.de")){
			System.out.println("가상 주소 비교: /detail.de");
			
			//DetailService 객체 생성
			detailService = new DetailService();
			
			
			//DetailDTO = getDetail(request) 메서드 호출
			DetailDTO detailDTO = detailService.getDetail(request);
			
			//request에 "detailDTO", detailDTO 담아서
			request.setAttribute("detailDTO", detailDTO);
			
			//campInfo/campInfo.jsp 주소 변경 없이 이동
			dispatcher = request.getRequestDispatcher("campInfo/campInfo.jsp");
			dispatcher.forward(request, response);
		}//detail.de
		
		
		if(sPath.equals("/reserve.de")) {
			System.out.println("가상 주소 비교: /reserve.de");
			
			//DetailService 객체 생성
			detailService = new DetailService();
			
			//DetailDTO = getReserve(request) 메서드 호출
			DetailDTO detailDTO = detailService.getReserve(request);
			
			//request에 "detailDTO", detailDTO 담아서
			request.setAttribute("detailDTO", detailDTO);
			
			//campInfo/reserve.jsp 주소 변경 없이 이동
			dispatcher = request.getRequestDispatcher("campInfo/reserve.jsp");
			dispatcher.forward(request, response);
		}//reserve.de
		
		
		
		
		
		
		
		
		
		
		
		
	}//doProcess
	
}//DetailController
