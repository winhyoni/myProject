package action;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		Calendar cal = Calendar.getInstance();
		cal.set(year,month-1,1);
		int lastday = cal.getActualMaximum(Calendar.DATE);
		int dd = cal.get(Calendar.DAY_OF_WEEK) - 1;
		request.setAttribute("lastday", lastday);
		request.setAttribute("dd", dd);
		request.setAttribute("month", month);
		request.setAttribute("year", year);
		return new ActionForward(false, "loginForm.jsp");
	}

}
