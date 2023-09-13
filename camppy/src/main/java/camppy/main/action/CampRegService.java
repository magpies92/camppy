package camppy.main.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import camppy.main.action.CampRegDAO;
import camppy.main.action.CampRegDTO;
import camppy.main.action.PageDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;



public class CampRegService {
	CampRegDAO campregDAO = null; 
	
	public List<CampRegDTO> getCampRegList(PageDTO pageDTO) {
		System.out.println("CampRegService getCampRegList()");
		List<CampRegDTO> campregList = null;
		try {
			// 시작하는 행부터 10개 뽑아오기
//			페이지번호     한화면에 보여줄 글개수 => 시작하는 행번호
//			currentPage         pageSize    => startRow
//			    1                 10        => (1-1)*10+1=>0*10+1=> 0+1=>1        ~ 10
//			    2                 10        => (2-1)*10+1=>1*10+1=>10+1=>11       ~ 20
//		        3                 10        => (3-1)*10+1=>2*10+1=>20+1=>21       ~ 30			
			
			
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 시작하는 행부터 끝나는 행까지 뽑아오기
//			startRow  pageSize => endRow
//			    1         10   =>   1+10-1 =>10
//			    11        10   =>   11+10-1 =>20
//		        21        10   =>   21+10-1 =>30
			    		
			int endRow = startRow+pageDTO.getPageSize()-1;
			//pageDTO 저장 <= startRow, endRow
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			// CampRegDAO 객체생성
			campregDAO = new CampRegDAO();
			// campregList = getCampRegList() 메서드 호출
			campregList = campregDAO.getCampRegList(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return campregList;
	}//getCampRegList()
	
	public List<CampRegDTO> getCampRegListSearch(PageDTO pageDTO) {
		System.out.println("CampRegService getCampRegListSearch()");
		List<CampRegDTO> campregList = null;
		try {
			// 시작하는 행부터 10개 뽑아오기
//			페이지번호     한화면에 보여줄 글개수 => 시작하는 행번호
//			currentPage         pageSize    => startRow
//			    1                 10        => (1-1)*10+1=>0*10+1=> 0+1=>1        ~ 10
//			    2                 10        => (2-1)*10+1=>1*10+1=>10+1=>11       ~ 20
//		        3                 10        => (3-1)*10+1=>2*10+1=>20+1=>21       ~ 30			
			
			
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 시작하는 행부터 끝나는 행까지 뽑아오기
//			startRow  pageSize => endRow
//			    1         10   =>   1+10-1 =>10
//			    11        10   =>   11+10-1 =>20
//		        21        10   =>   21+10-1 =>30
			    		
			int endRow = startRow+pageDTO.getPageSize()-1;
			//pageDTO 저장 <= startRow, endRow
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			// CampRegDAO 객체생성
			campregDAO = new CampRegDAO();
			// campregList = getCampRegList() 메서드 호출
			campregList = campregDAO.getCampRegListSearch(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return campregList;
	}//getCampRegListSearch()

	public int getCampRegCount() {
		System.out.println("CampRegService getCampRegCount()");
		int count=0;
		try {
			// CampRegDAO 객체생성
			campregDAO = new CampRegDAO();
			// count = getCampRegCount() 호출
			count = campregDAO.getCampRegCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getCampRegCount
	
	public int getCampRegCountSearch(PageDTO pageDTO) {
		System.out.println("CampRegService getCampRegCountSearch()");
		int count=0;
		try {
			// CampRegDAO 객체생성
			campregDAO = new CampRegDAO();
			// count = getCampRegCount() 호출
			count = campregDAO.getCampRegCountSearch(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getCampRegCount

	public CampRegDTO getCampReg(int campid) {
		System.out.println("CampRegService getCampReg()");
		CampRegDTO campregDTO = null;
		try {
			// request 한글처리
		
			// request 파라미터 가져오기 => int num 저장
			
			// CampRegDAO 객체생성
			campregDAO = new CampRegDAO();
			// campregDTO = getCampReg(num) 메서드 호출
			campregDTO = campregDAO.getCampReg(campid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return campregDTO;
	}//getCampReg
	
	public CampRegDTO getCampReg2(String campname) {
		System.out.println("CampRegService getCampReg()");
		CampRegDTO campregDTO = null;
		try {
			// request 한글처리

			// request 파라미터 가져오기 => int num 저장

			// CampRegDAO 객체생성
			campregDAO = new CampRegDAO();
			// campregDTO = getCampReg(num) 메서드 호출
			campregDTO = campregDAO.getCampReg2(campname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return campregDTO;
	}//getCampReg
	
	public CampRegDTO getCampRank(int camprank) {
		System.out.println("CampRegService getCampReg()");
		CampRegDTO campregDTO = null;
		try {
			// request 한글처리
		
			// request 파라미터 가져오기 => int num 저장
			
			// CampRegDAO 객체생성
			campregDAO = new CampRegDAO();
			// campregDTO = getCampReg(num) 메서드 호출
			campregDTO = campregDAO.getCampRank(camprank);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return campregDTO;
	}

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
			String uploadPath=request.getRealPath("campimg");
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
			
			String tel = multi.getParameter("tel");
			String environment = multi.getParameter("environment");
			String camptype = multi.getParameter("camptype");
			String season = multi.getParameter("season");
			String runtime = multi.getParameter("runtime");
			String homepage = multi.getParameter("homepage");
			String facility = multi.getParameter("facility");
			String campimg = multi.getFilesystemName("campimg");
			String bankaccount = multi.getParameter("bankaccount");
			String bankname = multi.getParameter("bankname");
			String intro = multi.getParameter("intro");
			int campprice = Integer.parseInt(multi.getParameter("campprice"));
			String  addr1= multi.getParameter("postAddr1");
			String  addr2= multi.getParameter("postAddr2");
			String  addr3= multi.getParameter("postAddr3");
			String  doo= multi.getParameter("doo");
			String  sigungu= multi.getParameter("sigungu");
			String campaddr;
			if (addr3.equalsIgnoreCase("")){
			campaddr = addr2;
			}
			else
			{
				campaddr = addr2+" "+addr3;
				
			}
			String mapx=multi.getParameter("mapx");
			String mapy=multi.getParameter("mapy");	    		
		                     int i = 0;
		                     int j =0;
		                     String[] camppic= new String[5];
		                   
		                     
		                     for(i=0; i<5; i++){
		                    	 j = i+1;
		                         String name = "camppic"+String.valueOf(j);
		                         camppic[i] = multi.getFilesystemName(name); 
		                      
		                     }		                     
		  String[] camptag = new String[7];
		  for(i=0; i<7; i++){
         	 j = i+1;
              String name = "camptag"+String.valueOf(j);
              camptag[i] = multi.getParameter(name); 
           
          }
				  
		                        
		                  
		                    	                         
		      
		    	
			
			
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
			
			campregDTO.setCampaddr(campaddr);
			campregDTO.setTel(tel);
			campregDTO.setEnvironment(environment);
			campregDTO.setCamptype(camptype);
			campregDTO.setSeason(season);
			campregDTO.setRuntime(runtime);
			campregDTO.setHomepage(homepage);
			campregDTO.setFacility(facility);
			campregDTO.setCampimg(campimg);
			/* campregDTO.setCamppic(camppic); */
			campregDTO.setBankaccount(bankaccount);
			campregDTO.setBankname(bankname);
			campregDTO.setIntro(intro);
			campregDTO.setCampprice(campprice);
			campregDTO.setSido(doo);
			campregDTO.setSigungu(sigungu);
			campregDTO.setMapx(mapx);
			campregDTO.setMapy(mapy);
			campregDTO.setCamppic(camppic);
			campregDTO.setCamptag(camptag);
             
			
			//첨부파일
			//campregDTO.setFile(file);
			
			// 리턴할형없음 insertCampReg(campregDTO) 호출
			campregDAO.insertCampReg(campregDTO);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//finsertCampReg

	public CampRegDTO getCampRegUp(HttpServletRequest request) {
		System.out.println("CampRegService getCampRegUp()");
		CampRegDTO campregDTO = null;
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 파라미터 가져오기 => int camp_id 저장
			int camp_id = Integer.parseInt(request.getParameter("camp_id"));
			// CampRegDAO 객체생성
			campregDAO = new CampRegDAO();
			// campregDTO = getCampReg(num) 메서드 호출
			campregDTO = campregDAO.getCampRegUp(camp_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return campregDTO;
	}//getCampRegUp
	
	
}//클래스
