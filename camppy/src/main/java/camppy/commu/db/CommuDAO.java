package camppy.commu.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import camppy.main.action.CampRegDTO;

public class CommuDAO {
	Connection con = null;// 자바와 데이터베이스를 연결
	PreparedStatement pstmt = null;// 쿼리문 대기 및 설정
	PreparedStatement pstmt2 = null;// 쿼리문 대기 및 설정
	ResultSet rs = null;// 결과 값 받아오기
	ResultSet rs2 = null;// 결과 값 받아오기

	public Connection getConnection() throws Exception {
		// context.xml 불러오기 위해 context 객체생
		Context init = new InitialContext();

		// 디비연결
		DataSource ds = (DataSource) init.lookup("java:comp/env/c1d2304t3");
		Connection con = ds.getConnection();
		return con;
		// 작업속도가 빨라짐(1,2 단계 생략)=>성능향상
		// 디비연결 정보를 context.xml에서만 수정하면 모든 자바파일 수정됨
	}

	// 기억장소 해재 메서드()
	public void dbclose() {
		// 예외 상관 없이 마무리 작업
		// con,pstmt,rs 기억장소 해재
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			}
		}
		if (rs != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
		}
		if (rs != null) {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
	}

// 최대번호
	public int getMaxNum() {
		int num = 0;
		try {
			con = getConnection();
			String sql = "select max(post_id) from post ";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt("max(post_id)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return num;
	}

// 자료 넣기
	public void commuInsert(CommuDTO commuDTO) {
		try {
			con = getConnection();
			String sql = "insert into post(create_date,last_modified_date,created_by,last_modified_by,comment_cnt,content,like_cnt,post_type,title,member_id) values(?,?,?,?,?,?,?,?,?,?);";

			pstmt = con.prepareStatement(sql);
			pstmt.setTimestamp(1, commuDTO.getCreate_date());
			pstmt.setTimestamp(2, commuDTO.getLast_modified_date());
			pstmt.setString(3, commuDTO.getCreated_by());
			pstmt.setString(4, commuDTO.getLast_modified_by());
			pstmt.setInt(5, commuDTO.getComment_cnt());
			pstmt.setString(6, commuDTO.getContent());
			pstmt.setInt(7, commuDTO.getLike_cnt());
			pstmt.setString(8, commuDTO.getPost_type());
			pstmt.setString(9, commuDTO.getTitle());
			pstmt.setInt(10, commuDTO.getMember_id());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}

	}

	public void commuInsertPostImage(CommuDTO commuDTO) {
		System.out.println("commuInsertPostImage");

		try {
			con = getConnection();

			String sql = "insert into post_image(created_date,post_id,member_id,last_modified_date,created_by,last_modified_by,img_url) values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setTimestamp(1, commuDTO.getCreate_date());
			pstmt.setInt(2, commuDTO.getPost_id());
			pstmt.setInt(3, commuDTO.getMember_id());
			pstmt.setTimestamp(4, commuDTO.getLast_modified_date());
			pstmt.setString(5, commuDTO.getCreated_by());
			pstmt.setString(6, commuDTO.getLast_modified_by());
			pstmt.setString(7, commuDTO.getImg_url());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}

	}

// 페이지쪽 불러오는 값 
	public int getCommuCount() {
		int count = 0;
		try {
			con = getConnection();

			String sql = "select count(*) from post p join post_image i on (p.post_id = i.post_id)";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return count;
	}

	public List<CommuDTO> getCommuList(PageDTO pageDTO) {
		System.out.println("commuDAO getCommuList()");
		List<CommuDTO> commuList = null;
		try {
			con = getConnection();

			String sql = "select p.create_date, p.last_modified_date, p.created_by, p.last_modified_by, p.comment_cnt, p.content, p.like_cnt, p.post_type, p.title, p.member_id, i.post_image_id, i.created_date, i.post_id, i.member_id, i.last_modified_date, i.created_by, i.last_modified_by, i.img_url from post p join post_image i on (p.post_id = i.post_id) order by post_id limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageDTO.getStartRow() - 1);
			pstmt.setInt(2, pageDTO.getPageSize());

			rs = pstmt.executeQuery();

			commuList = new ArrayList<>();

			while (rs.next()) {
				CommuDTO commuDTO = new CommuDTO();
				commuDTO.setPost_id(rs.getInt("post_id"));
				commuDTO.setCreate_date(rs.getTimestamp("Create_date"));
				commuDTO.setLast_modified_date(rs.getTimestamp("last_modified_date"));
				commuDTO.setCreated_by(rs.getString("created_by"));
				commuDTO.setLast_modified_by(rs.getString("last_modified_by"));
				commuDTO.setComment_cnt(rs.getInt("comment_cnt"));
				commuDTO.setContent(rs.getString("content"));
				commuDTO.setLike_cnt(rs.getInt("like_cnt"));
				commuDTO.setPost_type(rs.getString("post_type"));
				commuDTO.setTitle(rs.getString("title"));
				commuDTO.setMember_id(rs.getInt("member_id"));

				commuDTO.setPost_image_id(rs.getInt("post_image_id"));
				commuDTO.setCreated_date(rs.getString("created_date"));
//				commuDTO.setLast(rs.getString("last_modified_id"));
				commuDTO.setImg_url(rs.getString("img_url"));

				// => 배열 한칸에 저장
				commuList.add(commuDTO);
			}
			System.out.println("commuList" + commuList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return commuList;
	}

	public List<CommuDTO> getCommuListSearch(PageDTO pageDTO) {
		System.out.println("CommuDAO getCommuListSearch()");
		List<CommuDTO> commuList = null;
		try {
			con = getConnection();
			System.out.println(pageDTO.getSearch());
//			String sql = "select p.create_date,"
//					+ " p.last_modified_date,"
//					+ " p.created_by,"
//					+ " p.last_modified_by,"
//					+ " p.comment_cnt,"
//					+ " p.content,"
//					+ " p.like_cnt,"
//					+ " p.post_type,"
//					+ " p.title,"
//					+ " p.member_id," 
//					+ " i.post_image_id,"
//					+ " i.created_date,"
//					+ " i.post_id,"
//					+ " i.member_id,"
//					+ " i.last_modified_date,"
//					+ " i.created_by,"
//					+ " i.last_modified_by,"
//					+ " i.img_url "
//					+ "from post p join post_image i "
//					+ "on (p.post_id = i.post_id) "
//					+ "where title like ? "
//					+ "order by post_id "
//					+ "desc limit ?,?";
//		String sql = "select p.create_date, p.last_modified_date, p.created_by, p.last_modified_by, p.comment_cnt,p.content,p.like_cnt,p.post_type,p.title,p.member_id,i.post_image_id,i.created_date,i.post_id,i.member_id,i.last_modified_date,i.created_by,i.last_modified_by,i.img_url from post p join post_image i on (p.post_id = i.post_id) where title like ? order by post_id desc limit ?,?";
			String sql = "select p.create_date,p.last_modified_date,p.created_by,p.last_modified_by,p.comment_cnt,p.content,p.like_cnt,p.post_type,p.title,p.member_id,"
					+ "	   i.post_image_id,i.created_date,i.post_id,i.member_id,i.last_modified_date,i.created_by,i.last_modified_by,i.img_url "
					+ "from post p join post_image i " + "on (p.post_id = i.post_id) " + "where title like ? "
					+ "order by post_id " + "desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + pageDTO.getSearch() + "%");
			pstmt.setInt(2, pageDTO.getStartRow());// 시작행-1
//			pstmt.setInt(2, 0);//시작행-1
			pstmt.setInt(3, pageDTO.getPageSize());// 몇개
			System.out.println(pstmt);
			rs = pstmt.executeQuery();

			commuList = new ArrayList();
			while (rs.next()) {
				CommuDTO commuDTO = new CommuDTO();
				commuDTO.setPost_id(rs.getInt("post_id"));
				commuDTO.setCreate_date(rs.getTimestamp("Create_date"));
				commuDTO.setLast_modified_date(rs.getTimestamp("last_modified_date"));
				commuDTO.setCreated_by(rs.getString("created_by"));
				commuDTO.setLast_modified_by(rs.getString("last_modified_by"));
				commuDTO.setComment_cnt(rs.getInt("comment_cnt"));
				commuDTO.setContent(rs.getString("content"));
				commuDTO.setLike_cnt(rs.getInt("like_cnt"));
				commuDTO.setPost_type(rs.getString("post_type"));
				commuDTO.setTitle(rs.getString("title"));
				commuDTO.setMember_id(rs.getInt("member_id"));

				commuDTO.setPost_image_id(rs.getInt("post_image_id"));
				commuDTO.setCreated_date(rs.getString("created_date"));
//				commuDTO.setLast(rs.getString("last_modified_id"));
				commuDTO.setImg_url(rs.getString("img_url"));

				// => 배열 한칸에 저장
				commuList.add(commuDTO);
			}
			System.out.println(pstmt);
			System.out.println("commuList" + commuList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return commuList;
	}

	public int getCommuCountSearch(PageDTO pageDTO) {

		System.out.println("getCommuCountSearch");
		int count = 0;
		try {
			pageDTO = new PageDTO();

			con = getConnection();

			if (pageDTO.getSearchType() == "제목+내용") {
				String sql = "select count(*) as count from post p join post_image i on (p.post_id = i.post_id) where concat(p.title, p.content) like ?";

				pstmt = con.prepareStatement(sql);
			}
			if (pageDTO.getSearchType() == "아이디") {
				String sql = "select count(*) as count from post p join members m on (p.member_id = m.member_id) where m.id like ?";
				pstmt = con.prepareStatement(sql);
			}
			pstmt.setString(1, "%" + pageDTO.getSearch() + "%");

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return count;
	}

	public CommuDTO getCommuRank(int commuRank) {
		CommuDTO commuDTO = null;
		try {
			con = getConnection();

			String sql = " select p.like_cnt,p.member_id,i.img_url,m.nickname " + " from post p join post_image i"
					+ " on (p.post_id = i.post_id)" + " join members m " + " on (m.member_id = i.member_id)"
					+ " order by like_cnt";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			int i = 0;
			commuDTO = new CommuDTO();
			for (i = 1; i <= commuRank; i++) {
				rs.next();
			}
			commuDTO.setLike_cnt(rs.getInt("like_cnt"));
			commuDTO.setMember_id(rs.getInt("member_id"));
			commuDTO.setImg_url(rs.getString("img_url"));
			commuDTO.setNickname(rs.getString("nickname"));

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}
		return commuDTO;
	}

	public void commudelete(int post_id) {
		try {
			con = getConnection();

			String sql = "delete from post p join post_image i on (p.post_id = i.post_id) where post_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, post_id);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbclose();
		}

	}

}
