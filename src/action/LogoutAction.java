package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			request.getSession().invalidate(); //���� ����
			request.setAttribute("msg", "�α׾ƿ� �Ǿ����ϴ�.");
			request.setAttribute("url", "login/loginForm.me?year="+year+"&month="+month);
			return new ActionForward(false, "alert.jsp");
	}

}
