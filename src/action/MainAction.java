package action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Calender;
import model.CalenderDao;
import model.Member;
import model.MemberDao;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberno = (String) request.getSession().getAttribute("login");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		if(request.getSession().getAttribute("login") != null) {
			Calendar cal = Calendar.getInstance();
			cal.set(year,month-1,1);
			int lastday = cal.getActualMaximum(Calendar.DATE);
			int dd = cal.get(Calendar.DAY_OF_WEEK) - 1;
			request.setAttribute("lastday", lastday);
			request.setAttribute("dd", dd);
			request.setAttribute("month", month);
			request.setAttribute("year", year);
			
			List<Calender> list = new ArrayList<Calender>();
			list = new CalenderDao().calenderlist(memberno);
			request.setAttribute("list", list);
			
			Member mem = new MemberDao().selectOne(memberno);
			request.setAttribute("position", mem.getPosition());
			request.setAttribute("dpt", mem.getDpt());
			request.setAttribute("name", mem.getName());
			request.setAttribute("birth", mem.getJumin().substring(0, 6));
			request.setAttribute("picture", mem.getPicture());
			return new ActionForward(false, "main.jsp");
		}else {
			request.setAttribute("msg", "로그인이 안되있습니다.");
			request.setAttribute("url", "login/loginForm.me?year="+year+"&month="+month);
			return new ActionForward(false, "alert.jsp");
		}
	}

}
