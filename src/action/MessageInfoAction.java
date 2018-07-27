package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Message;
import model.MessageDao;

public class MessageInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sort = request.getParameter("sort");
		String no = request.getParameter("no");
		
		MessageDao dao = new MessageDao();
		Message mes = dao.selectOne(no);
		request.setAttribute("mes", mes);
		if(sort.equals("2")) {
			dao.update(no);
		}
		request.setAttribute("sort", sort);
		request.setAttribute("no", no);
		return new ActionForward(false, "messageinfo.jsp");
	}

}
