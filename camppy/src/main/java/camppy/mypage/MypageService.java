package camppy.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.camppy.dao.DetailDAO;

import camppy.main.action.PageDTO;

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

	
	public int getLikeCount() {
		System.out.println("MypageService getLikeCount()");
		int count=0;
		try {
			//LikeDAO 객체 생성
			likeDAO = new LikeDAO();
			//count=getLikeCount() 호출
			count=likeDAO.getLikeCount();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getLikeCount()


	public void getHeartsCount(HttpServletRequest request) {
		System.out.println("MypageService getHeartsCount()");
		
		try {
			//request 한글 처리
			request.setCharacterEncoding("utf-8");
			
			//request 파라미터 가져오기 -> int campid
			int campId = Integer.parseInt(request.getParameter("campId"));
			
			//LikeDAO 객체 생성
			//getHeartsCount(campid) 메서드 호출
			likeDAO=new LikeDAO();
			likeDAO.getHeartsCount(campId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
	

}//MypageService
