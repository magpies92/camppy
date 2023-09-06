package camppy.mypage;

import java.util.List;

import camppy.main.action.PageDTO;

public class MypageService {

	public List<LikeDTO> getLikeList(PageDTO pageDTO) {
		System.out.println("MypageService getLikeList()");
		List<LikeDTO> likeList=null;
		try {
			//시작하는 행부터 10개 추출
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			
			//시작하는 행부터 끝나는 행까지 추출
			int endRow = startRow+pageDTO.getPageSize()-1;
			
			//pageDTO 저장 startRow, endRow
			pageDTO.se
		} catch (Exception e) {
			e.printStackTrace();
		}
		return likeList;
	}//getLikeList
	
	
	
	
	
	
	
	
	
	

}//MypageService
