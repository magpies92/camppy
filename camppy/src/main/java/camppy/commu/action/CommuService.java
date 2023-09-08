package camppy.commu.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import camppy.commu.db.CommuDAO;
import camppy.commu.db.CommuDTO;
import camppy.commu.db.PageDTO;
import camppy.main.action.CampRegDAO;
import camppy.main.action.CampRegDTO;
import camppy.member.MemberDTO;
import camppy.member.MemberService;

public class CommuService {
	CommuDAO commuDAO = null;
	MemberService memberService = null;

	public void commuInsert(HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			String id =(String)session.getAttribute("id");
			
		    memberService= new MemberService();
			MemberDTO memberDTO =memberService.getMember(id);
			
	        System.out.println("commuService commuInsert");
			request.setCharacterEncoding("utf-8");

			String uploadPath = request.getRealPath("/upload");

			System.out.println(uploadPath);

			int maxSize = 10 * 1024 * 1024;

			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8",
					new DefaultFileRenamePolicy());

			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			Timestamp create_date = new Timestamp(System.currentTimeMillis());
			Timestamp last_modified_date = new Timestamp(System.currentTimeMillis());
			String created_by = multi.getParameter("created_by");
			String last_modified_by = multi.getParameter("last_modified_by");
//			int comment_cnt = Integer.parseInt(multi.getParameter("comment_cnt"));
//			int like_cnt = Integer.parseInt(multi.getParameter("like_cnt"));
			String post_type = multi.getParameter("post_type");
			int member_id = memberDTO.getMember_id();

			String img_url = multi.getFilesystemName("uploadFile");

			CommuDTO commuDTO = new CommuDTO();
			commuDTO.setTitle(title);
			commuDTO.setContent(content);
			commuDTO.setCreate_date(create_date);
			commuDTO.setLast_modified_date(last_modified_date);
			commuDTO.setCreated_by(created_by);
			commuDTO.setLast_modified_by(last_modified_by);
//			commuDTO.setComment_cnt(comment_cnt);
//			commuDTO.setLike_cnt(like_cnt);
			commuDTO.setPost_type(post_type);
			commuDTO.setMember_id(member_id);
			commuDTO.setImg_url(img_url); 
			System.out.println(img_url);
			
			commuDAO = new CommuDAO();

			commuDAO.commuInsert(commuDTO);
			int post_id = commuDAO.getMaxNum()+1;
			System.out.println(post_id); 

			commuDTO.setCreate_date(last_modified_date);
			commuDTO.setPost_id(post_id);
//			commuDTO.setMember_id(member_id);
			commuDTO.setLast_modified_date(last_modified_date);
			commuDTO.setCreated_by(created_by);
			commuDTO.setLast_modified_by(last_modified_by);
			commuDTO.setImg_url(img_url);



		} catch (Exception e) {
			e.printStackTrace();
		}

	}

//커뮤니티(Community)의 개수를 반환하는 메서드입니다. 
	public int getCommuCount() {
		System.out.println("commuService getCommuCount()");
		int count = 0;
		try {
			// commuDAO 객체생성
			commuDAO = new CommuDAO();
			// count = getCommuCount() 호출
			count = commuDAO.getCommuCount();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

//페이지네이션 기능을 가진 커뮤니티 목록을 가져오는 메서드입니다. 
	public List<CommuDTO> getCommuList(PageDTO pageDTO) {
		System.out.println("CommuService getComuuList()");
		List<CommuDTO> commuList = null;
		try {
			int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
			System.out.println("currentRow" + pageDTO.getCurrentPage());
			System.out.println("startRow" + startRow);
			int endRow = startRow + pageDTO.getPageSize() - 1;

			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);

			commuDAO = new CommuDAO();

			commuList = commuDAO.getCommuList(pageDTO);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return commuList;
	}

//페이지네이션 및 검색 기능이 포함된 게시판 목록을 가져오는 기능 
	public List<CommuDTO> getCommuListSearch(PageDTO pageDTO) {
		System.out.println("commuService getCommuListSearch()");
		List<CommuDTO> commuList = null;
		try {
			int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize();

			int endRow = startRow + pageDTO.getPageSize() - 1;

			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			commuDAO = new CommuDAO();
			commuList = commuDAO.getCommuListSearch(pageDTO);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return commuList;
	}

//게시판 총 개수를 검색을 가져오는 기능 
	public int getCommuCountSearch(PageDTO pageDTO) {
		System.out.println("getCommuCountSearch()");
		int count = 0;
		try {
			commuDAO = new CommuDAO();
			
			count = commuDAO.getCommuCountSearch(pageDTO);
			
 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public List<CommuDTO> getCommuRank() {
		System.out.println("CampRegService getCampReg()");
		List<CommuDTO> commuRankList = null;
		
		try {	
			
			commuDAO = new CommuDAO();
			
			commuRankList= commuDAO.getCommuRank();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return commuRankList;
	}

	public void commudelete(HttpServletRequest request) {
      System.out.println("commuService commudelete()");
      try {
		request.setCharacterEncoding("utf-8");
		
		int post_id = Integer.parseInt(request.getParameter("post_id"));
		
		commuDAO = new CommuDAO();
		
		commuDAO.commudelete(post_id);
	} catch (Exception e) {
		e.printStackTrace();
	}   
		
	}

	

	
	

}
