package camppy.member;

import java.sql.Timestamp;

public class MemberDTO {
	// 전달 할 데이터를 담는곳 => 멤버변수 정의
	// 전달 할 데이터는 아주 중요한 데이터 => 멤버변수 private 은닉
	// 외부에서 접근 할 수 있는 set,get메서드 
	private String id;
	private String pass;
	private String name;
	private Timestamp date;
	private String nick;
	private String phone;
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	// alt shift s -> r
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
	
	
}
