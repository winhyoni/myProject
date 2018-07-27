package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.Message;
import model.MessageDao;


public class MessageSendRegAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/")+"model2/message/file/";
		
		MultipartRequest multi;
		try {
	 		multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
	 		String sort = multi.getParameter("sort");
	 		Message mes = new Message();
	 		mes.setReceivemem(multi.getParameter("receivemem"));
	 		mes.setSendmem(multi.getParameter("sendmem"));
	 		mes.setSubject(multi.getParameter("subject"));
	 		mes.setContent(multi.getParameter("content"));
	 		mes.setFile1(multi.getFilesystemName("file1"));
	 		int num = new MessageDao().maxNum();
	 		mes.setNo(++num);
	 		mes.setKindno(0);
	 		mes.setSenddelete(0);
	 		mes.setReceivedelete(0);
	 		int result = new MessageDao().insert(mes);
	 		String msg = null;
	 		String url = "messagesend.me?sort="+sort;
	 		if(result>0) {
	 			msg = "등록완료";
	 			url = "messagesendlist.me?sort="+sort;
	 		}else {
	 			msg = "등록실패";
	 		}
	 		request.setAttribute("msg", msg);
	 		request.setAttribute("url", url);
	 		
	 	}catch (IOException e) {
			e.printStackTrace();
		}
	 	return new ActionForward(false, "../alert.jsp");
	}

}
