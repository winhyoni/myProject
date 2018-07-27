package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Reply;
import model.ReplyDao;

public class ReplyDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String replyno = request.getParameter("replyno");
		String no = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");
		String memberno = (String) request.getSession().getAttribute("login");
		String kindno = request.getParameter("kindno");
		try {
			ReplyDao dao = new ReplyDao();
			Reply reply = new Reply();
			reply = dao.select(replyno);
			if(reply.getMemberno().equals("memberno") || memberno.equals("000000")) {
				dao.delete(replyno);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "boardinfo.me?no="+no+"&pageNum="+pageNum+"&kindno="+kindno);
	}

}
