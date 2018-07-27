package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Calender;
import model.CalenderDao;

public class CalenderInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		Calender cal = new CalenderDao().selectOne(no);
		request.setAttribute("cal", cal);
		request.setAttribute("year", year);
		request.setAttribute("month", month);

		return new ActionForward(false, "calenderinfo.jsp");
	}

}
