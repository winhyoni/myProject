package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class EmpDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		
		String memberno = request.getParameter("memberno");
		String name = request.getParameter("name");
		String msg="없는 사원 번호 입니다.";
		String url="empdelete.jsp";
		if(memberno==null || memberno.equals("")) {
			request.setAttribute("msg", "아이디를 입력해주세요.");
			request.setAttribute("url", "empdelete.jsp");
			return new ActionForward(false, "../alert.jsp");
		}else if(name==null || name.equals("")) {
			request.setAttribute("msg", "이름을 입력해주세요.");
			request.setAttribute("url", "empdelete.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		Member mem = new MemberDao().selectOne(memberno);
		
		if(mem != null) {
	         //3.pass 검증하기
	         if(name.equals(mem.getName())) {
	        	 int result = new MemberDao().delete(mem);
	        	 if(result > 0) {
	        		 msg = "삭제성공";
		             url = "../main.me?year="+year+"&month="+month;
	        	 }else {
	        		 msg="삭제 오류";
	        	 }
	        	 
	         } else {
	            msg = "사원번호와 이름이 일치하지 않습니다.";
	            url="empdelete.jsp?year="+year+"&month="+month;
	         }
	      }
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
