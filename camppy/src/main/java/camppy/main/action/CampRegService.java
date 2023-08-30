package camppy.main.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import camppy.main.action.CampRegDAO;
import camppy.main.action.CampRegDTO;
import camppy.main.action.PageDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CampRegService {
	CampRegDAO campregDAO = null; 
//	public List<CampRegDTO> getCampRegList(PageDTO pageDTO) {
//		System.out.println("CampRegService getCampRegList()");
//		List<CampRegDTO> campregList = null;
//		try {
//			// 시작하는 행부터 10개 뽑아오기
////			페이지번호     한화면에 보여줄 글개수 => 시작하는 행번호
////			currentPage         pageSize    => startRow
////			    1                 10        => (1-1)*10+1=>0*10+1=> 0+1=>1        ~ 10
////			    2                 10        => (2-1)*10+1=>1*10+1=>10+1=>11       ~ 20
////		        3                 10        => (3-1)*10+1=>2*10+1=>20+1=>21       ~ 30			
//			
//			
//			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
//			// 시작하는 행부터 끝나는 행까지 뽑아오기
////			startRow  pageSize => endRow
////			    1         10   =>   1+10-1 =>10
////			    11        10   =>   11+10-1 =>20
////		        21        10   =>   21+10-1 =>30
//			    		
//			int endRow = startRow+pageDTO.getPageSize()-1;
//			//pageDTO 저장 <= startRow, endRow
//			pageDTO.setStartRow(startRow);
//			pageDTO.setEndRow(endRow);
//			
//			// CampRegDAO 객체생성
//			campregDAO = new CampRegDAO();
//			// campregList = getCampRegList() 메서드 호출
//			campregList = campregDAO.getCampRegList(pageDTO);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return campregList;
//	}//getCampRegList()
//	
//	public void insertCampReg(HttpServletRequest request) {
//		try {
//			System.out.println("CampRegService insertCampReg()");
//			// request 한글처리
//			request.setCharacterEncoding("utf-8");
//			// request 파라미터 값 가져오기
//			String name = request.getParameter("name");
//			String subject = request.getParameter("subject");
//			String content = request.getParameter("content");
//			// num, readcount, date => 변수저장
//			int readcount = 0; //조회수
//			Timestamp date = new Timestamp(System.currentTimeMillis());
//			// CampRegDAO 객체생성
//			campregDAO = new CampRegDAO();
//			int num = campregDAO.getMaxNum() + 1;
//			// CampRegDTO 객체생성
//			CampRegDTO campregDTO = new CampRegDTO();
//			// set메서드 호출 파라미터값 저장
//			/*
//			 * campregDTO.setNum(num); campregDTO.setName(name);
//			 * campregDTO.setSubject(subject); campregDTO.setContent(content);
//			 * campregDTO.setReadcount(readcount); campregDTO.setDate(date);
//			 */
//			// 리턴할형없음 insertCampReg(campregDTO) 호출
//			campregDAO.insertCampReg(campregDTO);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}//insertCampReg()
//
//	public int getCampRegCount() {
//		System.out.println("CampRegService getCampRegCount()");
//		int count=0;
//		try {
//			// CampRegDAO 객체생성
//			campregDAO = new CampRegDAO();
//			// count = getCampRegCount() 호출
//			count = campregDAO.getCampRegCount();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return count;
//	}//getCampRegCount
//
//	public CampRegDTO getCampReg(HttpServletRequest request) {
//		System.out.println("CampRegService getCampReg()");
//		CampRegDTO campregDTO = null;
//		try {
//			// request 한글처리
//			request.setCharacterEncoding("utf-8");
//			// request 파라미터 가져오기 => int num 저장
//			int num = Integer.parseInt(request.getParameter("num"));
//			// CampRegDAO 객체생성
//			campregDAO = new CampRegDAO();
//			// campregDTO = getCampReg(num) 메서드 호출
//			campregDTO = campregDAO.getCampReg(num);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return campregDTO;
//	}//getCampReg

	//첨부파일
	public void finsertCampReg(HttpServletRequest request) {
		System.out.println("CampRegService finsertCampReg()");
		try {
	//파일업로드 1.서버폴더에 파일업로드,데이터베이스 파일이름 저장
	//         2.데이터베이스 파일전체 저장(대용량 데이터베이스)
			
//			파일업로드 프로그램 다운	http://www.servlets.com
//			COS File Upload Library
//			다운로드 cos-22.05.zip 압축풀기
//			lib 폴더 cos.jar
//			webapp - WEB-INF - lib - cos.jar
			
// MultipartRequest 객체생성 사용 => 폴더에 파일업로드, 파라미터정보저장
//			import com.oreilly.servlet.MultipartRequest;
			// 생성자 1) request 2)업로드할 파일경로 3) 파일크기 4) 한글처리 5) 파일이름변경
			//업로드 폴더 만들기 webapp - upload 폴더만들기
			// 업로드 폴더 경로=> 물리적 경로
			String uploadPath=request.getRealPath("/camppymain/campreg/campimg");
			// 이클립스에 실행하면 이클립스 가상경로 
			System.out.println(uploadPath);
			//파일 최대크기 지정  10M
			int maxSize=10*1024*1024; 
			// 파일 업로드 했을때 폴더내 파일이름 동일하면 파일이름 변경하는 프로그램
			//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
			// new DefaultFileRenamePolicy()
			MultipartRequest multi 
			= new MultipartRequest(request, uploadPath, maxSize,"utf-8", new DefaultFileRenamePolicy()); 
			
			// multi 파라미터 값 가져오기
			String campname = multi.getParameter("campname");
			String shortintro = multi.getParameter("shortintro");
			String camptag = multi.getParameter("camptag");
			String campaddr = multi.getParameter("campaddr");
			String tel = multi.getParameter("tel");
			String environment = multi.getParameter("environment");
			String camptype = multi.getParameter("camptype");
			String season = multi.getParameter("season");
			String runtime = multi.getParameter("runtime");
			String homepage = multi.getParameter("homepage");
			String facility = multi.getParameter("facility");
			String campimg = multi.getFilesystemName("campimg");
			String camppic = multi.getFilesystemName("camppic");
			String bankaccount = multi.getParameter("bankaccount");
			String intro = multi.getParameter("intro");
			String campprice = multi.getParameter("campprice");
			
			//첨부파일이름 가져오기
			
			
			// num, readcount, date => 변수저장
			//int readcount = 0; //조회수
			//Timestamp date = new Timestamp(System.currentTimeMillis());
			// CampRegDAO 객체생성
			campregDAO = new CampRegDAO();
			//int num = campregDAO.getMaxNum() + 1;
			
			
			// CampRegDTO 객체생성
			CampRegDTO campregDTO = new CampRegDTO();
			// set메서드 호출 파라미터값 저장
			campregDTO.setCampname(campname);
			campregDTO.setShortintro(shortintro);
			campregDTO.setCamptag(camptag);
			campregDTO.setCampaddr(campaddr);
			campregDTO.setTel(tel);
			campregDTO.setEnvironment(environment);
			campregDTO.setCamptype(camptype);
			campregDTO.setSeason(season);
			campregDTO.setRuntime(runtime);
			campregDTO.setHomepage(homepage);
			campregDTO.setFacility(facility);
			campregDTO.setCampimg(campimg);
			campregDTO.setCamppic(camppic);
			campregDTO.setBankaccount(bankaccount);
			campregDTO.setIntro(intro);
			campregDTO.setCampprice(campprice);
			
			//첨부파일
			//campregDTO.setFile(file);
			
			// 리턴할형없음 insertCampReg(campregDTO) 호출
			campregDAO.insertCampReg(campregDTO);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//finsertCampReg

}//클래스
