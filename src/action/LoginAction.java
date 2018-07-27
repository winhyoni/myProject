package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;


public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberno = request.getParameter("memberno");
		String pass = request.getParameter("pass");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		if(memberno==null || memberno.equals("")) {
			request.setAttribute("msg", "아이디를 입력해주세요.");
			request.setAttribute("url", "loginForm.me?year="+year+"&month="+month);
			return new ActionForward(false, "../alert.jsp");
		}else if(pass==null || pass.equals("")) {
			request.setAttribute("msg", "비밀번호를 입력해주세요.");
			request.setAttribute("url", "loginForm.me?year="+year+"&month="+month);
			return new ActionForward(false, "../alert.jsp");
		}
		
		Member mem = new MemberDao().selectOne(memberno);
		String msg = "아이디가 없습니다";
		String url = "loginForm.me?year="+year+"&month="+month;
		
		if(mem != null) {
	         //3.pass 검증하기
	         if(pass.equals(mem.getPass())) {
	            msg = mem.getName() + "로그인 하셨습니다.";
	            url = "../main.me?year="+year+"&month="+month;
	            //4.session login정보 등록하기
	            request.getSession().setAttribute("login", memberno);
	         } else {
	            msg = "비밀번호가 틀립니다.";
	            url="loginForm.me?year="+year+"&month="+month;
	         }
	      }
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
