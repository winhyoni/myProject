package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			request.getSession().invalidate(); //전부 삭제
			request.setAttribute("msg", "로그아웃 되었습니다.");
			request.setAttribute("url", "login/loginForm.me?year="+year+"&month="+month);
			return new ActionForward(false, "alert.jsp");
	}

}
