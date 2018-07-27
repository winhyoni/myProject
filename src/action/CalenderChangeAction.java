package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Calender;
import model.CalenderDao;

public class CalenderChangeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = request.getParameter("no");
		String kindno = request.getParameter("kindno");
		Calender cal = new CalenderDao().selectOne(Integer.parseInt(no));
		request.setAttribute("cal", cal);
		request.setAttribute("kindno", kindno);
		return new ActionForward(false, "updatecal.jsp");
	}

}
