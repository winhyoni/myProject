package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Reply;
import model.ReplyDao;

public class UpdateReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String replyno = request.getParameter("replyno");
		String no = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");
		String updatecontent = request.getParameter("updatecontent");
		String memberno = (String) request.getSession().getAttribute("login");
		String kindno = request.getParameter("kindno");
		Reply replymem = new ReplyDao().select(replyno);
		try {
			if(replymem.getMemberno().equals(memberno)) {
				Reply reply = new Reply();
				reply.setReplyno(Integer.parseInt(replyno));
				reply.setContent(updatecontent);
				ReplyDao dao = new ReplyDao();
				dao.update(reply);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "boardinfo.me?no="+no+"&pageNum="+pageNum+"&kindno="+kindno);
	}

}
