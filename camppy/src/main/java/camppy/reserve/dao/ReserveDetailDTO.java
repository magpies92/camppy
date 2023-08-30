package camppy.reserve.dao;

public class ReserveDetailDTO {
	
	private String camp_name;
	private String member_id;
	private String tel;
	private String camp_price;
	private String checkin_date;
	private String checkout_date;
	private String max_men;
	
	
	
	public String getCamp_name() {
		return camp_name;
	}
	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCamp_price() {
		return camp_price;
	}
	public void setCamp_price(String camp_price) {
		this.camp_price = camp_price;
	}
	public String getCheckin_date() {
		return checkin_date;
	}
	public void setCheckin_date(String checkin_date) {
		this.checkin_date = checkin_date;
	}
	public String getCheckout_date() {
		return checkout_date;
	}
	public void setCheckout_date(String checkout_date) {
		this.checkout_date = checkout_date;
	}
	public String getMax_men() {
		return max_men;
	}
	public void setMax_men(String max_men) {
		this.max_men = max_men;
	}
	
	
	
	
	
}
