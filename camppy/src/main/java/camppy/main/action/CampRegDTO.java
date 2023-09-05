package camppy.main.action;

import java.sql.Timestamp;

public class CampRegDTO {
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	private Timestamp date;		
	
	private String campname;
	private String shortintro;
	
	private String campaddr;
	
	private String tel;
	private String environment;
	private String camptype;
	private String season;
	private String runtime;
	private String homepage;
	private String facility;
	private String campimg;
	private String bankaccount;
	private String bankname;
	private int campprice;
	private String doo;
	private String mapx;
	private String mapy;
	private int campid;
	private String intro;
	private String[] camppic = new String[5];			
	private String[] camptag = new String[7];
	public void setCamptag(String[] camptag) {
		this.camptag = camptag;
	}
	public String[] getCamptag() {
		return camptag;
	}
	public String[] getCamppic() {
		return camppic;
	}

	public void setCamppic(String[] camppic) {
		this.camppic = camppic;
	}

	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	
	public int getCampid() {
		return campid;
	}
	public void setCampid(int campid) {
		this.campid = campid;
	}
	public String getDoo() {
		return doo;
	}
	public void setDoo(String doo) {
		this.doo = doo;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	private String sigungu;
	public int getCampprice() {
		return campprice;
	}
	public void setCampprice(int campprice) {
		this.campprice = campprice;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getCampname() {
		return campname;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getBankaccount() {
		return bankaccount;
	}
	public void setBankaccount(String bankaccount) {
		this.bankaccount = bankaccount;
	}
	
	public void setCampname(String campname) {
		this.campname = campname;
	}
	public String getShortintro() {
		return shortintro;
	}
	public void setShortintro(String shortintro) {
		this.shortintro = shortintro;
	}
	
	public String getCampaddr() {
		return campaddr;
	}
	public void setCampaddr(String campaddr) {
		this.campaddr = campaddr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEnvironment() {
		return environment;
	}
	public void setEnvironment(String environment) {
		this.environment = environment;
	}
	public String getCamptype() {
		return camptype;
	}
	public void setCamptype(String camptype) {
		this.camptype = camptype;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	
	public String getFacility() {
		return facility;
	}
	public void setFacility(String facility) {
		this.facility = facility;
	}
	public String getCampimg() {
		return campimg;
	}
	public void setCampimg(String campimg) {
		this.campimg = campimg;
	}
	
	
	
	
	
}
