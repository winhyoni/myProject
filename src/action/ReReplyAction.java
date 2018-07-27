package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
import model.Reply;
import model.ReplyDao;

public class ReReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String replyno = request.getParameter("replyno");
		String no = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");
		String memberno = (String) request.getSession().getAttribute("login");
		String kindno= request.getParameter("kindno");
		try {
			ReplyDao dao = new ReplyDao();
			Member mem = new MemberDao().selectOne(memberno);
			Reply reply = dao.select(replyno);
			reply.setContent(request.getParameter("recontent"));
			reply.setName(mem.getName());
			dao.replyreg(reply);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "boardinfo.me?no="+no+"&pageNum="+pageNum+"&kindno="+kindno);
	}

}
