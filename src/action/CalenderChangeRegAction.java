package action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Calender;
import model.CalenderDao;

public class CalenderChangeRegAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = request.getParameter("no");
		String kindno = request.getParameter("kindno");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String msg = "날짜를 확인하세요!";
		String url = "calenderchange.me?kindno="+kindno+"&no="+no;
		
		String regdate = year+"-"+month+"-"+day;
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(regdate);
		
		if(month.equals("02")) {
			if(day.equals("29") || day.equals("30") || day.equals("31")) {
				request.setAttribute("msg", msg);
		 		request.setAttribute("url", url);
		 		return new ActionForward(false, "../alert.jsp");
			}
		}
		if(month.equals("04") || month.equals("06") || month.equals("09") || month.equals("11")) {
			if(day.equals("31")) {
				request.setAttribute("msg", msg);
		 		request.setAttribute("url", url);
		 		return new ActionForward(false, "../alert.jsp");
			}
		}
		
		Calender cal = new Calender();
		cal.setNo(Integer.parseInt(no));
		cal.setSubject(subject);
		cal.setContent(content);
		cal.setRegdate(date);

		int result = new CalenderDao().update(cal);
		if(result>0) {
			msg="수정성공";
			url="calender.me?year="+year+"&month="+month;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
