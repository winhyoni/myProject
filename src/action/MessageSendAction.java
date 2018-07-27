package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class MessageSendAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberno = (String) request.getSession().getAttribute("login");
		String sort=request.getParameter("sort");
		Member mem = new MemberDao().selectOne(memberno);
		request.setAttribute("mem", mem);
		request.setAttribute("sort", sort);
		return new ActionForward(false, "messagesend.jsp");
	}

}
