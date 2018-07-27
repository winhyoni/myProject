package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Board;
import model.BoardDao;
import model.Member;
import model.MemberDao;

public class BoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageNum=1;
		int limit = 10;
		String kindno=request.getParameter("kindno");
		if(request.getParameter("pageNum") != null) {
			try {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}catch (NumberFormatException e) {
				request.setAttribute("msg", "���ڸ� �Է°����մϴ�.");
				request.setAttribute("url", "boardlist.me");
				return new ActionForward(false, "../alert.jsp");
			}
			
		}
		
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column == null || column.equals("")) {
			column = null;
		}
		if(find == null || find.equals("")) {
			find = null;
		}
		
		request.setAttribute("find", find);
		
		int boardcount = new BoardDao().boardCount(column,find,Integer.parseInt(kindno));
		List<Board> list = new ArrayList<Board>();
		list = new BoardDao().boardlist(pageNum, limit, column, find, Integer.parseInt(kindno));
		int maxpage = (int)((double)boardcount/limit + 0.95);//�ʿ��� ������ ��
		int startpage = (((int)(pageNum/10.0 + 0.9))-1) * 10 + 1;//ȭ�鿡 ������ ����������
		int endpage = startpage + 9;//ȭ�鿡 ������ ��������
		if(endpage>maxpage) endpage = maxpage;
		int boardnum = boardcount - ((pageNum-1)*limit);//ȭ�鿡 ��µ� �Խù� ��ȣ
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardcount",boardcount);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("kindno", kindno);
		return new ActionForward(false, "boardlist.jsp?kindno="+kindno);
	}
	
}
