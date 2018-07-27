package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Message;
import model.MessageDao;


public class MessageSendListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageNum=1;
		int limit = 10;
		String sort = request.getParameter("sort");
		if(request.getParameter("pageNum") != null) {
			try {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}catch (NumberFormatException e) {
				request.setAttribute("msg", "���ڸ� �Է°����մϴ�.");
				request.setAttribute("url", "messagesendlist.me?sort="+sort);
				return new ActionForward(false, "../alert.jsp");
			}
			
		}
		
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		
		String memberno = (String) request.getSession().getAttribute("login");
		if(column == null || column.equals("")) {
			column = null;
		}
		if(find == null || find.equals("")) {
			find = null;
		}
		
		request.setAttribute("find", find);
		int sendmescount = 0;
		List<Message> list = new ArrayList<Message>();
		if(sort.equals("1")) {
			sendmescount = new MessageDao().sendmessageCount(column,find,memberno);
			
			list = new MessageDao().sendmessagelist(pageNum, limit, column, find, memberno);
		}else {
			sendmescount = new MessageDao().receivemessageCount(column,find,memberno);
			
			list = new MessageDao().receivemessagelist(pageNum, limit, column, find, memberno);
		}
		
		int maxpage = (int)((double)sendmescount/limit + 0.95);//�ʿ��� ������ ��
		int startpage = (((int)(pageNum/10.0 + 0.9))-1) * 10 + 1;//ȭ�鿡 ������ ����������
		int endpage = startpage + 9;//ȭ�鿡 ������ ��������
		if(endpage>maxpage) endpage = maxpage;
		int sendmesnum = sendmescount - ((pageNum-1)*limit);//ȭ�鿡 ��µ� �Խù� ��ȣ
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("sendmescount",sendmescount);
		request.setAttribute("sendmesnum", sendmesnum);
		request.setAttribute("sort", sort);
		return new ActionForward(false, "messagesendlist.jsp");
	}

}
