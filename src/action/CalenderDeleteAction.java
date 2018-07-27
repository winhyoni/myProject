package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Calender;
import model.CalenderDao;

public class CalenderDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = request.getParameter("no");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String memberno = (String) request.getSession().getAttribute("login");
		String msg = "삭제 권한이 없습니다.";
		String url = "calenderinfo.me?no="+no+"&year="+year+"&month="+month;
		
		Calender cal = new CalenderDao().selectOne(Integer.parseInt(no));
		
		if(cal.getMemberno().equals(memberno)) {
			int result = new CalenderDao().delete(no);
			if(result>0) {
				msg="삭제 성공";
				url="calender.me?year="+year+"&month="+month;
			}
		}
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
