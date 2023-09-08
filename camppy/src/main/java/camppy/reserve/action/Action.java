package camppy.reserve.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 클래스 만들기위한 부모의 공통적인 틀
public interface Action {
	//추상메서드  : 부모의 공통적인 메서드 틀
	// 리턴할형 이동정보를 담아서 리턴
	public ActionReserve execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
