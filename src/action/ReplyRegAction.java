package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
import model.Reply;
import model.ReplyDao;

public class ReplyRegAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");
		String memberno = (String) request.getSession().getAttribute("login");
		String replycontent = request.getParameter("replycontent");
		String kindno = request.getParameter("kindno");
		try {
			ReplyDao dao = new ReplyDao();
			Member mem = new MemberDao().selectOne(memberno);
			Reply reply = new Reply();
			reply.setName(mem.getName());
			reply.setContent(replycontent);
			reply.setMemberno(memberno);
			reply.setNo(Integer.parseInt(no));
			int replyno = dao.maxreplyno();
			reply.setReplyno(++replyno);
			reply.setRef(replyno);
			dao.insert(reply);
	 		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "boardinfo.me?no="+no+"&pageNum="+pageNum+"&kindno="+kindno);
	}

}
