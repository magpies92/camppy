package camppy.commu.db;

import java.sql.Timestamp;

public class CommuDTO {
  //post:커뮤니티  
  private int post_id;//커뮤니티 아이디 
  private Timestamp create_date;//작성날짜 
  private Timestamp last_modified_date;//수정날
  private String created_by;//생성자 
  private String last_modified_by;//마지막 수정자 
  private int comment_cnt;//댓글개수 
  private String content;//글 내용 
  private int like_cnt;//좋아요 개수
  private String post_type;//게시글 종류 ㅁ
  private String title;//제목
  private int member_id;//회원아이디
  
  //post_image:커뮤니티 사진 
  private int post_image_id;//커뮤니티 사진 아이디 
  private String created_date;//작성날짜 
//  private int post_id;//게시글 아이디 
//  private String member_id; //회원아이디 
//  private Timestamp last_modified_date;//수정날짜
//  private String created_by;//작성자 
  private String last_modified_id;//마지막 수정
  private String img_url;//커뮤니티사진주
  
 
  //post_like:커뮤니티 좋아요
  private String post_like_id;//커뮤니티 좋아요 아이
//  private String member_id;//회원 아이디 
//  private String post_id;//게시글 아이
  
  
    //comment:댓글 
    private String commnet_id;//댓글아이디 
//  private String created_date;//작성날짜 
//  private String last_modified_date;//수정날짜 
//  private String created_by;//생성자 
//  private String last_modified_by;//마지막 수정자 
//  private String member_id;//회원 아이디 
//  private String post_id;//게시글 아이디 
//  private String content;//내
//  private String like_cnt;//댓글 좋아요 
  
  //comment_like:댓글 좋아요 
	private String comment_like_id; //댓글 좋아요 아이디
//  private String member_id;//회원아이
//  private String comment_id;//댓글아이
	
	private String nickname;
	
    public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public Timestamp getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Timestamp create_date) {
		this.create_date = create_date;
	}

	public Timestamp getLast_modified_date() {
		return last_modified_date;
	}

	public void setLast_modified_date(Timestamp last_modified_date) {
		this.last_modified_date = last_modified_date;
	}

	public String getCreated_by() {
		return created_by;
	}

	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}

	public String getLast_modified_by() {
		return last_modified_by;
	}

	public void setLast_modified_by(String last_modified_by) {
		this.last_modified_by = last_modified_by;
	}

	public int getComment_cnt() {
		return comment_cnt;
	}

	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	public String getPost_type() {
		return post_type;
	}

	public void setPost_type(String post_type) {
		this.post_type = post_type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getPost_image_id() {
		return post_image_id;
	}

	public void setPost_image_id(int post_image_id) {
		this.post_image_id = post_image_id;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getLast_modified_id() {
		return last_modified_id;
	}

	public void setLast_modified_id(String last_modified_id) {
		this.last_modified_id = last_modified_id;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getPost_like_id() {
		return post_like_id;
	}

	public void setPost_like_id(String post_like_id) {
		this.post_like_id = post_like_id;
	}

	public String getCommnet_id() {
		return commnet_id;
	}

	public void setCommnet_id(String commnet_id) {
		this.commnet_id = commnet_id;
	}

	public String getComment_like_id() {
		return comment_like_id;
	}

	public void setComment_like_id(String comment_like_id) {
		this.comment_like_id = comment_like_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
}


  

  
  
  
  
  
  
