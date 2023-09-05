package camppy.reserve.dao;

public class ActionReserve {
//	String path ="주소정보";
//	boolean isRedirect = true;
	// true => response.sendRedirect()
	// false => dispatcher.forward() 
	
	private String path;
	private boolean isRedirect;
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
	
}
