package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Message;
import model.MessageDao;

public class MessageDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sort = request.getParameter("sort");
		String no = request.getParameter("no");
		String msg = "삭제 실패";
		String url = "messageinfo.me?sort="+sort+"&no="+no;
		
		MessageDao dao = new MessageDao();
		
		if(sort.equals("1")) {
			int result = dao.senddelete(no);
			if(result>0) {
				msg = "삭제 성공";
				url = "messagesendlist.me?sort="+sort;
			}
		}else {
			int result = dao.receivedelete(no);
			if(result>0) {
				msg = "삭제 성공";
				url = "messagesendlist.me?sort="+sort;
			}
		}
		
		Message mes = new MessageDao().selectOne(no);
		if(mes.getSenddelete()==mes.getReceivedelete()) {
			dao.delete(no);
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
