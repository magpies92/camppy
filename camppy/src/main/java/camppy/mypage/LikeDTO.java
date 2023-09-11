package camppy.mypage;

public class LikeDTO {
	
	private int camp_like_id;
	private	int member_id;
	private int camp_id;
	private String camp_name; //캠핑장 이름
	private String camp_addr; //캠핑장 주소
	private String facility; //주변이용시설
	private String tel; //문의처(전화번호)
	private String camp_img; //캠핑장 메인 이미지
	
	
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	
	
	public int getCamp_id() {
		return camp_id;
	}
	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}
	
	public String getCamp_name() {
		return camp_name;
	}
	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}
	
	
	public String getCamp_addr() {
		return camp_addr;
	}
	public void setCamp_addr(String camp_addr) {
		this.camp_addr = camp_addr;
	}
	
	
	public String getFacility() {
		return facility;
	}
	public void setFacility(String facility) {
		this.facility = facility;
	}
	
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	public String getCamp_img() {
		return camp_img;
	}
	public void setCamp_img(String camp_img) {
		this.camp_img = camp_img;
	}
	
	
	public int getCamp_like_id() {
		return camp_like_id;
	}
	public void setCamp_like_id(int camp_like_id) {
		this.camp_like_id = camp_like_id;
	}
	
	

}
