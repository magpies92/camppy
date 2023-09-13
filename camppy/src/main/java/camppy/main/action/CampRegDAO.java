package camppy.main.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import camppy.main.action.CampRegDTO;
import camppy.main.action.PageDTO;
import java.time.format.DateTimeFormatter;

public class CampRegDAO {
	Connection con=null;
	PreparedStatement pstmt=null;
	PreparedStatement pstmt1=null;
	PreparedStatement pstmt2=null;
	PreparedStatement pstmt3=null;
	ResultSet rs =null;
	
	//1,2 단계 디비 연결 메서드  정의 => 필요로 할때 호출 사용
	public Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds=
		(DataSource)init.lookup("java:comp/env/c1d2304t3");
		con=ds.getConnection();
		return con;
	}
	//기억장소 해제 메서드()
	public void dbClose() {
		//  => con, pstmt, rs 기억장소 해제
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}
	public List<CampRegDTO> getCampRegList(PageDTO pageDTO) {
		System.out.println("CampRegDAO getCampRegList()");
		List<CampRegDTO> campregList = null;
		try {
			//1,2 디비연결
			con = getConnection();
			//3 sql  => mysql 제공 => limit 시작행-1, 몇개
//			String sql="select * from campreg order by num desc";
			String sql="select camp.*, camp_addr.*\r\n"
					+ "from camp left join camp_addr\r\n"
					+ "on camp.camp_id = camp_addr.camp_id\r\n"
					+ "order by camp.camp_id desc limit ?, ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageDTO.getStartRow()-1);//시작행-1
			pstmt.setInt(2, pageDTO.getPageSize());//몇개
			//4 실행 => 결과 저장
			rs = pstmt.executeQuery();
			// campregList 객체생성
			campregList = new ArrayList<>();
			//5 결과 행접근 => CampRegDTO객체생성 => set호출(열접근저장)
			// => 배열 한칸에 저장
			while(rs.next()) {
				CampRegDTO campregDTO =new CampRegDTO();
				campregDTO.setTel(rs.getString("tel"));
				campregDTO.setEnvironment(rs.getString("environment"));
				campregDTO.setCamptype(rs.getString("camp_type"));
				campregDTO.setSeason(rs.getString("season"));
				campregDTO.setRuntime(rs.getString("runtime"));
				campregDTO.setHomepage(rs.getString("homepage"));
				campregDTO.setFacility(rs.getString("facility"));
				campregDTO.setCampimg(rs.getString("camp_img"));
				campregDTO.setBankaccount(rs.getString("bank_account"));
				campregDTO.setBankname(rs.getString("bank_name"));
				campregDTO.setCampprice(rs.getInt("camp_price"));
				campregDTO.setCampaddr(rs.getString("camp_addr"));
				/*
				 * campregDTO.setDoo(rs.getString("doo"));
				 * campregDTO.setMapx(rs.getString("mapx"));
				 * campregDTO.setMapy(rs.getString("mapy"));
				 */
				campregDTO.setCampid(rs.getInt("camp_id"));
				campregDTO.setIntro(rs.getString("intro"));
				campregDTO.setShortintro(rs.getString("short_intro"));
				campregDTO.setCampname(rs.getString("camp_name"));
				// => 배열 한칸에 저장
				campregList.add(campregDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return campregList;
	}//getCampRegList()
	
	public List<CampRegDTO> getCampRegListSearch(PageDTO pageDTO) {
		System.out.println("CampRegDAO getCampRegListSearch()");
		List<CampRegDTO> campregList = null;
		try {
			
			//1,2 디비연결
			con = getConnection();
			//3 sql  => mysql 제공 => limit 시작행-1, 몇개
//			String sql="select * from campreg order by num desc";
			String sql="select camp.*, camp_addr.*\r\n"
					+ "from camp join camp_addr\r\n"
					+ "on camp.camp_id = camp_addr.camp_id\r\n"
					+ "where  concat(camp.camp_type,camp.camp_type,camp.intro,camp.runtime,camp.season,camp.facility,camp.tel,camp.environment,camp.short_intro) like ? \r\n"
					+ "or camp_addr.do_nm like ? or camp_addr.sigungu_nm like ?  order by camp.camp_id desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+pageDTO.getSearch()+"%");
			pstmt.setString(2, "%"+pageDTO.getSido()+"%");//시작행-1
			pstmt.setString(3, "%"+pageDTO.getGungu()+"%");//몇개
			pstmt.setInt(4, pageDTO.getStartRow()-1);//시작행-1
			pstmt.setInt(5, pageDTO.getPageSize());
			//4 실행 => 결과 저장
			rs = pstmt.executeQuery();
			// campregList 객체생성
			campregList = new ArrayList<>();
			//5 결과 행접근 => CampRegDTO객체생성 => set호출(열접근저장)
			// => 배열 한칸에 저장
			while(rs.next()) {
				CampRegDTO campregDTO =new CampRegDTO();
				campregDTO.setTel(rs.getString("tel"));
				campregDTO.setEnvironment(rs.getString("environment"));
				campregDTO.setCamptype(rs.getString("camp_type"));
				campregDTO.setSeason(rs.getString("season"));
				campregDTO.setRuntime(rs.getString("runtime"));
				campregDTO.setHomepage(rs.getString("homepage"));
				campregDTO.setFacility(rs.getString("facility"));
				campregDTO.setCampimg(rs.getString("camp_img"));
				campregDTO.setBankaccount(rs.getString("bank_account"));
				campregDTO.setBankname(rs.getString("bank_name"));
				campregDTO.setCampprice(rs.getInt("camp_price"));
				campregDTO.setSido(rs.getString("do_nm"));
				campregDTO.setGungu(rs.getString("sigungu_nm"));
				campregDTO.setMapx(rs.getString("mapx"));
				campregDTO.setMapy(rs.getString("mapy"));
				campregDTO.setCampid(rs.getInt("camp_id"));
				campregDTO.setIntro(rs.getString("intro"));
				campregDTO.setShortintro(rs.getString("short_intro"));
				campregDTO.setCampname(rs.getString("camp_name"));
				campregDTO.setCampaddr(rs.getString("camp_addr"));
				// => 배열 한칸에 저장
				campregList.add(campregDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return campregList;
	}//getCampRegListSearch()
	

	public void insertCampReg(CampRegDTO campregDTO) {
		System.out.println("CampRegDAO insertCampReg()");
		// campreg테이블 file 열추가
		// mysql -uroot -p1234 jspdb
		// file컬럼 추가
		// alter table campreg
		// add file varchar(100);
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql insert
			String sql = "insert into camp(homepage,camp_type,intro,runtime,season,facility,tel,environment,bank_account,camp_name,short_intro,camp_img,camp_price,bank_name) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			    //(물음표 순서,값)
			pstmt.setString(1, campregDTO.getHomepage());
			pstmt.setString(2, campregDTO.getCamptype());
			pstmt.setString(3, campregDTO.getIntro());
			pstmt.setString(4, campregDTO.getRuntime());
			pstmt.setString(5, campregDTO.getSeason());
			pstmt.setString(6, campregDTO.getFacility());
			pstmt.setString(7, campregDTO.getTel());
			pstmt.setString(8, campregDTO.getEnvironment());
			pstmt.setString(9, campregDTO.getBankaccount());
			pstmt.setString(10, campregDTO.getCampname());
			pstmt.setString(11, campregDTO.getShortintro());
			pstmt.setString(12, campregDTO.getCampimg()); 
			pstmt.setInt(13, campregDTO.getCampprice());
			pstmt.setString(14, campregDTO.getBankname()); 
			pstmt.executeUpdate();
			
			
			System.out.println("CampRegDAO getMaxNum()");
			int num = 0;
//			try {
//				//1,2 디비연결
//				con=getConnection();
//				//3 sql select max(num) from members
//				String sql = "select max(num) from campreg;";
//				pstmt=con.prepareStatement(sql);
//				//4 실행 => 결과저장
//				rs =pstmt.executeQuery();
//				//5 if 다음행  => 열데이터 가져와서 => num저장
//				if(rs.next()) {
//					num = rs.getInt("max(num)");
//				}
			String sql1 = "select * from camp ORDER BY camp_id DESC LIMIT 1";
			pstmt1=con.prepareStatement(sql1);
			//4 실행 => 결과저장/			
			rs =pstmt1.executeQuery();
			//5 if 다음행  => 열데이터 가져와서 => num저장
			if(rs.next()) {
				num = rs.getInt("camp_id");
			}			
			sql1 = "insert into camp_pic(camp_id,pic1,pic2,pic3,pic4,pic5) values(?,?,?,?,?,?)";
			pstmt1=con.prepareStatement(sql1);
			pstmt1.setInt(1, num);		
			pstmt1.setString(2, campregDTO.getCamppic()[0]);
			pstmt1.setString(3, campregDTO.getCamppic()[1]);	
			pstmt1.setString(4, campregDTO.getCamppic()[2]);	
			pstmt1.setString(5, campregDTO.getCamppic()[3]);	
			pstmt1.setString(6, campregDTO.getCamppic()[4]);	
			pstmt1.executeUpdate();			
		
			
			String sql2 = "insert into camp_tag(camp_id,elec,wifi,wood,hot,pool,play,gym) values(?,?,?,?,?,?,?,?)";
			pstmt2=con.prepareStatement(sql2);
			pstmt2.setInt(1, num);	
			pstmt2.setString(2, campregDTO.getCamptag()[0]);
			pstmt2.setString(3, campregDTO.getCamptag()[1]);
			pstmt2.setString(4, campregDTO.getCamptag()[2]);
			pstmt2.setString(5, campregDTO.getCamptag()[3]);
			pstmt2.setString(6, campregDTO.getCamptag()[4]);
			pstmt2.setString(7, campregDTO.getCamptag()[5]);
			pstmt2.setString(8, campregDTO.getCamptag()[6]);
//								//파일추가
//	
			pstmt2.executeUpdate();
//			
			String sql3 = "insert into camp_addr(camp_id,camp_addr,do_nm,sigungu_nm,mapx,mapy) values(?,?,?,?,?,?)";
			pstmt3=con.prepareStatement(sql3);
			pstmt3.setInt(1, num);	
			pstmt3.setString(2, campregDTO.getCampaddr());
			pstmt3.setString(3, campregDTO.getSido());
			pstmt3.setString(4, campregDTO.getSigungu());
			pstmt3.setString(5, campregDTO.getMapx());
			pstmt3.setString(6, campregDTO.getMapy());
			pstmt3.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}//insertCampReg()
//	
	public int getCampRegCount() {
		int count = 0;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql select count(*) from campreg
			String sql = "select count(*) from camp;";
			pstmt=con.prepareStatement(sql);
			//4 실행 => 결과저장
			rs = pstmt.executeQuery();
			//5 결과 행접근 => 열접근 => count변수 저장
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return count;
	}//getCampRegCount()
	
	public CampRegDTO getCampReg2(String campname) {
		CampRegDTO campregDTO = null;
		try {
			//1,2 디비연결
			con = getConnection();
			//3 sql select * from campreg where num = ?
			String sql="select * from camp where camp_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, campname);
			//4 실행 => 결과 저장
			rs = pstmt.executeQuery();
			//5 결과 행접근 => campregDTO 객체생성 
			//        => set메서드 호출 => 열접근 데이터 저장
			if(rs.next()) {
				campregDTO = new CampRegDTO();
				campregDTO.setCampimg(rs.getString("camp_img"));
				campregDTO.setCampname(rs.getString("camp_name"));
				campregDTO.setCampid(rs.getInt("camp_id"));
				campregDTO.setDate(rs.getTimestamp("reg_time"));
				campregDTO.setCampprice(rs.getInt("camp_price"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return campregDTO;
	}//getCampReg
	
	
	public int getCampRegCountSearch(PageDTO pageDTO) {
		int count = 0;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql select count(*) from campreg
//String sql = "select count(*) from campreg where subject like '%검색어%';";
			String sql="select count(*)\r\n"
					+ "from camp join camp_addr\r\n"
					+ "on camp.camp_id = camp_addr.camp_id\r\n"
					+ "where  concat(camp.camp_type,camp.camp_type,camp.intro,camp.runtime,camp.season,camp.facility,camp.tel,camp.environment,camp.short_intro) like ? \r\n"
					+ "and camp_addr.do_nm like ? and camp_addr.sigungu_nm like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+pageDTO.getSearch()+"%");
			pstmt.setString(2, "%"+pageDTO.getSido()+"%");//시작행-1
			pstmt.setString(3, "%"+pageDTO.getGungu()+"%");//몇개
			
			
			//4 실행 => 결과저장
			rs = pstmt.executeQuery();
			//5 결과 행접근 => 열접근 => count변수 저장
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return count;
	}//getCampRegCountSearch()
	
	public CampRegDTO getCampReg(int campid) {
		CampRegDTO campregDTO = null;
		try {
			//1,2 디비연결
			con = getConnection();
			//3 sql select * from campreg where num = ?
			String sql="select * from camp where camp_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, campid);
			//4 실행 => 결과 저장
			rs = pstmt.executeQuery();
			//5 결과 행접근 => campregDTO 객체생성 
			//        => set메서드 호출 => 열접근 데이터 저장
			if(rs.next()) {
				campregDTO = new CampRegDTO();
				campregDTO.setCampimg(rs.getString("camp_img"));
				campregDTO.setCampname(rs.getString("camp_name"));
				campregDTO.setCampid(rs.getInt("camp_id"));
				campregDTO.setDate(rs.getTimestamp("reg_time"));
				campregDTO.setCampprice(rs.getInt("camp_price"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return campregDTO;
	}//getCampReg
	
	
	
	public CampRegDTO getCampReg1(int camp_id) {
		System.out.println("CampRegDTO getCampReg()");
		CampRegDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from camp where camp_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, camp_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto = new CampRegDTO();
				dto.setTel(rs.getString("tel"));
				dto.setEnvironment(rs.getString("environment"));
				dto.setCamptype(rs.getString("camp_type"));
				dto.setSeason(rs.getString("season"));
				dto.setRuntime(rs.getString("runtime"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setFacility(rs.getString("facility"));
				dto.setCampimg(rs.getString("campimg"));
				dto.setBankaccount(rs.getString("bankaccount"));
				dto.setBankname(rs.getString("bankname"));
				dto.setCampprice(rs.getInt("campprice"));
				dto.setSido(rs.getString("do_nm"));
				dto.setSigungu(rs.getString("sigungu_nm"));
				dto.setMapx(rs.getString("mapx"));
				dto.setMapy(rs.getString("mapy"));
				dto.setCampid(rs.getInt("campid"));
				dto.setIntro(rs.getString("intro"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getCampReg()
	
	public CampRegDTO getCampRank(int camprank) {
		CampRegDTO campregDTO = null;
		try {
			//1,2 디비연결
			con = getConnection();
			//3 sql select * from campreg where num = ?
			String sql="select avg(rating) as rating, camp.camp_id, camp.camp_name, camp.camp_img, camp.short_intro\r\n"
					+ "from camp join review\r\n"
					+ "on camp.camp_id = review.camp_id\r\n"
					+ "group by camp_id\r\n"
					+ "order by rating desc";
			pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1, campid);
			//4 실행 => 결과 저장
			rs = pstmt.executeQuery();
			//5 결과 행접근 => campregDTO 객체생성 
			//        => set메서드 호출 => 열접근 데이터 저장
			int i=0;
			campregDTO = new CampRegDTO();
			for(i=1; i <= camprank; i++) {
				rs.next();								
			}
			campregDTO.setCampimg(rs.getString("camp_img"));
			campregDTO.setCampname(rs.getString("camp_name"));
			campregDTO.setCampid(rs.getInt("camp_id"));
			//campregDTO.setDate(rs.getTimestamp("reg_time"));
			//campregDTO.setCampprice(rs.getInt("camp_price"));
			campregDTO.setShortintro(rs.getString("short_intro"));
			
		}
			catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return campregDTO;
	}//getCampReg
	
	public boolean checkResId(int res_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean checksResID = true;
		try {
			con = getConnection();
			String sql = "select * from reservation where res_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, res_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				checksResID = true;
			} else {
				checksResID = false;
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		return checksResID;
	}
	public CampRegDTO getCampRegUp(int camp_id) {
		CampRegDTO campregDTO = null;
		try {
			con = getConnection();
			
			String sql = "select camp.*, camp_ad.*, camp_pic.*\n"
					+ "from camp camp left join camp_addr camp_ad\n"
					+ "on camp.camp_id = camp_ad.camp_id\n"
					+ "left join camp_pic camp_pic\n"
					+ "on camp.camp_id = camp_pic.camp_id\n"
					+ "where camp.camp_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, camp_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				campregDTO=new CampRegDTO();
				campregDTO.setCampid(rs.getInt("camp_id"));
				campregDTO.setCampname(rs.getString("camp_name"));
				campregDTO.setShortintro(rs.getString("short_intro"));
				campregDTO.setCampaddr(rs.getString("camp_addr"));
				campregDTO.setTel(rs.getString("tel"));
				campregDTO.setEnvironment(rs.getString("environment"));
				campregDTO.setCamptype(rs.getString("camp_type"));
				campregDTO.setSeason(rs.getString("season"));
				campregDTO.setRuntime(rs.getString("runtime"));
				campregDTO.setHomepage(rs.getString("homepage"));
				campregDTO.setFacility(rs.getString("facility"));
				campregDTO.setIntro(rs.getString("intro"));
				campregDTO.setCampimg(rs.getString("camp_img"));
				
				// rs가 ResultSet이라고 가정합니다.
			//	String[] camppic = new String[5]; // 배열 초기화

				//for (int i = 0; i < 5; i++) {
				  //  camppic[i] = rs.getString("pic" + (i + 1)); // 열 이름이 pic1, pic2와 같은 형태라고 가정합니다.
				//}
				//campregDTO.setCamppic(camppic); // DTO에 배열 설정
				
				campregDTO.setBankname(rs.getString("bank_name"));
				campregDTO.setBankaccount(rs.getString("bank_account"));
				campregDTO.setCampprice(rs.getInt("camp_price"));
				campregDTO.setSido(rs.getString("do_nm"));
				campregDTO.setGungu(rs.getString("sigungu_nm"));
				campregDTO.setMapx(rs.getString("mapx"));
				campregDTO.setMapy(rs.getString("mapy"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return campregDTO;
	}

	

}//클래스
