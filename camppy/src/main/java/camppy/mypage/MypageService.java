package camppy.mypage;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.camppy.dao.DetailDAO;

import camppy.main.action.PageDTO;
import camppy.reserve.dao.ReserveDetailDAO;
import camppy.reserve.dao.ReserveDetailDTO;

public class MypageService {
	
	LikeDAO likeDAO = null;

	
	public List<LikeDTO> getLikeList(PageDTO pageDTO) {
		System.out.println("MypageService getLikeList()");
		List<LikeDTO> likeList=null;
		try {
			//시작하는 행부터 10개 추출
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			
			//시작하는 행부터 끝나는 행까지 추출
			int endRow = startRow+pageDTO.getPageSize()-1;
			
			//pageDTO 저장 startRow, endRow
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			//LikeDAO 객체 생성
			likeDAO = new LikeDAO();
			//likeList = likeDAO.getLikeList() 메서드 호출
			likeList = likeDAO.getLikeList(pageDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return likeList;
	}//getLikeList

	
	public int getLikeCount(PageDTO pageDTO) {
		System.out.println("MypageService getLikeCount()");
		int count=0;
		try {
			//LikeDAO 객체 생성
			likeDAO = new LikeDAO();
			//count=getLikeCount() 호출
			count=likeDAO.getLikeCount(pageDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getLikeCount()
	
	
	public void insertLike(HttpServletRequest request) {
		System.out.println("ReserveService insertLike()");
		try {
			// http://localhost:8080/webProject/jsp3/insertPro.jsp?id=kim&pass=123&name=홍길동
			//사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
			//request 한글처리
			/* request.setCharacterEncoding("utf-8"); */
			// request id, pass,name 가져와서 -> 변수에 저장
			
			int member_id =Integer.parseInt(request.getParameter("member_id")); 
			int camp_id =Integer.parseInt(request.getParameter("camp_id"));
			System.out.println("멤버아이디테스트"+member_id);
			System.out.println("캠프아이디테스트"+camp_id);
			/* int camp_like_id =Integer.parseInt(request.getParameter("camp_like_id")); */		
			LikeDTO likeDTO = new LikeDTO();
			likeDTO.setMember_id(member_id);
			likeDTO.setCamp_id(camp_id);
			/* likeDTO.setCamp_like_id(camp_like_id); */

			// ReserveDetailDAO 객체생성
			likeDAO = new LikeDAO();
			// reserveDetailDTO = reserveDetailDTO() 메서드 호출
			likeDAO.insertLike(likeDTO);
			
			/* int likeId=likeDAO.getMaxLikeId() +1; */
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteLike(HttpServletRequest request) {
		System.out.println("ReserveService insertLike()");
		try {
			// http://localhost:8080/webProject/jsp3/insertPro.jsp?id=kim&pass=123&name=홍길동
			//사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
			//request 한글처리
			/* request.setCharacterEncoding("utf-8"); */
			// request id, pass,name 가져와서 -> 변수에 저장
			
			 int member_id =Integer.parseInt(request.getParameter("member_id"));
			 int camp_id =Integer.parseInt(request.getParameter("camp_id"));
			 System.out.println("멤버아이디테스트"+member_id);
				System.out.println("캠프아이디테스트"+camp_id);
			
			/* int camp_like_id =Integer.parseInt(request.getParameter("camp_like_id")); */		
			LikeDTO likeDTO = new LikeDTO();
			likeDTO.setMember_id(member_id);
			likeDTO.setCamp_id(camp_id);
			/* likeDTO.setCamp_like_id(camp_like_id); */

			// ReserveDetailDAO 객체생성
			likeDAO = new LikeDAO();
			// reserveDetailDTO = reserveDetailDTO() 메서드 호출
			likeDAO.deleteLike(likeDTO);
			
			/* int likeId=likeDAO.getMaxLikeId() +1; */
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	

}//MypageService
