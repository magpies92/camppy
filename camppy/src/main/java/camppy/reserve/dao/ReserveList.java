package camppy.reserve.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import camppy.reserve.dao.MyReserveDAO;
import camppy.reserve.dao.MyReserveDTO;

public class ReserveList implements Action {

	@Override
	public ActionReserve execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductList execute()");
		
		 HttpSession session = request.getSession();
		 int res_id = (int)session.getAttribute("res_id");
		
		 MyReserveDAO dao= new MyReserveDAO();
		 int pageSize=10;
		 String pageNum=request.getParameter("pageNum");
		 if(pageNum==null){
		 	 pageNum="1";
		 	}

		 int currentPage=Integer.parseInt(pageNum);
		 int startRow=(currentPage-1)*pageSize+1;
		 int endRow= startRow+pageSize-1;

		 List<MyReserveDTO> List=dao.getMyReserveList1(startRow, pageSize, res_id);

		 int pageBlock=10;
		 int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		 int endPage=startPage+pageBlock-1;
		 int count = List.size();
		 int pageCount=count/pageSize+(count%pageSize==0?0:1);
		 if(endPage > pageCount){
			 endPage = pageCount;
		 }		
		 
		 request.setAttribute("productList1", List);
		 request.setAttribute("currentPage", currentPage);
		 request.setAttribute("pageBlock", pageBlock);
		 request.setAttribute("startPage", startPage);
		 request.setAttribute("endPage", endPage);
		 request.setAttribute("pageCount", pageCount);
			System.out.println(List.size());
			
		 // 이동
		 ActionReserve forward = new ActionReserve();
		 forward.setPath("mypageReserve/mypage_reserve.jsp");
		 forward.setRedirect(false);
			
		 return forward;
	}

}
